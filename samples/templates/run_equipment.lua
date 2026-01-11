--
-- PRECAST JA SETS
--

	-- Gear that will be equipped for all JA uses, often contains DT/Enmity/HP.
	InsertGearSet(sets.precast.ja,
		{
			
		})

	sets.precast.ja["Elemental Sforzo"] =
		{

		}

	sets.precast.ja["Gambit"] =
		{

		}

	sets.precast.ja["Liement"] =
		{

		}

	sets.precast.ja["Pflug"] =
		{

		}

	sets.precast.ja["Rayke"] =
		{

		}

	sets.precast.ja["Swordplay"] =
		{

		}

	sets.precast.ja["Valiance"] =
		{

		}

	sets.precast.ja["Vallation"] =
		{

		}

	sets.precast.ja["Vivacious Pulse"] =
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

	sets.precast.ws["Dimidiation"] = 
		{

		}

	sets.precast.ws["Fimbulvetr"] =
		{

		}

	sets.precast.ws["Ground Strike"] = 
		{

		}

	sets.precast.ws["Resolution"] = 
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

--
-- PRECAST MAGIC MODS
--

	-- Additional gear that will be equipped when casting a spell and Valiance is active
	mods.precast.magic["Valiance"] =
		{

		}

	-- Additional gear that will be equipped when casting a spell and Vallation is active
	mods.precast.magic["Vallation"] =
		{
			
		}

--
-- MIDCAST MAGIC SETS
--
	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{

		}))

	sets.midcast.magic.divine["Flash"] =
		{

		}

	sets.midcast.magic.enhancing.black.spikes =
		{

		}

	sets.midcast.magic.enhancing.white.barelement =
		{

		}

	sets.midcast.magic.enhancing.white.barstatus =
		{

		}

	sets.midcast.magic.enhancing.white.phalanx =
		{

		}

	sets.midcast.magic.enhancing.white.regen =
		{

		}

	sets.midcast.magic.enhancing.white.refresh =
		{

		}

	sets.midcast.magic.enhancing.white.temper =
		{

		}

--
-- MIDCAST MAGIC MODS
--

	-- Additional gear that will be equipped when casting a spell and Valiance is active
	mods.midcast.magic["Valiance"] =
		{

		}

	-- Additional gear that will be equipped when casting a spell and Vallation is active
	mods.midcast.magic["Vallation"] =
		{
			
		}

	mods.midcast.magic.enhancing["Embolden"] =
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

	-- Additional gear that will be equipped when engaged and Battuta is active
	mods.engaged["Battuta"] = 
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

	-- Parry enhancement gear when engaged and Parry mod = "+Parry"
	mods.engaged["+Parry"] =
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