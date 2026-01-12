--
-- PRECAST JA SETS
--

	sets.precast.ja["Manafont"] =
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

	sets.precast.ws["Oshala"] = 
		{
			
		}

	sets.precast.ws["Shattersoul"] =
		{
			
		}

	sets.precast.ws["Vidohunir"] = 
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

	sets.precast.magic.elemental =
		{
			
		}

--
-- MIDCAST MAGIC SETS
--

	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{
			
		}))

	InsertGearSet(sets.midcast.magic.dark,
		{
			
		})

	sets.midcast.magic.dark.aspir =
		{
			
		}

	sets.midcast.magic.dark.bio =
		{
			
		}

	sets.midcast.magic.dark.drain =
		{
			
		}

	InsertGearSet(sets.midcast.magic.enfeebling,
		{
			
		})

	InsertGearSet(sets.midcast.magic.elemental,
		{
			
		})

	sets.midcast.magic.elemental.ancient =
		{
			
		}

	sets.midcast.magic.elemental.debuff =
		{
			
		}

--
-- MIDCAST MAGIC MODS
--

	-- +Magic Accuracy gear that will be equipped when casting an elemental spell the Offense mod = "MAcc"
	mods.midcast.magic.elemental["MAcc"] =
		{
			
		}

	-- +Magic Damage gear that will be equipped when casting an elemental spell the Offense mod = "MDmg"
	mods.midcast.magic.elemental["MDmg"] =
		{
			
		}

	-- Magic burst enhancement gear that will be equipped when casting an elemental spell and the MagicBurst mod = "+MBurst"
	mods.midcast.magic.elemental["+MBurst"] =
		{
			
		}

	mods.midcast.magic.elemental.ancient["+MBurst"] =
		{
			
		}

	-- +Treasure Hunter that will be equipped when casting an elemental spell and TH mod = "+TH"
	mods.midcast.magic.elemental["+TH"] =
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

	-- Additional gear that will be equipped when engaged and and Mana Wall is active
	mods.engaged["Mana Wall"] =
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

	-- Additional gear that will be equipped when idle and and Mana Wall is active
	mods.idle["Mana Wall"] =
		{
			
		}

	-- Additional gear that will be equipped when resting and and Mana Wall is active
	mods.resting["Mana Wall"] =
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