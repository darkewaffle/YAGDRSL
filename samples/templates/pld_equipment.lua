--
-- PRECAST JA SETS
--

	-- Gear that will be equipped for all JA uses, often contains DT/Enmity/HP.
	InsertGearSet(sets.precast.ja,
		{
			
		})

	sets.precast.ja["Chivalry"] =
		{
			
		}

	sets.precast.ja["Cover"] =
		{
			
		}

	sets.precast.ja["Divine Emblem"] =
		{
			
		}

	sets.precast.ja["Fealty"] =
		{
			
		}

	sets.precast.ja["Holy Circle"] =
		{
			
		}

	sets.precast.ja["Invincible"] =
		{
			
		}

	sets.precast.ja["Rampart"] =
		{
			
		}

	sets.precast.ja["Sentinel"] =
		{
			
		}

	sets.precast.ja["Shield Bash"] =
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

	sets.precast.ws["Atonement"] =
		{
			
		}

	sets.precast.ws["Chant du Cygne"] = 
		{
			
		}

	sets.precast.ws["Imperator"] = 
		{
			
		}

	sets.precast.ws["Requiescat"] = 
		{
			
		}

	sets.precast.ws["Savage Blade"] =
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

	InsertGearSet(sets.midcast.magic.divine,
		{
			
		})

	sets.midcast.magic.divine["Flash"] =
		{
			
		}

	sets.midcast.magic.divine.enlight =
		{
			
		}

	InsertGearSet(sets.midcast.magic.enhancing,
		{
			
		})

	sets.midcast.magic.enhancing.white.phalanx =
		{
			
		}

	sets.midcast.magic.enhancing.white.protect =
		{
			
		}

	sets.midcast.magic.enhancing.white.shell =
		{
			
		}

	sets.midcast.magic.healing.cure =
		{
			
		}

--
-- MIDCAST MAGIC MODS
--

	-- SIRD gear that will be applied to healing spells when the SIRD mod = "CureSIRD"
	mods.midcast.magic.healing["CureSIRD"] = 
		{
			
		}

	-- SIRD gear that will be applied to all magic when the SIRD mod = "FullSIRD"
	mods.midcast.magic["FullSIRD"] =
		{
			
		}

	-- Creates an 'exception' to FullSIRD for Flash since Flash is very fast and a low recast is likely preferable.
	mods.midcast.magic["Flash"] = {}
	mods.midcast.magic["Flash"]["FullSIRD"] = set_combine(sets.precast.magic,
	{
		
	})

	-- Creates an 'exception' to FullSIRD for Reprisal since Reprisal is very fast and a low recast is likely preferable.
	mods.midcast.magic["Reprisal"] = {}
	mods.midcast.magic["Reprisal"]["FullSIRD"] = set_combine(sets.precast.magic,
	{

	})

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

	-- +Block or +Shield Mastery gear when engaged and BlockTP mod = "+BlockTP"
	mods.engaged["+BlockTP"]
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