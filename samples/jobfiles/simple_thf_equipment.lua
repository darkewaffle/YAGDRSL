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
			ear1=gear.etiolation,
			ear2="Loquacious Earring",
			body=gear.fastcast_light_body,
			hands=gear.leyline,
			ring1="Prolix Ring",
			ring2="Naji's Loop",
			legs=gear.fastcast_light_legs,
			feet=gear.fastcast_light_feet
		}

--
-- PRECAST JA SETS
--


	sets.precast.ja["Accomplice"] =
		{
			
		}

	sets.precast.ja["Collaborator"] =
		{
			
		}

	sets.precast.ja["Despoil"] =
		{
			feet="Skulker's Poulaines +2"
		}

	sets.precast.ja["Flee"] =
		{
			
		}

	sets.precast.ja["Hide"] =
		{
			
		}

	sets.precast.ja["Mug"] =
		{
			
		}

	sets.precast.ja["Perfect Dodge"] =
		{
			hands="Plunderer's Armlets +1"
		}


	sets.precast.ja["Steal"] =
		{
			
		}

	sets.precast.ja.waltz =
		{
			--head="Anwig Salade",		-- 2 delay
			legs="Dashing Subligar",	-- 10%, blink
		}

	sets.precast.ja.waltz.cure = 
		{
			ammo="Yamarang",			-- 5%
			ear1=gear.alabaster,
			ear2="Roundel Earring",		-- 5%
			ring1=gear.meridian,
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
			ammo="Cath Palug Stone",
			ear1="Odr Earring",
			ear2="Sherida Earring",
			ring1=gear.ilabrat,
			ring2=gear.regalring,
			back=capes.thf,
			feet="Skulker's Poulaines +2"
		})

	sets.precast.ws["Evisceration"] = set_combine(collections.Gleti,
		{
			ear1="Odr Earring",
			ear2="Sherida Earring",
			ring1="Lehko's Ring"
		})

	sets.precast.ws["Mandalic Stab"] = set_combine(templates.wsd,
		{
			neck="Republican Platinum Medal",
			waist="Sailfi Belt +1"
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

	sets.precast.ws.melee.magical = set_combine(collections.Null, collections.Nyame,
		{
			ammo="Oshasha's Treatise",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body="Samnuha Coat",
			ring1="Karieyh Ring +1",
			ring2=gear.etana
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
			back=capes.thf
		}

	mods.precast.ws.melee.physical["Trick Attack"] =
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
	sets.status.engaged = set_combine(collections.Malignance,
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

	mods.status.engaged["Acc"] = set_combine(collections.Null,
		{
			ammo="Yamarang",
			head=collections.Malignance.head,
			ear1="Cessance Earring",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
		})

	-- +Multiattack gear when engaged and the Offense mod = "Multi"
	mods.status.engaged["Multi"] =
		{
			
		}

	-- +Treasure Hunter gear when engaged and the TH mod = "+TH"
	mods.status.engaged["+TH"] =
		{
			ammo="Perfect Lucky Egg",
			hands="Plunderer's Armlets +1",
			waist="Chaac Belt",
			feet="Skulker's Poulaines +2"
		}

	-- Additional gear that will be equipped when engaged and Conspirator is active
	mods.status.engaged["Conspirator"] =
		{
			
		}

	-- Additional gear that will be equipped when engaged and Feint is active
	mods.status.engaged["Feint"] =
		{
			
		}

--
-- ENGAGED DEFENSE MODS
--

	mods.status.engaged["PDT"] = set_combine(collections.Malignance,
		{
			neck=collections.Null.neck,
			ear1=gear.alabaster,
			feet="Skulker's Poulaines +2"
		})

	-- Moderate PDT gear when the Physical Defense mod = "PDTHP"
	mods.status.engaged["PDTHP"] =
		{
			
		}

	-- High PDT gear when the Physical Defense mod = "Eva"
	mods.status.engaged["Eva"] =
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

	-- Additional gear that will be equipped when engaged and Flee is active
	mods.status.engaged["Flee"] =
			{

			}

	-- Additional gear that will be equipped when engaged and Perfect Dodge is active
	mods.status.engaged["Perfect Dodge"] =
			{
				
			}

--
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.status.idle, set_combine(collections.Gleti, {ring1="Karieyh Ring +1"}))

	sets.status.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape",
			feet="Skadi's Jambeaux +1"
		}

	sets.status.resting = collections.Gleti

--
-- IDLE & RESTING MODS
--

	mods.status.idle[STATE_MOVING] =
		{
			feet="Skadi's Jambeaux +1"
		}