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
			ring1="Kishar Ring",
			ring2="Naji's Loop",
			--waist="Sailfi Belt +1",
			waist=gear.pmb,
			legs=gear.fastcast_light_legs,
			feet=gear.fastcast_light_feet
		}


--
-- PRECAST JA SETS
--

	sets.precast.ja["Fold"] =
		{
			
		}

	sets.precast.ja["Random Deal"] =
		{
			body="Lanun Frac"
		}

	sets.precast.ja["Snake Eye"] =
		{
			
		}

	sets.precast.ja["Wild Card"] =
		{
			feet="Lanun Bottes +4"
		}

	sets.precast.ja.corsairshot =
		{
			
		}

	sets.precast.ja.roll =
		{
			range="Compensator",
			head="Lanun Tricorne",
			hands="Chasseur's Gants +1",
			neck="Regal Necklace",
			back="Camulus's Mantle"
		}

--
-- PRECAST WS SETS
--

	-- Gear that should apply to all weaponskills
	-- Likely just Fotia or +Weaponskill Damage pieces
	InsertGearSet(sets.precast.ws, set_combine(collections.Null, collections.Nyame,
		{
			neck="Fotia Gorget",
			waist="Fotia Belt"
		}))

	-- Gear that should apply to all melee weaponskills
	InsertGearSet(sets.precast.ws.melee,
		{
			
		})

	-- Gear that should apply to all melee, physical weaponskills
	sets.precast.ws.melee.physical =
		{
			
		}

	sets.precast.ws["Savage Blade"] =
		{
			
		}

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical = set_combine(collections.rse,
		{
			ammo="Animikii Bullet",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			ring1=gear.epa,
			ring2="Dingir Ring",
			feet="Lanun Bottes +4"
		})

	-- Gear that should apply to all ranged weapon weaponskills
	InsertGearSet(sets.precast.ws.distant,
		{
			
		})

	-- Gear that should apply to all ranged weapon, hybrid weaponskills
	sets.precast.ws.distant.hybrid =
		{
			
		}

	-- Gear that should apply to all ranged weapon, physical weaponskills
	sets.precast.ws.distant.physical =
		{
			
		}

	-- Gear that should apply to all ranged weapon, magical weaponskills
	sets.precast.ws.distant.magical =
		{
			
		}

	sets.precast.ws["Detonator"] =
		{
			
		}

	sets.precast.ws["Last Stand"] =
		{
			
		}

	sets.precast.ws["Leaden Salute"] =
		{
			
		}

	sets.precast.ws["Terminus"] =
		{
			
		}

	sets.precast.ws["Wildfire"] =
		{
			
		}

--
-- PRECAST WS MODS
--

	-- +Accuracy gear for melee, physical weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.physical["Acc"] =
		{
			
		}

	-- +Ranged/Magical Accuracy gear for ranged, hybrid weaponskills when the Ranged Offense mod = "RAcc"
	mods.precast.ws.distant.hybrid["RAcc"] =
		{
			
		}

	-- +Ranged Accuracy gear for ranged, physical weaponskills when the Ranged Offense mod = "RAcc"
	mods.precast.ws.distant.physical["RAcc"] =
		{
			
		}

	-- +Ranged/Magical Accuracy gear for ranged, magical weaponskills when the Ranged Offense mod = "RAcc"
	mods.precast.ws.distant.magical["RAcc"] =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	-- Probably just Fast Cast gear
	InsertGearSet(sets.precast.magic, templates.fastcast)

--
-- MIDCAST MAGIC SETS
--

	-- COR isn't a caster so just use the magic precast set to shorten recast
	InsertGearSet(sets.midcast.magic, sets.precast.magic)

--
-- PRECAST RA SETS
--

	sets.precast.ra =
		{
			
		}

--
-- MIDCAST RA SETS
--

	sets.midcast.ra =
		{
			
		}

--
-- MIDCAST RA MODS
--

	-- +Ranged Accuracy gear when using a ranged attack and Ranged Offense mod = "RAcc"
	mods.midcast.ra["RAcc"] =
		{
			
		}

	-- +Treasure Hunter gear when using a ranged attack and TH mod = "+TH"
	mods.midcast.ra["+TH"] =
		{
			
		}

	-- Additional gear that will be equipped when performing a ranged attack and Triple Shot is active
	mods.midcast.ra["Triple Shot"] =
		{
			
		}

--
-- ENGAGED SET
--

	sets.status.engaged = set_combine(collections.Null, collections.Malignance,
		{
			ammo="Coiste Bodhar",
			ear1="Telos Earring",
			ear2="Cessance Earring",
			ring1="Epona's Ring",
			ring2="Fickblix's Ring",
			waist="Sailfi Belt +1",
			legs="Samnuha Tights"
		})

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
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.status.idle, set_combine(collections.Null, collections.Nyame,
		{
			ammo="Staunch Tathlum +1",
			head=collections.Null.mask,
			ear1=gear.alabaster,
			ear2=gear.eabani,
			ring1="Vengeful Ring",
			ring2="Murky Ring",
			waist=gear.pmb,
			legs="Carmine Cuisses +1"
		}))

	sets.status.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape"
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
			legs="Carmine Cuisses +1"
		}

	mods.precast.ws.melee.magical["THAoE"] =
		{
			ammo="Perfect Lucky Egg",
			hands=gear.TH2_light_hands,
			waist="Chaac Belt"
		}

	overrides["+CP"] =
		{
			back=capes.cp
		}

	overrides.status.idle["+CP"] =
		{
			legs="Carmine Cuisses +1"
		}