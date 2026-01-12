--
-- PRECAST JA SETS
--

	sets.precast.ja["Benediction"] =
		{
			
		}

	sets.precast.ja["Devotion"] =
		{
			
		}

	sets.precast.ja["Martyr"] =
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

	sets.precast.ws["Black Halo"] =
		{
			
		}

	sets.precast.ws["Dagda"] =
		{
			
		}

	sets.precast.ws["Hexa Strike"] = 
		{
			
		}

	sets.precast.ws["Judgment"] = 
		{
			
		}

	sets.precast.ws["Realmrazer"] = 
		{
			
		}

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical =
		{
			
		}

--
-- PRECAST WS MODS
--

	-- +Accuracy gear for melee, physical weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.physical["Acc"] =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	InsertGearSet(sets.precast.magic, 
		{
			
		})

	sets.precast.magic.healing.cure =
		{
			
		}

--
-- MIDCAST MAGIC SETS
--

	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{
			
		}))

	InsertGearSet(sets.midcast.magic.enfeebling,
		{
			
		})

	InsertGearSet(sets.midcast.magic.enhancing,
		{
			
		})

	sets.midcast.magic.enhancing.white.barelement =
		{
			
		}

	sets.midcast.magic.enhancing.white.regen =
		{
			
		}

	InsertGearSet(sets.midcast.magic.healing,
		{
			
		})

	sets.midcast.magic.healing.curaga =
		{
			
		}

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

	-- Additional gear that will be equipped when casting a Healing spell and Afflatus Solace is active
	mods.midcast.magic.healing["Afflatus Solace"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a Bar-element spell and Afflatus Solace is active
	mods.midcast.magic.enhancing.white.barelement["Afflatus Solace"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a Holy spell and Afflatus Solace is active
	mods.midcast.magic.divine.holy["Afflatus Solace"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a status removal (-na) spell and Divine Caress is active
	mods.midcast.magic.healing.statusremoval["Divine Caress"] =
		{
			
		}

--
-- ENGAGED SET
--

	sets.engaged =
		{
			
		}

--
-- ENGAGED OFFENSE MODS
--

	-- +Accuracy gear when engaged and the Offense mod = "Acc"
	mods.engaged["Acc"] =
		{
			
		}

	-- +Multiattack gear when engaged and the Offense mod = "Multi"
	mods.engaged["Multi"] =
		{
			
		}

	-- +Treasure Hunter gear when engaged and the TH mod = "+TH"
	mods.engaged["+TH"] =
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