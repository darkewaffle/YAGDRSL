--
-- CUSTOMIZATIONS
--
	gear.PetLegs = {name="Taeon Tights", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}
--
-- PRECAST JA SETS
--

	sets.precast.ja.maneuver =
		{
			body="Karagoz Farsetto",
			back="Visucius's Mantle"
		}


	sets.precast.ja["Overdrive"] =
		{
			body="Pitre Tobe +2"
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

--
-- PRECAST MAGIC SETS
--

	InsertGearSet(sets.precast.magic,
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
		})

--
-- MIDCAST MAGIC SETS
--
	
	InsertGearSet(sets.midcast.magic, sets.precast.magic)

--
-- ENGAGED SET
--

	sets.engaged = 
		{
			head="Mpaca's Cap",
			neck="Shulmanu Collar",
			ear1="Sroda Earring",
			ear2="Karagoz Earring +1",
			body="Mpaca's Doublet",
			hands="Mpaca's Gloves",
			ring1="Thurandaut Ring +1",
			ring2="Lehko's Ring",
			back="Visucius's Mantle",
			waist="Ukko Sash",
			legs="Mpaca's Hose",
			feet="Tali'ah Crackows +2"
		}

--
-- ENGAGED OFFENSE MODS
--

	mods.engaged["FullPet"] = 
		{
			head="Anwig Salade",
			body="Pitre Tobe +2",
			hands="Mpaca's Gloves",
			ring1="Thurandaut Ring +1",
			ring2="Varar Ring",
			waist="Incarnation Sash",
			legs=gear.PetLegs,
			feet="Mpaca's Boots"
		}

	mods.engaged["FullMaster"] = 
		{
			ear2="Brutal Earring",
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Null Belt",
			feet="Mpaca's Boots"
		}

--
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.idle, set_combine(sets.engaged, mods.engaged["FullPet"],
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

	mods.idle["FullPet"] = 
		{
			feet="Mpaca's Boots"
		}