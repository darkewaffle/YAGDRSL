--
-- PRECAST JA SETS
--

	sets.precast.ja.jig =
		{

		}

	sets.precast.ja.samba =
		{

		}

	sets.precast.ja.step =
		{

		}

	-- Gear that should be applied to all Waltzes
	sets.precast.ja.waltz =
		{

		}

	-- Gear that should be applied to all Waltzes that cure HP
	sets.precast.ja.waltz.cure =
		{

		}

	sets.precast.ja["Climactic Flourish"] =
		{

		}

	sets.precast.ja["Feather Step"] =
		{

		}

	sets.precast.ja["No Foot Rise"] =
		{

		}

	sets.precast.ja["Reverse Flourish"] =
		{

		}

	sets.precast.ja["Trance"] =
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

	sets.precast.ws["Evisceration"] =
		{

		}

	sets.precast.ws["Pyrrhic Kleos"] = 
		{

		}

	sets.precast.ws["Rudra's Storm"] = 
		{

		}

	sets.precast.ws["Ruthless Stroke"] = 
		{

		}

	sets.precast.ws["Shark Bite"] =
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

	-- Additional gear that will be equipped when using a melee, physical weaponskill and Climactic Flourish is active
	mods.precast.ws.melee.physical["Climactic Flourish"] =
		{

		}

	-- Additional gear that will be equipped when using a melee, physical weaponskill and Striking Flourish is active
	mods.precast.ws.melee.physical["Striking Flourish"] =
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

	-- DNC isn't a caster so just use the magic precast set to shorten recast
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