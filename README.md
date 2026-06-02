# Idle Skiller

A 2D single-player idle/incremental game inspired by classic idle RPG gameplay.

**Legal notice:** Idle Skiller is an independent, non-commercial fan project. It is not affiliated with, endorsed by, or connected to Jagex Ltd. in any way. All character, location, and item names are original; any similarity to existing game content is coincidental.

Built as a single self-contained HTML file — open it in a browser and play, no build step required.

## How to play

Open `idle-game.html` in any modern browser. That's it.

Progress is saved automatically every 10 seconds to `localStorage`. Offline gains are applied when you reopen the file (capped at 12 hours).

Up to 5 named characters are supported. Use the **👤 Characters** button to switch slots, rename, or delete characters. **Export** copies a character to your clipboard (or downloads a `.json` file) for backup or transfer to another device; **Import** accepts that same text or file to create a new slot.

When creating a new character, choose between **Normal** (death restores HP and resets combat — no penalty) or **Hardcore** (one life only — if HP hits 0, the character is permanently dead and cannot be played again). Dead Hardcore characters remain in the list as a tombstone showing their final total level.

## Current state

**26 of 27 skills implemented.** The game is actively in development.

### Implemented skills

#### Gathering

| Skill | Max Lv | Actions | Notes |
|---|---|---|---|
| Woodcutting | 110 | 13 trees (Tree → Eternal magic) | Tool upgrades (bronze axe → T100); bird's nest bonus drops |
| Mining | 110 | 13 rocks (Copper → Primal + Rune essence) | Tool upgrades (bronze pickaxe → T100); geode bonus drops |
| Fishing | 99 | 16 fish (Shrimps → Sailfish) | Tool upgrades (rod → Abyssal Rod); Kraken's Beak (capped at 1; blocked once Dragon Rod built) + Map to the Deep rare drops |
| Farming | 120 | 7 herb seeds | Background skill — grows in 5 min while you train anything else; harvest 3–15 herbs; auto-replant toggle; XP scales by seed tier (150–2000 per harvest); speed up with Herb Patch upgrade |
| Hunter | 99 | 15 actions | Bird Snare (raw bird meat), Deadfall (kebbit fur → Hunter Leather via Crafting), Box Trap (chinchompas), Net Trap (salamander weapons), Pitfall (kyatt fur); **passive impling spawns** (1% per trap action, tier scales with hunter level — Baby lv17, Earth lv36, Eclectic lv50, Nature lv62, Dragon lv83, Kingly lv91); all 6 jar types openable for loot |
| Divination | 99 | 10 wisps + 54 transmutations | Gathers energy; transmutes logs/ores/fish/gems up one tier; 10% breakdown chance → divine dust |

#### Artisan

| Skill | Max Lv | Actions | Notes |
|---|---|---|---|
| Smithing | 110 | 11 bar types (Bronze → Primal) + generated armour/weapons | Consumes ores; bars feed tool upgrades; batch crafting (×1 ×5 ×? ×100) |
| Firemaking | 110 | 10 log tiers | Consumes logs for XP only; 15% fire spirit bonus event |
| Cooking | 99 | 16 fish | Burn chance 20% → 0% over 10 levels above req; halved by Cooking Range upgrade |
| Fletching | 110 | 38 actions | Headless arrows, unstrung short/long bows, crossbows, arrow assembly; splinter mechanic (20% → 0%) |
| Crafting | 110 | 60 actions | Gem cutting (7), jewellery (rings + amulets), Leather Armour, Hunter Leather (kebbit + kyatt), Dragonhide (5 tiers), Mage Armour (3 tiers); batch crafting |
| Herblore | 120 | 18 actions | 6 potion types × 3 tiers (Lesser / Normal / Supreme); herbs from Farming |
| Runecrafting | 110 | 11 rune altars (Air → Soul) | Agility bonus speeds up crafting; +5 coming-soon infusion actions visible at lv 90+ |
| Construction | 99 | 10 plank types + 8 permanent upgrades | Upgrades unlock in-game buildings: Sawmill, Furnace, Cooking Range, Herb Patch, Study, Workshop, Manor, Altar |

#### Combat

| Skill | Max Lv | Notes |
|---|---|---|
| Melee | 120 | Primary combat style; trains Attack + Constitution |
| Ranged | 120 | Trains Ranged + Constitution |
| Magic | 120 | Trains Magic + Constitution |
| Defence | 99 | Gains XP in Defensive mode |
| Constitution | 99 | Starts at lv 10; gains XP on every kill (50% of action XP) |
| Prayer | 99 | Bury bones / use altar (×2.5 or ×3.5 XP); 16 active prayers across 4 tiers; drain system; protect prayers reduce damage 50% |

**Mobs:** 11 standard + 10 slayer-locked (Crawling Hand → Abyssal Demon) + 8 bosses (Goblin King, Giant Mole, Void Dragon, Leviathan Kings, Ancient Lich, Commander Solara, General Karg, The Harbinger)

**Quests:** Goblin Diplomacy — collect a Goblin Diplomatic Note from goblins (1/100 drop, guaranteed at 1000kc), then defeat the Goblin King quest boss (one-time, no drops, significantly harder than the regular version) to unlock the Goblin King as a repeatable boss. The Quests combat tab shows quest progress and the quest boss.

#### Support

| Skill | Max Lv | Actions | Notes |
|---|---|---|---|
| Agility | 99 | 7 courses (Verdant Trail → Crystal) | Scaled XP; Danger Trail drops PK coins; Crystal course requires quest + 70 Thieving; bonuses to Thieving pick/lock and Runecrafting speed |
| Thieving | 99 | 19 actions | Pickpocket (9 NPCs, catch/stun mechanic) + Locks (10 chests); seeds, gems, and coins from drops; agility gives extra loot chance |
| Slayer | 120 | 6 masters (Aldric → Duroc) | Task assignment system; 2–30 pts/task; kill-tracking per mob; task completion bonus XP; Points Shop (5 unlocks incl. boss tasks, XP boost, extended tasks) |
| Dungeoneering | 120 | 3 floor types | Time-based floors; earns tokens; token shop: Auto-Eat (500 tokens) |
| Archaeology | 120 | 6 dig sites, 18 artefacts | Artefact restoration grants permanent perks (up to 3 active); perks include XP%, speed%, stat boosts, HP regen |

#### Combat (continued)

| Skill | Max Lv | Actions | Notes |
|---|---|---|---|
| Summoning | 99 | 18 pouches | Craft pouches from charms (gold/green/crimson/blue) + secondary; charms drop from all combat mobs; 10-min familiar timer; auto-renew from inventory; passive effects: speed, XP, attack accuracy, drop rate, HP regen; Undead Familiars (lv 80–99) replace Necromancy content |

### Engine features

**Core**
- 0.6s game tick
- XP curve: level 2 = 83 XP, level 99 ≈ 13M, level 120 supported
- Autosave every 10 seconds (localStorage + in-memory fallback for sandboxed environments)
- Offline progress — calculates up to 12h of gains on load; "while you were away" popup

**Crafting / production**
- Ingredient system — actions consume items from inventory
- Batch crafting — ×1 / ×5 / ×? / ×100 buttons on all ingredient-consuming actions; batch counter shown in progress bar
- Failure mechanics — cooking burns, fletching splinters (both scale 20%→0% over 10 levels); Divination transmutation 10% flat breakdown
- Multi-output actions — single tick can produce varied quantities (e.g. headless arrows)

**Combat**
- HP / Constitution system with per-mob HP values
- 3 combat styles (Melee / Ranged / Magic) + Defensive mode (splits XP with Defence)
- Food queue with configurable auto-eat threshold (unlocked via DG shop)
- Active prayer drain system (per-tick drain based on equipped prayers)
- Slayer task kill-tracking with bonus XP on completion

**Progression**
- **Skillcapes** — 26 skill-specific capes (level 99 required, 99,000 coins each) with passive perks: gathering/artisan capes give +10% speed or +15% XP; combat capes give damage/defence/regen bonuses; support capes give thematic bonuses (prayer drain reduction, stun reduction, token gain, etc.)
- **Max Cape** — requires level 99 in all 26 skills, costs 10M coins; contains every skillcape perk simultaneously
- **Pets** — 33 equippable pets (26 from skilling at 1/5000, 7 from bosses at 1/500–1/1000); each grants a passive perk (+5% XP, +5% speed, or unique bonus); only one active at a time; tracked in Collection Log
- Tool upgrade shop, Construction upgrades, Dungeoneering token shop — all consolidated inside the 🏪 Shop overlay
- Slayer points shop — 5 permanent unlocks
- Archaeology perk system — up to 3 active perks from artefact restoration

**UI / QoL**
- Mobile-first layout: header collapses to title row + scrollable button strip on narrow screens; larger touch targets; equipment grid single-column on mobile
- Always-visible Farming, Slayer, Prayer, and Summoning sidebar panels (usable without navigating to the skill)
- Inventory grouped by category — Openable, Equipment, Pets, Food & Potions, Seeds & Herbs, Summoning Pouches, Summoning, Ores & Bars, Logs, Fish, Gems & Hides, Runes & Energy, Ammo, Hunter, Currency, Other
- Equipment panel with 11 slots (Head, Weapon, Offhand, Neck, Cape, Ring, Body, Gloves, Legs, Feet, Pet) and live stat totals
- Prayer HUD in sidebar
- Settings menu — Dark/Light theme, Compact mode, Hide locked actions, configurable log size
- Stop button always visible next to action progress bar
- **Achievement system** — 78 achievements across Skills, Total Level, Combat, Slayer, and Special categories; filter by All / Hide Completed / Hide Locked; locked achievements require prerequisites (slayer unlocks, quest completion, etc.)
- **Collection Log** — 25 drop sources across 5 categories (Woodcutting, Mining, Fishing, Agility, Hunter, Combat, Bosses, Pets); tracks per-item obtain counts; unobtained items shown greyed; global and per-source progress counters

**Bonus drops**
- Woodcutting: bird's nests (1%, 4 variants)
- Mining: geodes (5%, 3 tiers up to metamorphic with 1-in-99k hydrix)
- Fishing: Kraken's Beak (1% lv60+), Map to the Deep (1-in-100k lv85+)
- Firemaking: fire spirit QTE event (15% per burn)
- Hunter: passive impling jar (1% per trap action, tier by hunter level; 6 tiers from Baby to Kingly)
- All skills: respective skilling pet (1/5000 per action)
- All bosses: respective boss pet (1/500–1/1000 per kill)

### Not yet implemented (planned)

| Skill | Type |
|---|---|
| Invention | Elite |

**Deferred mechanics:** Fletching stringing (bowstring + unstrung → strung bow), Smithing arrowheads (enables arrow assembly), rune usage for Magic combat, PWA manifest + service worker for mobile install, Capacitor wrap for app stores

## Tech stack

Plain HTML + CSS + JavaScript. Single file (~5,800 lines), no dependencies, no build step.

Cross-platform target: PWA first (PC/iOS/Android from browser), then Capacitor for app stores if needed.
