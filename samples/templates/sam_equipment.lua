--
-- PRECAST JA SETS
-- 

	sets.precast.ja["Meditate"] =
		{

		}

	sets.precast.ja["Sengikori"] =
		{

		}

	sets.precast.ja["Shikikoyo"] =
		{

		}

	sets.precast.ja["Warding Circle"] =
		{

		}

	sets.precast.ja["Weapon Bash"] =
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

	-- Gear that should apply to all melee, hybrid weaponskills
	sets.precast.ws.melee.hybrid =
		{

		}

	-- Gear that should apply to all melee, physical weaponskills
	sets.precast.ws.melee.physical =
		{

		}

	sets.precast.ws["Tachi: Fudo"] =
		{

		}

	sets.precast.ws["Tachi: Kasha"] =
		{

		}

	sets.precast.ws["Tachi: Mumei"] =
		{

		}

	sets.precast.ws["Tachi: Rana"] =
		{

		}

	sets.precast.ws["Tachi: Shoha"] =
		{

		}

--
-- PRECAST WS MODS
--
	-- +Accuracy gear for melee, hybrid weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.hybrid["Acc"] =
		{

		}

	-- +Accuracy gear for melee, physical weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.physical["Acc"] =
		{

		}

	-- Additional gear that will be equipped when using a melee weaponskill and Meikyo Shisui is active
	mods.precast.ws.melee["Meikyo Shisui"] =
		{

		}

	-- Additional gear that will be equipped when using a melee weaponskill and Sekkanoki is active
	mods.precast.ws.melee["Sekkanoki"] =
		{

		}

--
-- PRECAST MAGIC SETS
--
	-- Probably just Fast Cast gear
	sets.precast.magic =
		{

		}
--
-- MIDCAST MAGIC SETS
--
	-- SAM isn't a caster so just use the magic precast set to shorten recast
	sets.midcast.magic = sets.precast.magic

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

	-- Additional gear that will be equipped when engaged and Hasso is active
	mods.engaged["Hasso"] =
		{

		}

	-- Additional gear that will be equipped when engaged and Yaegasumi is active
	mods.engaged["Yaegasumi"] =
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

	-- Additional gear that will be equipped when engaged and Seigan is active
	mods.engaged["Seigan"] =
		{

		}

	-- Additional gear that will be equipped when engaged and Third Eye is active
	mods.engaged["Third Eye"] =
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