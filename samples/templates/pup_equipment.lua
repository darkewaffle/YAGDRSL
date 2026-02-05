--
-- PRECAST JA SETS
--

	sets.precast.ja["Overdrive"] =
		{
			
		}

	sets.precast.ja["Repair"] =
		{
			
		}

	sets.precast.ja["Role Reversal"] =
		{
			
		}

	sets.precast.ja["Tactical Switch"] =
		{
			
		}

	sets.precast.ja["Ventriloquy"] =
		{
			
		}

	sets.precast.ja.maneuver =
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

	sets.precast.ws["Stringing Pummel"] =
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

	-- PUP isn't a caster so just use the magic precast set to shorten recast
	InsertGearSet(sets.midcast.magic, sets.precast.magic)

--
-- ENGAGED SET
--

	-- Engaged gear that would be appropriate even if the PUP has no pet. Define mods.status.engaged["automaton"] below to create your set for when a pet is present.
	sets.status.engaged =
		{
			
		}

	-- Anytime a pet is present this mod will be active and it will be the first offense mod applied. Essentially it is your 'engaged with a pet' set.
	mods.status.engaged["automaton"] =
		{
			
		}

--
-- ENGAGED OFFENSE MODS
--

	-- +Accuracy gear when engaged and the Offense mod = "Acc"
	mods.status.engaged["Acc"] =
		{
			
		}

	-- +Multiattack gear when engaged and the Offense mod = "Multi"
	mods.status.engaged["Multi"] =
		{
			
		}

	-- +Treasure Hunter gear when engaged and the TH mod = "+TH"
	mods.status.engaged["+TH"] =
		{
			
		}

	-- -Pet DT gear when engaged and the Pet Mode mod = "PetDT"
	mods.status.engaged["PetDT"] =
		{
			
		}

	-- Additional gear that will be equipped when engaged and Overdrive is active
	mods.status.engaged["Overdrive"] =
		{
			
		}

--
-- ENGAGED DEFENSE MODS
--

	-- Moderate PDT gear when the Physical Defense mod = "PDTLo"
	mods.status.engaged["PDTLo"] =
		{
			
		}

	-- High PDT gear when the Physical Defense mod = "PDTHi"
	mods.status.engaged["PDTHi"] =
		{
			
		}

	-- Moderate MDT/MEva gear when the Magical Defense mod = "MEvaLo"
	mods.status.engaged["MEvaLo"] =
		{
			
		}

	-- High MDT/MEva gear when the Magical Defense mod = "MEvaHi"
	mods.status.engaged["MEvaHi"] =
		{
			
		}

--
-- ENGAGED OVERRIDES
--

	overrides.status.engaged["PetSolo"] =
		{
			
		}

--
-- IDLE & RESTING SETS
--

	sets.status.idle =
		{
			
		}

	sets.status.idle.town =
		{
			
		}

	sets.status.resting =
		{
			
		}

--
-- IDLE & RESTING MODS
--

	mods.status.idle["PDTLo"] =
		{
			
		}

	mods.status.idle["PDTHi"] =
		{
			
		}

	mods.status.idle["MEvaLo"] =
		{
			
		}

	mods.status.idle["MEvaHi"] =
		{
			
		}

	-- Additional gear that will be equipped when idle and the player is moving.
	mods.status.idle["player_moving"] =
		{
			
		}

--
-- IDLE & RESTING OVERRIDES
--

	overrides.status.idle["PetSolo"] =
		{
			
		}

	overrides.status.resting["PetSolo"] =
		{
			
		}