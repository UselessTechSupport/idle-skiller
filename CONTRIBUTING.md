# Dev Setup — IdleWright

Everything you need to pick up development on a new machine.

---

## Repos

Three remotes, one working directory:

| Remote | Repo | Purpose |
|--------|------|---------|
| `origin` | `idle-skiller` (public) | Public-facing game repo — game files only |
| `dev` | `idle-skiller-dev` (private) | Development source of truth — most complete |
| `app` | `idlewright-app` (private) | Capacitor project — completely separate, only contains app build files + `www/index.html` |

**Clone dev to start working:**
```bash
git clone https://github.com/UselessTechSupport/idle-skiller-dev.git "idle project"
cd "idle project"
```

**Add the other two remotes:**
```bash
git remote add origin https://github.com/UselessTechSupport/idle-skiller.git
git remote add app    https://github.com/UselessTechSupport/idlewright-app.git
git fetch --all
```

---

## What lives where

| File | dev | origin | app |
|------|-----|--------|-----|
| `idle-game.html` | ✅ | ✅ | ❌ |
| `README.md` | ✅ | ✅ | ❌ |
| `CONTRIBUTING.md` | ✅ | ✅ | ❌ |
| `publish.sh` / `update-app.sh` | ✅ | ✅ | ❌ |
| `www/index.html` | ❌ | ❌ | ✅ |
| `android/`, `ios/`, Capacitor config | ❌ | ❌ | ✅ |

The game repo and app repo have **independent git histories**. Never merge one into the other.

---

## Local guardrails

These prevent accidentally committing app build files into the game repo. Set them up once per machine — they live in `.git/` and are not tracked.

**1. Exclude `www/` from staging:**
```bash
echo -e "\n# App-repo files — belong in idlewright-app, not here\nwww/" >> .git/info/exclude
```

**2. Pre-commit hook — blocks accidental `www/` commits:**
```bash
cat > .git/hooks/pre-commit << 'HOOK'
#!/bin/bash
staged=$(git diff --cached --name-only)
if echo "$staged" | grep -q '^www/'; then
  other_www=$(echo "$staged" | grep '^www/' | grep -v '^www/index\.html$')
  if [ -n "$other_www" ]; then
    echo ""
    echo "  ✗ COMMIT BLOCKED: unexpected www/ files staged:"
    echo "$other_www" | sed 's/^/      /'
    echo "    These belong in idlewright-app. Accidentally merged from app remote?"
    echo "    Undo: git reset --hard HEAD~1"
    echo ""
    exit 1
  fi
fi
HOOK
chmod +x .git/hooks/pre-commit
```

---

## Push workflow

**Checkpoint to dev only:**
```bash
git push dev master
```

**Publish to dev + origin (public):**
```bash
git pub
# or: bash publish.sh
```

Set up the alias once per machine:
```bash
git config alias.pub '!bash publish.sh'
```

**Update the app build** (only when you want to trigger a new app build):
```bash
bash update-app.sh
```

This copies the current `idle-game.html` into the `app` repo's `www/index.html` and pushes — completely separate from the game push.

---

## The game

Everything lives in one file: `idle-game.html`

Open it in any browser — no build step, no server, no dependencies. Changes to `idle-game.html` are the only changes that matter for gameplay.

---

## Rules

- **Never** `git merge app/master` into your working branch — the app repo has a completely different history. If you accidentally do this, undo with `git reset --hard HEAD~1`.
- **Never** push `www/`, `android/`, `ios/`, or Capacitor files to dev or origin — the `.gitignore` and pre-commit hook will stop you, but be aware.
- `publish.sh` pushes game commits to dev + origin only.
- `update-app.sh` is the only way to update the app repo — it pushes to `app` independently.
