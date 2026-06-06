# Dev Setup — IdleWright

Everything you need to pick up development on a new machine.

---

## Repos

Three remotes, one working directory:

| Remote | Repo | Purpose |
|--------|------|---------|
| `origin` | `idle-skiller` (public) | Public-facing game repo |
| `dev` | `idle-skiller-dev` (private) | Development — game commits only, no app build files |
| `app` | `idlewright-app` (private) | Capacitor project — builds the Android/iOS app |

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

## Local guardrails

These prevent accidentally committing app build files to dev. Set them up once per machine — they live in `.git/` and are not tracked.

**1. Exclude `www/` from staging:**
```bash
echo -e "\n# App-repo files — belong in idlewright-app, not here\nwww/" >> .git/info/exclude
```

**2. Pre-commit hook — blocks accidental `www/` commits:**
```bash
cp .git/hooks/pre-commit.sample .git/hooks/pre-commit 2>/dev/null || true
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

**For dev only** (quick checkpoint, no public release):
```bash
git push dev master
```

**To publish everywhere** (public + app sync):
```bash
git pub
# or: bash publish.sh
```

`git pub` does this automatically:
1. Pushes game commits to dev
2. Copies `idle-game.html` → `www/index.html` and commits if changed
3. Pushes to origin (public)
4. Pushes to app (triggers CI build)

Set up the `git pub` alias (run once per machine):
```bash
git config alias.pub '!bash publish.sh'
```

---

## The game

Everything lives in one file: `idle-game.html`

Open it in any browser — no build step, no server, no dependencies. Changes to `idle-game.html` are the only changes that matter for gameplay.

`www/index.html` is a copy of `idle-game.html` used by the Capacitor app build. Don't edit it directly.

---

## Rules

- **Never** `git merge app/master` or `git merge origin/master` into your working branch — this pulls in Capacitor history. If you need to sync, `git pull dev master`.
- **Never** push `www/` files to dev (the hook will stop you, but still).
- `publish.sh` is the only intended way to push to origin + app together.
