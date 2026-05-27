# Idle Skiller — Project Context

## What this is
A **2D, single-player, idle/incremental game** inspired by RuneScape 3.
Goal: run on **PC, iPhone, and Android** from one codebase.

## Tech decisions (already made — don't relitigate unless asked)
- **Stack:** plain **HTML + CSS + JavaScript**, single self-contained file (`idle-game.html`).
- **Why web, not a game engine:** the developer is new to programming and building this
  mostly with AI assistance. Web gives the fastest feedback loop (open file → see result,
  no build step) and is the stack AI writes most reliably. An idle game is mostly UI, which
  is web's strength.
- **Cross-platform plan:** ship as a **PWA** first (installable on PC/iOS/Android straight
  from the browser, no app store, no Apple Developer account needed). Later, wrap the same
  code with **Capacitor** to publish in the App Store / Play Store if desired.
- **Reference game:** Melvor Idle (RuneScape-inspired idle game). Its v1 was built in JS/HTML/CSS
  and shipped to PC + iOS + Android — proof this approach works.
- **Priority right now:** make it WORK. Polish/visual design comes later.

## Current state of `idle-game.html`
Working features:
- **Woodcutting** is fully playable (7 trees: Tree → Oak → Willow → Maple → Yew → Magic → Elder, level-gated).
- **0.6s game tick** loop (RuneScape's tick), driven by setInterval.
- **Real RuneScape XP curve** (level 2 = 83 xp, level 99 = ~13M). See XP_TABLE.
- **Save / load / autosave** via localStorage, with an in-memory fallback so it never crashes
  in sandboxes that block storage. Persists fully when run as a real file.
- **Offline progress**: on load, computes elapsed time and applies gains for the active action,
  capped at 12h, then shows a "while you were away" popup.
- All **29 RS3 skills** are present as DATA in `SKILL_ROADMAP` (grouped + correct level caps),
  but only Woodcutting has `implemented:true` and real actions.

## File structure
`idle-game.html` is one file, organised into 9 numbered comment sections:
1 Config · 2 Game Data · 3 XP Math · 4 Storage · 5 State · 6 Core Loop · 7 Actions · 8 Render · 9 Wiring.

## Architecture rules (keep following these)
- **Data-driven.** Content lives in data, not code. Add a tree by adding a line to `ACTIONS.woodcutting`.
  Turn on a new skill by setting `implemented:true` in `SKILL_ROADMAP` and adding an `ACTIONS[skillId]` list.
- Keep the engine (loop, xp, render) separate from content (skills, items, actions).
- Save format must stay forward-compatible: loading an old save should not break when new skills are added
  (the load() function already merges fresh state).

## The 29 RuneScape 3 skills (the full roadmap)
- **Gathering:** Woodcutting(110, DONE), Mining(110), Fishing(99), Farming(120), Hunter(99), Divination(99)
- **Artisan:** Crafting(110), Fletching(110), Smithing(110), Cooking(99), Firemaking(110), Runecrafting(110), Construction(99), Herblore(120)
- **Combat:** Attack(120), Strength(120), Defence(99), Constitution(99, starts lvl 10), Ranged(120), Magic(120), Prayer(99), Summoning(99), Necromancy(120)
- **Support:** Agility(99), Thieving(99), Slayer(120), Dungeoneering(120), Archaeology(120)
- **Elite:** Invention(120)

## Suggested next steps (in rough order)
1. **Mining** — mirrors Woodcutting (gather an item). Easiest second skill; good for testing the "add a skill" flow.
2. **Firemaking** — first skill that CONSUMES an item (burns logs). Introduces item-as-input mechanic the whole economy needs.
3. Add a proper **inventory cap / bank** concept.
4. Make it a real **PWA**: add a `manifest.json` and a service worker so it's installable + works offline.
5. Visual/design pass (deferred on purpose).
6. (Later) Capacitor wrap for app stores.

## Working style
Explain changes in plain language — the developer is learning. Prefer small, testable steps.
Keep everything in the single file for now unless splitting is clearly warranted.
