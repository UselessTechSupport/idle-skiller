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

**All 26 skills implemented.** The game is actively in development.

### Implemented skills

#### Gathering

| Skill | Max Lv | Actions | Notes |
|---|---|---|---|
| Woodcutting | 110 | 13 trees (Tree → Eternal magic) | Tool upgrades (bronze axe → T100); bird's nest bonus drops |
| Mining | 110 | 13 rocks (Copper → Primal + Rune essence) | Tool upgrades (bronze pickaxe → T100); geode bonus drops |
| Fishing | 99 | 16 fish (Shrimps → Sailfish) | Tool upgrades (rod → Abyssal Rod); Kraken's Beak (capped at 1; blocked once Dragon Rod built) + Map to the Deep rare drops |
| Farming | 120 | 7 herb seeds + 6 tree seeds | Background skill — two independent patches (herb + tree); herb patch grows in 5 min, harvest 3–15 herbs; tree patch grows in 1–12 hours (acorn → elder, Farming lv 15–90 required), harvest 3–15 logs; auto-replant toggle on both; XP = seed tier × qty harvested; speed up herb patch with Herb Patch upgrade |
| Hunter | 99 | 15 actions | Bird Snare (raw bird meat), Deadfall (swifttail fur → Hunter Leather via Crafting), Box Trap (chinchompas), Net Trap (salamander weapons), Pitfall (panther pelt / jaguar fur); **passive impling spawns** (1% per trap action, tier scales with hunter level — Baby lv17, Earth lv36, Eclectic lv50, Nature lv62, Dragon lv83, Kingly lv91); all 6 jar types openable for loot; **Sabre jaguar tooth** (1/1000 from Sabre jaguar pitfall — unique 2-tick melee weapon with 30% extra miss chance) |
| Divination | 99 | 10 wisps + 54 transmutations + 14 magic weapons | Gathers energy; transmutes logs/ores/fish/gems up one tier; 10% breakdown chance → divine dust; **channel energy into logs** to craft magic weapons — 7 wands (1H, 3-tick, lv1–80) + 7 staffs (2H, 4-tick, lv1–80); top tier magic_wand (+42 mage, 8% bonus hit) and magic_staff (+55 mage, 5% bonus hit) |

#### Artisan

| Skill | Max Lv | Actions | Notes |
|---|---|---|---|
| Smithing | 110 | 11 bar types (Bronze → Primal) + generated armour/weapons + 6 arrowhead tiers + 10 crossbow brace tiers | Consumes ores; bars feed tool upgrades, arrowhead smithing (1 bar → 15 arrowheads, Bronze–Rune), and crossbow brace smithing (2 bars → 1 brace, Bronze–Elder rune); batch crafting |
| Firemaking | 110 | 10 log tiers | Consumes logs for XP only; 15% fire spirit QTE event — catch it for an openable spirit with herb seeds, fire runes, and the rare **Boots of Ash** (feet slot, 3% chance to save a log per burn) |
| Cooking | 99 | 16 fish | Burn chance 20% → 0% over 10 levels above req; halved by Cooking Range upgrade |
| Fletching | 110 | 77 actions | 10 individual headless arrow actions (Logs → Eternal magic; 15–120 arrows per log; Make 1/5/X/All batch support), unstrung short/long bows, crossbow stocks (each requires a matching crossbow brace smithed from 2 bars), arrow assembly (Bronze–Dragon), stringing (10 shortbow + 10 longbow tiers), crossbow stringing (10 tiers; all require bowstring from shop); splinter mechanic (20% → 0%); dragon arrowheads drop from drakes |
| Crafting | 110 | 62 actions | Gem cutting (7), jewellery (8 rings + 8 amulets + 2 silver slayer rings), Leather Armour (cowhide from Cows; 1× per piece, 3× body, 2× chaps), Hunter Leather (kebbit + kyatt), Dragonhide (5 tiers), Mage Armour (3 tiers — cloth lv20, splitbark lv55, lunar lv65; materials buyable from Shop); batch crafting; all jewelry has sell prices and unique perks (see tooltips) |
| Herblore | 120 | 19 actions | 6 potion types × 3 tiers (Lesser / Normal / Supreme) + **Master combat potion** (lv 97); herbs from Farming; drink from inventory — attack/defence/ranging/magic potions give +5/10/15% combat boost for 5 min; prayer potions restore 25/50/100% of prayer points; summoning potions extend familiar by 2/5/10 min; master combat potion requires 1× each supreme combat potion + burnt food + divine dust + wood pulp — grants +20% all combat stats for 10 min |
| Runecrafting | 110 | 11 rune altars (Air → Soul) + 5 infusions (lv90–110) | Agility bonus speeds up crafting; infuse endgame magic weapons: Stormwing staff (lv90, mage+45, 10% bonus hit) → Venomous staff (lv95, mage+55, venom DoT) → Tremor wand (lv100, mage+65, 20% lifesteal) → Venomous scythe (lv105, mage+72/atk+20, two-handed) → Sovereign wand (lv110, mage+88, 15% bonus hit) |
| Construction | 99 | 10 plank types + 12 permanent upgrades | Upgrades unlock in-game buildings: Sawmill (WC +10%), Furnace (Smithing +10%), Cooking Range (halve burn), Herb Patch (farm +25%), Study (RC +15%), Workshop (Fletching +10%), Manor (+5% all XP), Altar (2.5× Prayer XP), Fishing Pier (20% bonus fish), Hunting Lodge (2× impling rate), Alchemist's Lab (potions last 25% longer), Trophy Room (+10% drop rate) |

#### Combat

| Skill | Max Lv | Notes |
|---|---|---|
| Melee | 120 | Primary combat style; trains Attack + Constitution; weapon type matters — lightsword (3-tick, 0.7×, 8% bonus hit), broadsword (4-tick, 1.0×, baseline), 2H sword (5-tick, 1.4×, 10% crushing stun); **unique monster drops**: Makeshift Spear (goblins, 2H, 3-tick 1.0×), Bone Maul (hill giants, 2H, 5-tick 1.65×, 20% stun), Vampiric Edge (vampires, 1H, 4-tick 1.0×, 15% lifesteal); various tier-matched smithed weapons also drop from lower-tier mobs |
| Ranged | 120 | Trains Ranged + Constitution; requires ammo in Ammo slot — arrows (Bronze–Dragon, +1–20 range bonus, 1 consumed per attack) or chinchompas (lv45/55/65, bleed on hit — refreshes, does not stack); shortbow (3-tick, fast) vs longbow (4-tick, 1.2× damage) vs crossbow (4-tick, 1-handed, 15% armour pierce) |
| Magic | 120 | Trains Magic + Constitution; requires a rune loaded in the Ammo slot — each rune defines a spell school with a unique effect: Air (5% bonus hit), Water (5% mob atk reduction), Earth (15% mob dmg reduction), Fire (burn DoT), Mind (20% mob dmg reduction), Cosmic (25% crit ×2), Chaos (40% miss + ×2.5 on hit), Nature (25% root), Law (15% reflect), Death (5% execute at <25% HP), Blood (25% lifesteal), Soul (+20% mob combat stats as flat dmg); Magic cape saves 85% of rune casts |
| Defence | 120 | Gains XP in Defensive mode |
| Constitution | 99 | Starts at lv 10; gains XP on every kill (50% of action XP) |
| Prayer | 99 | Bury bones / use altar (×2.5 or ×3.5 XP); 16 active prayers across 4 tiers; drain system; protect prayers reduce damage 50% |

**Mobs:** 13 standard + 10 slayer-locked (Scuttling Claw → Void Stalker) + 9 bosses (Goblin King, The Burrower, Void Dragon, Leviathan Kings, Ancient Lich, Commander Solara, General Karg, Void Herald, The Harbinger)

**Drakes:** Emerald (lv55, green hide), Azure (lv65, blue hide), Crimson (lv72, red hide), Obsidian (lv80, black hide), Gilded (lv87, royal hide) — all drop dragon bones and dragon arrowheads

**Combat level requirements** are recommendations only — all mobs are attackable at any level; a yellow ⚠ Rec. Lv hint appears when below the suggested level. Slayer level requirements still hard-lock slayer monsters.

**Quests (3 total):** All quests are tracked in the dedicated **Quests tab** in the right panel (filter: All / Completed / Not Started).

- **Goblin Diplomacy** — collect a Goblin Diplomatic Note from goblins (1/100, guaranteed at 1000kc), defeat the Goblin King quest boss (one-time) to unlock the Goblin King as a repeatable boss. Track progress in Combat → Quests.
- **Discovering the Lost City** — pickpocket elves (lv 85 Thieving) for a 1/300 chance at a Crystal map fragment; complete via the Quests tab when Agility and Thieving are both 70+. Reward: unlocks the Crystal Agility Course and crystal tool seed drops.
- **Echoes of the Deep** — collect the Leviathan fang (1/250 from Leviathan Kings) and Solar shard (1/250 from Commander Solara), then defeat the Void Herald quest boss (lv 95, one-time). Reward: unlocks the Void Herald as a farmable lv 90 boss. Void Herald drops the **Herald's amulet** (tri-stat +10 all combat, +3% drop rate) and **Dragonstone charms** for the Void drake pouch (lv 95 Summoning, +15% all XP). Track item progress in Combat → Quests.

#### Support

| Skill | Max Lv | Actions | Notes |
|---|---|---|---|
| Agility | 99 | 7 courses (Verdant Trail → Crystal) | Scaled XP; Danger Trail drops PK coins; Crystal course requires quest + 70 Thieving; bonuses to Thieving pick/lock and Runecrafting speed |
| Thieving | 99 | 26 actions | Pickpocket (14 NPCs: melee, ranged, and mage-themed, catch/stun mechanic) + Locks (6 chests); combat items, seeds, gems, bars, runes, arrows, food, and potions from drops; agility gives extra loot chance; 📋 drop table viewer on all NPCs and chests |
| Slayer | 120 | 6 masters (Aldric → Duroc) | Task assignment system; 2–30 pts/task; kill-tracking per mob; task completion bonus XP; Points Shop in Store menu (6 unlocks: boss tasks, XP boost, **Auto-Task** 350pts, extended tasks, point mastery, skip task); Auto-Task automatically assigns from your chosen master on completion |
| Dungeoneering | 120 | 3 floor types | Time-based floors; earns tokens; token shop: 8 unlocks — Swift Passage (floors 10% faster), Token Surplus (+15% tokens), Sage's Tome (+10% DG XP), Bonecrusher (auto Prayer XP from bones; toggleable), Auto-Eat, Charming Imp (+10% charm drops), Scroll of Life (25% seed preservation), Auto-Harvest (herb patch auto-harvests 5 min after ready; toggleable) |
| Archaeology | 120 | 6 dig sites, 18 artefacts | Each tick has a chance to find an artefact early (chance increases at higher-level sites); artefacts grant XP on discovery (1,200–22,000 depending on tier); collecting the full set of an artefact unlocks a permanent passive perk (up to 3 active); perks include XP%, speed%, stat boosts, HP regen |

#### Combat (continued)

| Skill | Max Lv | Actions | Notes |
|---|---|---|---|
| Summoning | 99 | 19 pouches | Craft pouches from charms (gold/green/crimson/blue) + secondary; charms drop from all combat mobs; 10-min familiar timer; auto-renew from inventory; passive effects: speed, XP, attack accuracy, drop rate, HP regen; Undead Familiars (lv 80–99) replace Necromancy content; **Void drake pouch** (lv 95) requires a Dragonstone charm dropped by the Void Herald boss — grants +15% XP to all skills |

### Engine features

**Core**
- 0.6s game tick
- XP curve: level 2 = 83 XP, level 99 ≈ 13M, level 120 supported
- Training rates scale steeply: ~30–60k XP/hr at level 1, ~200k at level 50, ~600k at level 90+, ~700–900k at level 99–110; applies across all 26 skills including combat (per combat style), summoning, construction, and archaeology
- Autosave every 10 seconds (localStorage + in-memory fallback for sandboxed environments)
- Offline progress — calculates up to 12h of gains on load; "while you were away" popup
- **Drop table viewer** — click 📋 on any combat mob/boss or thieving NPC/chest to see its full drop table (item, quantity range, raw % chance)

**Crafting / production**
- Ingredient system — actions consume items from inventory
- Batch crafting — Make 1 / Make 5 / Make X / Make All buttons on all ingredient-consuming actions (including headless arrows); batch counter shown in progress bar
- Failure mechanics — cooking burns, fletching splinters (both scale 20%→0% over 10 levels); Divination transmutation 10% flat breakdown
- Multi-output actions — single tick can produce varied quantities (e.g. headless arrows)

**Combat**
- HP / Constitution system with per-mob HP values
- 3 combat styles (Melee / Ranged / Magic) + Defensive mode (splits XP with Defence)
- Food queue with configurable auto-eat threshold (unlocked via DG shop)
- Active prayer drain system (per-tick drain based on equipped prayers)
- Slayer task kill-tracking with bonus XP on completion

**Progression**
- **Virtual levels** — all skills can accumulate XP up to virtual level 150 (sidebar displays e.g. `130/99`); virtual levels are cosmetic only and do not boost stats or gameplay
- **Skillcapes** — 26 skill-specific capes (level 99 required, 99,000 coins each) with passive perks: gathering/artisan capes give +10% speed or +15% XP; combat capes give damage/defence/regen bonuses; Ranged cape gives 85% chance to save ammo; Magic cape gives 85% chance to save runes; support capes give thematic bonuses (prayer drain reduction, stun reduction, token gain, etc.)
- **Max Cape** — requires level 99 in all 26 skills, costs 10M coins; contains every skillcape perk simultaneously
- **Completionist Cape** — requires virtual level 150 in all implemented skills + all 79 achievements completed; costs 10B coins; contains all skillcape perks + BiS combat stats (ATK/RNG/MAG 80, DEF 120)
- **Pets** — 34 equippable pets (26 from skilling at 1/5000, 8 from bosses at 1/500–1/1000); each grants a passive perk (+5% XP, +5% speed, or unique bonus); only one active at a time; tracked in Collection Log
- Tool upgrade shop, Construction upgrades, Dungeoneering token shop — all consolidated inside the 🏪 Shop overlay
- Slayer points shop — 5 permanent unlocks
- Archaeology perk system — up to 3 active perks from artefact restoration
- **Jewelry perk system** — all 18 craftable rings and amulets have unique passive perks (XP boosts, rune save, farm speed, HP regen, prayer drain, dodge, bone XP, slayer kill modifiers); two silver slayer rings (Ring of Haste: 25% double-kill, Ring of Endurance: 25% zero-kill)

**UI / QoL**
- Mobile-first layout: header collapses to title row + utility buttons + pane switcher; larger touch targets; equipment grid single-column on mobile
- **Mobile app layout** — hamburger (☰) slides in the skills list as a drawer; pane switcher row (▶ Play / ⚔️ Status / 🌿 Activities / 🎒 Items / 📜 Quests) swaps the main content area without scrolling; game log always pinned at top of content area; Activities pane gives direct access to Farming, Summoning, Clues, and Slayer
- **Right panel tab system** — Log pinned to the top of the right panel (always visible); remaining sections grouped into four tabs: Status (Equipment + Prayer), Activities (Farming, Slayer, Summoning, Clues), Items (Inventory), **Quests**; tab choice persists across saves
- Inventory grouped by category — Openable, Equipment, Pets, Food & Potions, Seeds & Herbs, Summoning Pouches, Summoning, Ores & Bars, Logs, Fish, Gems & Hides, Runes & Energy, Ammo, Hunter, Currency, Other
- Equipment panel with 12 slots (Head, Weapon, Offhand, Ammo, Neck, Cape, Ring, Body, Gloves, Legs, Feet, Pet) and live stat totals
- **Item tooltips** — hover any inventory item or equipped slot to see stats, perks, spell school, heal amount, and equip requirements; mobile long-press (500ms) triggers the same tooltip
- Prayer HUD in Activities tab
- Settings menu — 9 colour themes in a 3×3 grid (Dark, Light, Ocean, Dusk, Lavender, Crimson, Midnight, Sunset, Slate), Compact mode, Hide locked actions, configurable log size, Replay Tutorial, Debug Tools access
- **Tutorial** — opt-in at character creation (checkbox, on by default); 5-step overlay covering skills, actions, inventory, and next steps; skippable at any time; "First Steps" achievement fires on first completion or skip; replayable from Settings
- Stop button always visible next to action progress bar
- **Achievement system** — 83 achievements across Skills, Total Level, Combat, Slayer, and Special categories; filter by All / Hide Completed / Hide Locked; locked achievements require prerequisites (slayer unlocks, quest completion, etc.)
- **Quest log** — dedicated Quests tab listing all 3 quests with lore, skill/item requirements (✅/❌ per requirement), rewards text, and inline "Complete Quest" buttons where applicable; filters: All / Completed / Not Completed
- **Skill icons** — emoji icon prefixed on every skill row in the sidebar
- **Collection Log** — 34 drop sources across 6 categories (Woodcutting, Mining, Fishing, Agility, Hunter, Combat, Bosses, Pets, Clue Scrolls); tracks per-item obtain counts; unobtained items shown greyed; global and per-source progress counters; kill count shown per boss/mob source, opened count per geode/jar/spirit source, completion count per clue tier
- **Smithing tab** grouped into 4 broad sections (Bars / Armour / Weapons / Other) instead of a separate header per metal tier
- **Combat style/subtab buttons** (Melee / Range / Mage, Mobs / Slayer / Bosses / Quests) now styled consistently with the rest of the UI — active state highlighted in green
- **Skill sub-tabs** — multi-category skills (Smithing, Crafting, Fletching, Divination, Hunter, Herblore, Thieving, Runecrafting) now show a tab bar at the top of the action list; clicking a tab shows only that category's actions instead of one long scrollable list
- **Mobile log position** — on mobile (▶ Play pane), the activity log always appears above the active skill panel

**Bonus drops**
- Woodcutting: bird's nests (1%, 4 variants)
- Mining: geodes (5%, 3 tiers up to metamorphic with 1-in-99k hydrix); most common drop is rune essence (25–50 / 50–150 / 150–500 per tier)
- Fishing: Kraken's Beak (1% lv60+), Map to the Deep (1-in-100k lv85+)
- Firemaking: fire spirit QTE event (15% per burn); spirit is openable for herb seeds, fire runes ×15, coins, or rare Boots of Ash (~1 in 100)
- Hunter: passive impling jar (1% per trap action, tier by hunter level; 6 tiers from Baby to Kingly)
- All skills: respective skilling pet (1/5000 per action)
- All bosses: respective boss pet (1/500–1/1000 per kill)
- Drakes (Emerald/Azure/Obsidian): dragon arrowheads (30–50% chance, 3–15 qty; used for dragon arrow assembly in Fletching)

**Deferred mechanics:** PWA manifest + service worker for mobile install, Capacitor wrap for app stores

**Bug fixes:**
- Clue scroll drops now correctly fire for all skills — thieving, agility, archaeology, prayer, fletching (headless arrows), and farming previously bypassed the bonus drop check due to early returns in the action completion path.
- Enemy HP bar now correctly depletes as the mob takes damage (was previously filling up instead).
- XP is now correctly granted for all gathering and artisan skills — an undeclared variable in `completeAction` caused a silent crash before `grantXp` could run for any skill that produces an item. Also fixes the Gatherer's Band ring's 10% double-yield perk which was silently non-functional.
- "Hide Completed" filter in the Achievements overlay now works correctly — achievements are checked for completion the moment the overlay opens, so earned achievements are immediately marked and the filter has accurate state to act on.

## Tech stack

Plain HTML + CSS + JavaScript. Single file (~7,000 lines), no dependencies, no build step.

Cross-platform target: PWA first (PC/iOS/Android from browser), then Capacitor for app stores if needed.
