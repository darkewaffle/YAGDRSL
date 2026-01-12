--
-- PRECAST JA SETS
--
	sets.precast.ja["Boost"] =
		{
			
		}

	sets.precast.ja["Chakra"] =
		{
			
		}

	sets.precast.ja["Chi Blast"] =
		{
			
		}

	sets.precast.ja["Counterstance"] =
		{
			
		}

	sets.precast.ja["Dodge"] =
		{
			
		}

	sets.precast.ja["Focus"] =
		{
			
		}

	sets.precast.ja["Footwork"] =
		{
			
		}

	sets.precast.ja["Formless Strikes"] =
		{
			
		}

	sets.precast.ja["Hundred Fists"] =
		{
			
		}

	sets.precast.ja["Mantra"] =
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

	sets.precast.ws["Asuran Fists"] =
		{
			
		}

	sets.precast.ws["Dragon Kick"] =
		{
			
		}

	sets.precast.ws["Howling Fist"] =
		{
			
		}

	sets.precast.ws["Maru Kala"] =
		{
			
		}

	sets.precast.ws["Raging Fists"] =
		{
			
		}

	sets.precast.ws["Shijin Spiral"] =
		{
			
		}

	sets.precast.ws["Tornado Kick"] =
		{
			
		}

	sets.precast.ws["Victory Smite"] =
		{
			
		}

--
-- PRECAST WS MODS
--

	-- +Accuracy gear for melee, physical weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.physical["Acc"] =
		{
			
		}

	-- Additional gear that will be equipped when using a melee, physical weaponskill and Footwork is active
	mods.precast.ws.melee.physical["Footwork"] =
		{
			
		}

	-- Additional gear that will be equipped when using a melee, physical weaponskill and Impetus is active
	mods.precast.ws.melee.physical["Impetus"] =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	-- Probably just Fast Cast gear
	InsertGearSet(sets.precast.magic,
		{
			
		})

--
-- MIDCAST MAGIC SETS
--

	-- MNK isn't a caster so just use the magic precast set to shorten recast
	InsertGearSet(sets.midcast.magic, sets.precast.magic)

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

	-- Gear that will be equipped when engaged and Boost is active
	mods.engaged["Boost"] =
		{
			
		}

	-- Gear that will be equipped when engaged and Footwork is active
	mods.engaged["Footwork"] =
		{
			
		}

	-- Gear that will be equipped when engaged and Formless Strikes is active
	mods.engaged["Formless Strikes"] =
		{
			
		}

	-- Gear that will be equipped when engaged and Impetus is active
	mods.engaged["Impetus"] =
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

	-- Gear that will be equipped when engaged and Counterstance is active
	mods.engaged["Counterstance"] =
		{
			
		}

	-- Gear that will be equipped when engaged and Inner Strength is active
	mods.engaged["Inner Strength"] =
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

	mods.idle["Boost"] =
		{
			
		}

	mods.resting["Boost"] =
		{
			
		}