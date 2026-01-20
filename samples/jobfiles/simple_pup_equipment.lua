--
-- CUSTOMIZATIONS
--

	gear.petlegs = {name="Taeon Tights", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}


	templates = {}

	templates.fastcast =
		{
			ammo="Sapience Orb",
			head=gear.fastcast_light_head,
			neck="Voltsurge Torque",
			ear1="Etiolation Earring",
			ear2="Loquacious Earring",
			body=gear.fastcast_light_body,
			hands=gear.fastcast_light_hands,
			ring1="Prolix Ring",
			ring2="Naji's Loop",
			legs=gear.fastcast_light_legs,
			feet=gear.fastcast_light_feet
		}

	templates.petsolo =
		{
			main="Ohtas",
			ranged="Animator P",
			ammo="Automaton Oil +3",
			head="Anwig Salade",
			neck="Shulmanu Collar",
			ear1="Enmerkar Earring",
			ear2="Karagoz Earring +1",
			body="Pitre Tobe +2",
			hands="Mpaca's Gloves",
			--ring1="Thurandaut Ring +1",
			ring2="Varar Ring",
			back="Visucius's Mantle",
			waist="Incarnation Sash",
			legs=gear.petlegs,
			feet="Mpaca's Boots"
		}

--
-- PRECAST JA SETS
--

	sets.precast.ja["Overdrive"] =
		{
			body="Pitre Tobe +2"
		}

	sets.precast.ja["Repair"] =
		{
			ear1="Guignol Earring"
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
			body="Karagoz Farsetto",
			back="Visucius's Mantle"
		}

--
-- PRECAST WS SETS
--

	InsertGearSet(sets.precast.ws, set_combine(collections.Mpaca,
		{
			neck="Fotia Gorget",
			ear1="Sroda Earring",
			ear2="Moonshade Earring",
			ring1="Epona's Ring",
			ring2="Karieyh Ring +1",
			back="Null Shawl",
			waist="Fotia Belt"
		}))

	sets.precast.ws["Asuran Fists"] =
		{
			
		}

	sets.precast.ws["Dragon Kick"] =
		{
			
		}

	sets.precast.ws["Howling Fist"] =
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

	InsertGearSet(sets.precast.magic, templates.fastcast)

--
-- MIDCAST MAGIC SETS
--

	InsertGearSet(sets.midcast.magic, templates.fastcast)

--
-- ENGAGED SET
--

	sets.engaged = set_combine(collections.Mpaca,
		{
			ear1="Brutal Earring",
			ear2="Cessance Earring",
			neck="Shulmanu Collar",
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			waist="Null Belt",
			back="Null Shawl"
		})

	mods.engaged["automaton"] =
		{
			ear1="Sroda Earring",
			ear2="Karagoz Earring +1",
			back="Visucius's Mantle",		-- 10% Haste
			waist="Klouskap Sash",			--  8% Haste
			feet="Tali'ah Crackows +2"		--  7% Haste
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

	-- -Pet DT gear when engaged and the Pet Mode mod = "PetDT"
	mods.engaged["PetDT"] =
		{
			
		}

	-- Additional gear that will be equipped when engaged and Overdrive is active
	mods.engaged["Overdrive"] =
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
-- ENGAGED OVERRIDES
--

	overrides.engaged["PetSolo"] = templates.petsolo

--
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.idle, set_combine(sets.engaged,
		{
			feet="Hermes' Sandals"
		}))

	sets.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape"
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

--
-- IDLE & RESTING OVERRIDES
--

	overrides.idle["PetSolo"] = templates.petsolo
	overrides.resting["PetSolo"] = templates.petsolo