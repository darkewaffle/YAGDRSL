--
-- CUSTOMIZATIONS
--

	capes = {}
	capes.pet = { name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10','Pet: Magic dmg. taken-10%',}}
	capes.ws_da = { name="Visucius's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}

	gear.petlegs = {name="Taeon Tights", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}}
	gear.taliah_feet = {name="Tali'ah Crackows +2", priority=15}

	af =
		{
			head = {name="Foire Taj +3", priority=64},
			body = {name="Foire Tobe +4", priority=109},
			hands = {name="Foire Dastanas +3", priority=70},
			legs = {name="Foire Churidars +3", priority=133},
			feet = {name="Foire Babouches +3", priority=74}
		}

	relic =
		{
			head = {},
			body = {name="Pitre Tobe +3", priority=100},
			hands = {name="Pitre Dastanas +3", priority=45},
			legs = {},
			feet = {}
		}

	empy =
		{
			head = {name="Karagoz Cappello +2", priority=56},
			body = {name="Karagoz Farsetto", priority=28},
			hands = {},
			legs = {},
			feet = {name="Karagoz Scarpe +2", priority=33},
		}

	templates = {}

	templates.fastcast =
		{
			ammo="Sapience Orb",
			head=gear.fastcast_light_head,
			neck="Voltsurge Torque",
			ear1=gear.etiolation,
			ear2="Loquacious Earring",
			body=gear.fastcast_light_body,
			hands=gear.leyline,
			ring1="Prolix Ring",
			ring2="Naji's Loop",
			legs=gear.fastcast_light_legs,
			feet=gear.fastcast_light_feet
		}

	templates.petsolo = set_combine(collections.Mpaca,
		{
			main="Ohtas",
			ranged="Animator P",
			ammo="Automat. Oil +3",
			head="Anwig Salade",
			neck="Shulmanu Collar",
			ear1="Enmerkar Earring",
			ear2="Karagoz Earring +1",
			body=relic.body,
			--hands="Mpaca's Gloves",
			ring1="Cath Palug Ring",
			ring2="Varar Ring",
			back=capes.pet,
			waist="Incarnation Sash",
			legs=gear.petlegs,
			--feet="Mpaca's Boots"
		})

--
-- PRECAST JA SETS
--

	sets.precast.ja["Overdrive"] =
		{
			body=relic.body
		}

	sets.precast.ja["Repair"] =
		{
			ear1="Guignol Earring",
			feet=af.feet
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
			body=empy.body,
			hands=af.hands,
			back=capes.pet
		}

--
-- PRECAST WS SETS
--

	InsertGearSet(sets.precast.ws, set_combine(collections.Mpaca,
		{
			neck="Fotia Gorget",
			ear1="Schere Earring",
			ear2="Moonshade Earring",
			body=af.body,
			hands=relic.hands,
			ring1="Epona's Ring",
			ring2=gear.regalring,
			back=capes.ws_da,
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

	mods.precast.ws.melee.physical["automaton"] =
		{
			ear2="Sroda Earring"
		}

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

	sets.status.engaged = set_combine(collections.Null, collections.Mpaca,
		{
			ear1="Schere Earring",
			ear2="Cessance Earring",
			neck="Shulmanu Collar",
			ring1="Epona's Ring",
			ring2="Lehko's Ring"
		})

	mods.status.engaged["automaton"] =
		{
			ear1="Sroda Earring",
			ear2="Karagoz Earring +1",
			back=capes.pet,					-- 10% Haste
			waist="Klouskap Sash",			--  8% Haste
			feet=gear.taliah_feet			--  7% Haste
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

	overrides.status.engaged["PetSolo"] = templates.petsolo

--
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.status.idle, set_combine(sets.status.engaged,
		{
			feet="Hermes' Sandals"
		}))

	sets.status.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape"
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

--
-- IDLE & RESTING OVERRIDES
--

	overrides.status.idle["PetSolo"] = templates.petsolo
	overrides.status.resting["PetSolo"] = templates.petsolo