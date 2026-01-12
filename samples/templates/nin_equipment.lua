--
-- PRECAST JA SETS
--

	sets.precast.ja["Mijin Gakure"] =
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

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical =
		{
			
		}

	-- Gear that should apply to all melee, physical weaponskills
	sets.precast.ws.melee.physical =
		{
			
		}

	sets.precast.ws["Blade: Hi"] =
		{
			
		}

	sets.precast.ws["Blade: Kamu"] =
		{
			
		}

	sets.precast.ws["Blade: Ku"] =
		{
			
		}

	sets.precast.ws["Blade: Shun"] =
		{
			
		}

	sets.precast.ws["Zesho Meppo"] =
		{
			
		}

--
-- PRECAST WS MODS
--

	-- +Accuracy gear for melee, hybrid weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.hybrid["Acc"] =
		{
			
		}

	-- +Magic Accuracy gear for melee, magical weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.magical["Acc"] =
		{
			
		}

	-- +Accuracy gear for melee, physical weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.physical["Acc"] =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	-- Probably just Fast Cast gear
	InsertGearSet(sets.precast.magic,
		{
			
		})

	InsertGearSet(sets.precast.magic.ninjutsu,
		{
			
		})

	sets.precast.magic.ninjutsu.utsusemi =
		{
			
		}
--
-- MIDCAST MAGIC SETS
--
	
	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{
			
		}))

	InsertGearSet(sets.midcast.magic.ninjutsu, 
		{
			
		})

	sets.midcast.magic.ninjutsu.debuff =
		{
			
		}

	sets.midcast.magic.ninjutsu.elemental =
		{
			
		}

	sets.midcast.magic.ninjutsu.utsusemi =
		{
			
		}

--
-- MIDCAST MAGIC MODS
--

	-- Additional gear that will be equipped when casting elemental ninjutsu and Futae is active
	mods.midcast.magic.ninjutsu.elemental["Futae"] =
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

	-- Additional gear that will be equipped when engaged and Innin is active
	mods.engaged["Innin"] =
		{
			
		}

	-- Additional gear that will be equipped when engaged and Sange is active
	mods.engaged["Sange"] =
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

	-- Additional gear that will be equipped when engaged and Yonin is active
	mods.engaged["Yonin"] =
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