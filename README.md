# Idle Skiller

A 2D single-player idle/incremental game inspired by RuneScape 3. Built as a single self-contained HTML file — open it in a browser and play, no build step required.

## How to play

Open `idle-game.html` in any modern browser. That's it.

Progress is saved automatically to `localStorage` every 30 seconds. Offline gains are applied when you reopen the file (capped at 12 hours).

## Current state

**8 of 29 skills implemented.** The game is actively in development.

### Implemented skills

| Skill | Type | Actions | Notes |
|---|---|---|---|
| Woodcutting | Gathering | 9 trees (Tree → Eternal magic) | Tool upgrades (bronze axe → T100) |
| Mining | Gathering | 12 rocks (Copper → Primal) | Tool upgrades (bronze pickaxe → T100) |
| Fishing | Gathering | 16 fish (Shrimps → Sailfish) | Rod upgrades (wood → T99); bonus Kraken's Beak drop |
| Smithing | Artisan | 10 bars (Bronze → Primal) | Consumes ore; produces bars used by tool upgrades |
| Firemaking | Artisan | 10 log tiers | Consumes logs |
| Cooking | Artisan | 16 fish (Shrimps → Sailfish) | Burn mechanic (scales with level); cooking gauntlets halve burn chance |
| Fletching | Artisan | 47 actions | Headless arrows, unstrung bows, unstrung crossbows, arrow assembly; splinter mechanic on log consumption |
| Dungeoneering | Support | 12 floors (F1 → Occult) | Earns tokens; token shop for passive bonuses and special items |

### Engine features

- **0.6s game tick** — matches RuneScape's tick rate
- **Real RS3 XP curve** — level 2 = 83 XP, level 99 ≈ 13M XP, level 120 cap supported
- **Ingredient system** — actions can require and consume items from inventory
- **Multi-item production** — a single action can produce batches (e.g. 15–120 headless arrows per log)
- **Failure mechanics** — cooking burns fish; fletching splinters logs. Both scale from ~20% at level requirement to 0% at level requirement +10
- **Tool upgrade shop** — per-skill tool tiers that increase tick speed
- **Offline progress** — calculates gains for up to 12h while the tab was closed
- **Save/load/autosave** — localStorage with in-memory fallback for sandboxed environments
- **Bonus drops** — rare item drops on action completion (e.g. Kraken's Beak from fishing)
- **Level-gated content** — actions unlock automatically as skill levels increase

### Not yet implemented (planned)

**Gathering:** Farming, Hunter, Divination

**Artisan:** Crafting, Runecrafting, Construction, Herblore
- Fletching stringing (bowstring + unstrung bow → strung bow, 0 XP) — deferred
- Smithing arrowheads (enables arrow assembly in Fletching) — deferred

**Combat:** Attack, Strength, Defence, Constitution, Ranged, Magic, Prayer, Summoning, Necromancy

**Support:** Agility, Thieving, Slayer, Archaeology

**Elite:** Invention

**Other:** PWA manifest + service worker (installable on mobile), Capacitor wrap for app stores

## Tech stack

Plain HTML + CSS + JavaScript. Single file, no dependencies, no build step.

Cross-platform target: PWA first (PC/iOS/Android from browser), then Capacitor for app stores if needed.
