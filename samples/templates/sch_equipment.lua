--
-- CUSTOM LOGIC GEAR
--
	customize = {}

	-- Used in HookPrecastCustomizeOffense and HookMidcastCustomizeOffense to equip relic boots when conditions are met for Celerity/Alacrity enhancement
	customize.relicboots =
		{
			
		}

	-- Used in HookMidcastCustomizeOffense to equip empyrean boots when conditions are met for Klimaform enhancement
	customize.empyreanboots =
		{
			
		}

--
-- PRECAST JA SETS
--

	sets.precast.ja["Enlightenment"] =
		{
			
		}

	sets.precast.ja["Tabula Rasa"] =
		{
			
		}

--
-- PRECAST WS SETS
--

	-- Gear that should apply to all weaponskills
	-- Likely just Fotia or +Weaponskill Damage pieces
	InsertGearSet(sets.precast.ws,
		{
			
		})

	-- Gear that should apply to all melee, physical weaponskills
	sets.precast.ws.melee.physical =
		{
			
		}

	sets.precast.ws["Myrkr"] =
		{
			
		}

	sets.precast.ws["Omniscience"] = 
		{
			
		}

	sets.precast.ws["Oshala"] = 
		{
			
		}

	sets.precast.ws["Shattersoul"] =
		{
			
		}

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	InsertGearSet(sets.precast.magic,
		{
			
		})

--
-- PRECAST MAGIC MODS
--

	-- Additional gear that will be equipped when casting a dark magic spell and Dark Arts is active
	mods.precast.magic.dark["Dark Arts"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a divine magic spell and Light Arts is active
	mods.precast.magic.divine["Light Arts"] =
		{
			
		}

	mods.precast.magic.elemental["Dark Arts"] =
		{
			
		}

	mods.precast.magic.enfeebling.black["Dark Arts"] =
		{
			
		}

	mods.precast.magic.enfeebling.white["Light Arts"] =
		{
			
		}

	mods.precast.magic.enhancing.black["Dark Arts"] =
		{
			
		}

	mods.precast.magic.enhancing.white["Light Arts"] =
		{
			
		}

	mods.precast.magic.healing["Light Arts"] =
		{
			
		}

--
-- MIDCAST MAGIC SETS
--

	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{
			
		}))

--
-- MIDCAST MAGIC ELEMENTAL
--

	InsertGearSet(sets.midcast.magic.elemental,
		{
			
		})

	sets.midcast.magic.elemental.helix =
		{
			
		}

--
-- MIDCAST MAGIC ENFEEBLING
--

	InsertGearSet(sets.midcast.magic.enfeebling,
		{
			
		})

	InsertGearSet(sets.midcast.magic.enfeebling.black,
		{
			
		})

	sets.midcast.magic.enfeebling.black.bind =
		{
			
		}

	sets.midcast.magic.enfeebling.black.blind =
		{
			
		}

	sets.midcast.magic.enfeebling.black.petrify =
		{
			
		}

	sets.midcast.magic.enfeebling.black.dispel =
		{
			
		}

	sets.midcast.magic.enfeebling.black.frazzle =
		{
			
		}

	sets.midcast.magic.enfeebling.black.gravity =
		{
			
		}

	sets.midcast.magic.enfeebling.black.poison =
		{
			
		}

	sets.midcast.magic.enfeebling.black.sleep =
		{
			
		}

	InsertGearSet(sets.midcast.magic.enfeebling.white,
		{
			
		})

	sets.midcast.magic.enfeebling.white.dia =
		{
			
		}

	sets.midcast.magic.enfeebling.white.paralyze =
		{
			
		}

	sets.midcast.magic.enfeebling.white.silence =
		{
			
		}

	sets.midcast.magic.enfeebling.white.slow =
		{
			
		}

--
-- MIDCAST MAGIC ENHANCING
--

	InsertGearSet(sets.midcast.magic.enhancing,
		{
			
		})

	sets.midcast.magic.enhancing.black.spikes =
		{
			
		}

	sets.midcast.magic.enhancing.white.barelement =
		{
			
		}

	sets.midcast.magic.enhancing.white.barstatus =
		{
			
		}

	sets.midcast.magic.enhancing.white.haste =
		{
			
		}

	sets.midcast.magic.enhancing.white.phalanx =
		{
			
		}

	sets.midcast.magic.enhancing.white.refresh =
		{
			
		}

--
-- MIDCAST MAGIC HEALING
--

	InsertGearSet(sets.midcast.magic.healing,
		{
			
		})

	sets.midcast.magic.healing.cure =
		{
			
		}

	sets.midcast.magic.healing.statusremoval =
		{
			
		}

	sets.midcast.magic["Cursna"] =
		{
			
		}

--
-- MIDCAST MAGIC MODS
--

	-- +Magic Accuracy gear when casting a dark spell and Offense mod = "MAcc"
	mods.midcast.magic.dark["MAcc"] =
		{
			
		}

	-- +Magic Accuracy gear when casting an enfeebling spell and Offense mod = "MAcc"
	-- Also supports more specific syntax like mods.midcast.magic.enfeebling.white.silence["MAcc"]
	mods.midcast.magic.enfeebling["MAcc"] =
		{
			
		}

	-- +Magic Accuracy gear when casting an elemental spell and Magic Offense mod = "MAcc"
	mods.midcast.magic.elemental["MAcc"] =
		{
			
		}

	-- +Magic damage gear when casting an elemental spell and Magic Offense mod = "MDmg"
	mods.midcast.magic.elemental["MDmg"] =
		{
			
		}

	-- Magic burst enhancement gear that will be equipped when casting an elemental spell and the Magic Burst mod = "+MBurst"
	mods.midcast.magic.elemental["+MBurst"] =
		{
			
		}

--
-- MIDCAST MAGIC MODS - BLACK MAGIC
--

	-- Additional gear that will be equipped when casting a dark magic spell and Dark Arts is active
	mods.midcast.magic.dark["Dark Arts"] =
		{
			
		}

	mods.midcast.magic.enfeebling.black["Dark Arts"] =
		{
			
		}

	mods.midcast.magic.elemental["Dark Arts"] =
		{
			
		}

	mods.midcast.magic.enhancing.black["Dark Arts"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a dark magic spell and Parsimony is active
	mods.midcast.magic.dark["Parsimony"] =
		{
			
		}

	mods.midcast.magic.enfeebling.black["Parsimony"] =
		{
			
		}

	mods.midcast.magic.elemental["Parsimony"] =
		{
			
		}

	mods.midcast.magic.enhancing.black["Parsimony"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a dark magic spell and Ebullience is active
	mods.midcast.magic.dark["Ebullience"] =
		{
			
		}

	mods.midcast.magic.elemental["Ebullience"] =
		{
			
		}

	-- Additional gear that will be equipped when casting an elemental magic spell and Immanence is active
	mods.midcast.magic.elemental["Immanence"] =
		{
			
		}

--
-- MIDCAST MAGIC MODS - WHITE MAGIC
--

	-- Additional gear that will be equipped when casting a divine magic spell and Light Arts is active
	mods.midcast.magic.divine["Light Arts"] =
		{
			
		}

	mods.midcast.magic.enfeebling.white["Light Arts"] =
		{
			
		}

	mods.midcast.magic.enhancing.white["Light Arts"] =
		{
			
		}

	mods.midcast.magic.healing["Light Arts"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a divine magic spell and Penury is active
	mods.midcast.magic.divine["Penury"] =
		{
			
		}

	mods.midcast.magic.enfeebling.white["Penury"] =
		{
			
		}

	mods.midcast.magic.enhancing.white["Penury"] =
		{
			
		}

	mods.midcast.magic.healing["Penury"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a divine magic spell and Rapture is active
	mods.midcast.magic.divine["Rapture"] =
		{
			
		}

	mods.midcast.magic.enfeebling.white["Rapture"] =
		{
			
		}

	mods.midcast.magic.healing["Rapture"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a white enhancing spell and Perpetuance is active
	mods.midcast.magic.enhancing.white["Perpetuance"] =
		{
			
		}

--
-- ENGAGED SET
--

	sets.engaged =
		{
			
		}

--
-- ENGAGED DEFENSE MODS
--

	-- Moderate PDT gear when the Physical Defense mod = "PDTLo"
	mods.engaged["PDTLo"] =
		{
			
		}

	-- High PDT gear when the Physical Defense mod = "PDTHi"
	mods.engaged["PDTHi"] =
		{
			
		}

	-- Moderate MDT/MEva gear when the Magical Defense mod = "MEvaLo"
	mods.engaged["MEvaLo"] =
		{
			
		}

	-- High MDT/MEva gear when the Magical Defense mod = "MEvaHi"
	mods.engaged["MEvaHi"] =
		{
			
		}

--
-- IDLE & RESTING SETS
--

	sets.idle =
		{
			
		}

	sets.idle.town =
		{
			
		}

	sets.resting =
		{
			
		}

--
-- IDLE & RESTING MODS
--

	mods.idle["PDTLo"] =
		{
			
		}

	mods.idle["PDTHi"] =
		{
			
		}

	mods.idle["MEvaLo"] =
		{
			
		}

	mods.idle["MEvaHi"] =
		{
			
		}

	-- Additional gear that will be equipped when idle and the player is moving.
	mods.idle["player_moving"] =
		{
			
		}

	-- Additional Refresh gear that will be equipped when idle and the Refresh mod = "+Refresh"
	mods.idle["+Refresh"] =
		{
			
		}

	-- Additional Refresh gear that will be equipped when resting and the Refresh mod = "+Refresh"
	mods.resting["+Refresh"] =
		{
			
		}

	-- Additional gear that will be equipped when idle and Sublimation is active
	mods.idle["Sublimation: Activated"] =
		{
			
		}