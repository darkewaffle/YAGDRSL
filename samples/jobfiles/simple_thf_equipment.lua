--
-- CUSTOMIZATIONS
--
	capes = {}
	capes.thf = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	templates = {}

	templates.wsd =
		{
			ammo="Oshasha's Treatise",
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			ring1="Karieyh Ring +1"
		}

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

--
-- PRECAST JA SETS
--

	sets.precast.ja["Perfect Dodge"] =
		{
			hands="Plunderer's Armlets +1"
		}

	sets.precast.ja["Despoil"] =
		{
			feet="Skulker's Poulaines +2"
		}

	sets.precast.ja.waltz =
		{
			head="Anwig Salade",		-- 2 delay
			legs="Dashing Subligar",	-- 10%, blink
		}

	sets.precast.ja.waltz.cure = 
		{
			ammo="Yamarang",			-- 5%
			ear1="Alabaster Earring",
			ear2="Roundel Earring",		-- 5%
			ring1="Meridian Ring",
			ring2="Asklepian Ring",		-- 3% received
			back="Toetapper Mantle"		-- 5%
		}

--
-- PRECAST WS SETS
-- 

	InsertGearSet(sets.precast.ws,
		{
			neck="Fotia Gorget",
			waist="Fotia Belt"
		})

	sets.precast.ws.melee.physical = set_combine(collections.Gleti,
		{
			ammo="Oshasha's Treatise",
			ear1="Odr Earring",
			ear2="Sherida Earring",
			ring1="Karieyh Ring +1",
			ring2="Ilabrat Ring",
			back=capes.thf,
			feet="Skulker's Poulaines +2"
		})

	sets.precast.ws["Evisceration"] = set_combine(collections.Gleti,
		{
			ear1="Odr Earring",
			ear2="Sherida Earring",
			ammo="Charis Feather",
			ring1="Lehko's Ring"
		})

	sets.precast.ws["Rudra's Storm"] = set_combine(templates.wsd,
		{
			neck="Republican Platinum Medal",
			waist="Sailfi Belt +1"
		})

	sets.precast.ws["Shark Bite"] = set_combine(templates.wsd,
		{
			neck="Republican Platinum Medal",
			waist="Sailfi Belt +1"
		})

	sets.precast.ws.melee.magical = set_combine(collections.Nyame,
		{
			ammo="Oshasha's Treatise",
			neck="Null Loop",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body="Samnuha Coat",
			ring1="Karieyh Ring +1",
			ring2="Etana Ring",
			back="Null Shawl",
			waist="Null Belt"
		})

--
-- PRECAST WS MODS
--

	mods.precast.ws.melee.physical["Acc"] =
		{
			ammo="Yamarang",
			ear1="Odr Earring",
			ear2="Skulker's Earring +1",
			back="Null Shawl"
		}

	mods.precast.ws.melee.physical["Sneak Attack"] =
		{
			ammo="Charis Feather",
			head="Maculele Tiara +3",
			neck="Etoile Gorget +1"
		}

	mods.precast.ws.melee.physical["Trick Attack"] =
		{
			body="Maculele Casaque +2"
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
	sets.engaged = set_combine(collections.Malignance,
		{
			ammo="Coiste Bodhar",
			neck="Erudition Necklace",
			ear1="Sherida Earring",
			ear2="Skulker's Earring +1",
			hands="Adhemar Wristbands +1",
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			back=capes.thf,
			waist="Sailfi Belt +1",
		})

--
-- ENGAGED OFFENSE MODS
--

	mods.engaged["Acc"] = 
		{
			ammo="Yamarang",
			neck="Null Loop",
			ear1="Cessance Earring",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Null Belt",
		}

	mods.engaged["TH"] =
		{
			ammo="Perfect Lucky Egg",
			hands="Plunderer's Armlets +1",
			waist="Chaac Belt",
			feet="Skulker's Poulaines +2"
		}

--
-- ENGAGED DEFENSE MODS
--

	mods.engaged["PDT"] = set_combine(collections.Malignance,
		{
			neck="Null Loop",
			ear1="Alabaster Earring",
			feet="Skulker's Poulaines +2"
		})

--
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.idle, set_combine(collections.Gleti, {ring1="Karieyh Ring +1"}))

	sets.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape",
			feet="Skadi's Jambeaux +1"
		}

	sets.resting = collections.Gleti

--
-- IDLE & RESTING MODS
--

	mods.idle[STATE_MOVING] =
		{
			feet="Skadi's Jambeaux +1"
		}