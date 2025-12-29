--
-- CUSTOMIZATIONS
--
	capes = {}
	capes.wsd = {name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%'}}
	capes.tp = {name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}

	templates = {}

	templates.dualwield = {}
	templates.dualwield[0] = {}

	templates.dualwield[4] =
		{
		ear1="Eabani Earring"
		}

	templates.dualwield[9] =
		{
			ear1="Eabani Earring",
			waist="Patentia Sash"
		}

	templates.dualwield[14] =
		{
			ear1="Eabani Earring",
			ear2="Suppanomimi",
			waist="Patentia Sash"
		}

	templates.dualwield[25] =
		{
			ear1="Eabani Earring",
			ear2="Suppanomimi",
			body="Maculele Casaque +2",
			waist="Patentia Sash"
		}

	templates.maxhp =
		{
			head="Maculele Tiara +3",
			neck="Inquisitor Bead Necklace",
			ear1="Alabaster Earring",
			ear2="Eabani Earring",
			body="Maxixi Casaque +4",
			hands="Maxixi Bangles +4",
			ring1="Meridian Ring",
			ring2="Etana Ring",
			waist="Platinum Moogle Belt",
			legs="Maxixi Tights +4",
			feet="Horos Toe Shoes +4"
		}

	templates.wsd =
		{
			ammo="Oshasha's Treatise",
			head="Maculele Tiara +3",
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			hands="Maxixi Bangles +4",
			back=capes.wsd,
			legs="Horos Tights +3"
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

	sets.precast.ja.jig =
		{
			legs="Horos Tights +3",
			feet="Maxixi Toe Shoes +2"
		}

	sets.precast.ja.samba =
		{
			head="Maxixi Tiara +2",
			back=capes.tp
		}

	sets.precast.ja.step =
		{
			ammo="Yamarang",
			head="Maculele Tiara +3",
			neck="Null Loop",
			ear1="Odr Earring",
			ear2="Maculele Earring +1",
			body="Maxixi Casaque +4",
			hands="Maxixi Bangles +4",
			ring1="Mummu Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Null Belt",
			legs="Maculele Tights +3",
			feet="Horos Toe Shoes +4"
		}

	sets.precast.ja.waltz =
		{
			head="Anwig Salade",		-- 2 delay
			body="Maxixi Casaque +4",	-- 19%, 2 delay
			legs="Dashing Subligar",	-- 10%, blink
		}

	sets.precast.ja.waltz.cure = set_combine(templates.maxhp, 
		{
			ammo="Yamarang",			-- 5%
			neck="Etoile Gorget +1",	-- 7%
			ear1="Alabaster Earring",
			ear2="Roundel Earring",		-- 5%
			ring1="Meridian Ring",
			ring2="Asklepian Ring",		-- 3% received
			back="Toetapper Mantle"		-- 5%
		})


	sets.precast.ja["Animated Flourish"] =
		{
			ammo="Sapience Orb",
			ear2="Cryptic Earring",
			neck="Unmoving Collar +1",
			hands="Horos Bangles +1",
			ring2="Vengeful Ring"
		}

	sets.precast.ja["Climactic Flourish"] =
		{
			head="Maculele Tiara +3"
		}

	sets.precast.ja["Feather Step"] =
		{
			feet="Maculele Toe Shoes +3"
		}

	sets.precast.ja["Fan Dance"] =
		{
			hands="Horos Bangles +1"
		}

	sets.precast.ja["No Foot Rise"] =
		{
			body="Horos Casaque +3"
		}

	sets.precast.ja["Reverse Flourish"] =
		{
			hands="Maculele Bangles +3",
			back="Toetapper Mantle"
		}

	sets.precast.ja["Saber Dance"] =
		{
			hands="Horos Tights +3"
		}

	sets.precast.ja["Striking Flourish"] =
		{
			body="Maculele Casaque +2"
		}

	sets.precast.ja["Trance"] =
		{
			hands="Horos Tiara +1"
		}

	sets.precast.ja["Violent Flourish"] =
		{
			ammo="Yamarang",
			head="Maculele Tiara +3",
			neck="Null Loop",
			ear1="Odr Earring",
			ear2="Maculele Earring +1",
			body="Horos Casaque +3",
			hands="Maxixi Bangles +4",
			ring1="Mummu Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Null Belt",
			legs="Malignance Tights",
			feet="Maculele Toe Shoes +3"
		}

--
-- PRECAST WS SETS
-- 

	InsertGearSet(sets.precast.ws,
		{
			neck="Fotia Gorget",
			waist="Fotia Belt"
		})

	sets.precast.ws.melee.physical = 
		{
			ammo="Charis Feather",
			head="Maculele Tiara +3",
			ear1="Sherida Earring",
			ear2="Maculele Earring +1",
			body="Horos Casaque +3",
			hands="Maculele Bangles +3",
			ring1="Ilabrat Ring",
			ring2="Karieyh Ring +1",
			back=capes.tp,
			legs="Maculele Tights +3",
			feet="Maculele Toe Shoes +3"
		}

	sets.precast.ws["Evisceration"] = set_combine(collections.Gleti,
		{
			ear1="Odr Earring",
			ear2="Sherida Earring",
			ammo="Charis Feather",
			ring1="Mummu Ring",
			ring2="Lehko's Ring"
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
			head="Maculele Tiara +3",
			neck="Null Loop",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body="Samnuha Coat",
			hands="Maxixi Bangles +4",
			ring1="Etana Ring",
			ring2="Karieyh Ring +1",
			back=capes.wsd,
			waist="Null Belt"
		})

--
-- PRECAST WS MODS
--

	mods.precast.ws.melee.physical["Acc"] =
		{
			ammo="Yamarang",
			ear1="Odr Earring",
			ear2="Maculele Earring +1",
			body="Maxixi Casaque +4",
			hands="Maxixi Bangles +4",
			back="Null Shawl",
			legs="Maculele Tights +3"
		}

	mods.precast.ws.melee.physical["Climactic Flourish"] =
		{
			ammo="Charis Feather",
			head="Maculele Tiara +3",
			neck="Etoile Gorget +1"
		}

	mods.precast.ws.melee.physical["Striking Flourish"] =
		{
			body="Maculele Casaque +2"
		}

--
-- PRECAST WS OVERRIDES
--

	overrides.precast.ws["Vagary"] = set_combine(collections.Malignance,
		{
			ammo="Coiste Bodhar",
			neck="Lissome Necklace",
			ear1="Brutal Earring",
			ear2="Sherida Earring",
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Sailfi Belt +1"
		})

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
	sets.engaged = 
		{
			ammo="Yamarang",
			head="Maculele Tiara +3",
			neck="Anu Torque",
			ear1="Cessance Earring",
			ear2="Sherida Earring",
			body="Malignance Tabard",
			hands="Adhemar Wristbands +1",
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			back=capes.tp,
			waist="Sailfi Belt +1",
			legs="Malignance Tights",
			feet="Horos Toe Shoes +4"
		}

--
-- ENGAGED OFFENSE MODS
--

	mods.engaged["Acc"] = 
		{
			ammo="Yamarang",
			head="Maculele Tiara +3",
			neck="Null Loop",
			ear1="Cessance Earring",
			ear2="Odr Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back=capes.tp,
			waist="Null Belt",
			legs="Maculele Tights +3",
			feet="Maculele Toe Shoes +3"
		}

	mods.engaged["Multi"] = 
		{
			ammo="Coiste Bodhar",
			neck="Lissome Necklace",
			ear1="Brutal Earring",
			ear2="Sherida Earring",
			body="Horos Casaque +3",
			hands="Adhemar Wristbands +1",
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			back=capes.tp,
			waist="Sailfi Belt +1",
			legs="Samnuha Tights"
		}

	mods.engaged["STP"] =
		{

		}
	
	mods.engaged["Subtle"] =
		{

		}

	mods.engaged["TH2"] =
		{
			hands=gear.TH2_light_hands
		}

	mods.engaged["TH4"] =
		{
			ammo="Perfect Lucky Egg",
			hands=gear.TH2_light_hands,
			waist="Chaac Belt"
		}

--
-- ENGAGED DEFENSE MODS
--

	mods.engaged["PDT"] = set_combine(collections.Malignance,
		{
			neck="Null Loop",
			back=capes.tp,
			feet="Maculele Toe Shoes +3"
		})

	mods.engaged["PDTHP"] =
		{
			neck="Null Loop",
			ear1="Alabaster Earring",
			body="Malignance Tabard",
			back=capes.tp,
			waist="Platinum Moogle Belt",
			legs="Malignance Tights",
			feet="Maculele Toe Shoes +3"
		}

	mods.engaged["MEvaLo"] = set_combine(collections.Malignance,
		{
			ammo="Yamarang",
			back="Null Shawl"
		})

	mods.engaged["MEvaHi"] = set_combine(mods.engaged["MEvaLo"],
		{
			ear1="Eabani Earring",
			waist="Null Belt",
			ring1="Vengeful Ring"
		})

	mods.engaged["MEvaHP"] = set_combine(mods.engaged["MEvaHi"],
		{
			neck="Inquisitor Bead Necklace",
			ear2="Alabaster Earring",
			waist="Platinum Moogle Belt"	
		})

--
-- ENGAGED OVERRIDES
--

	overrides.engaged["BossTank"] =
		{
			ammo="Yamarang",
			head="Malignance Chapeau",
			neck="Null Loop",
			ear1="Alabaster Earring",
			ear2="Sherida Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back=capes.tp,
			waist="Null Belt",
			legs="Maculele Tights +3",
			feet="Maculele Toe Shoes +3"
		}

	overrides.engaged["Vagary"] = set_combine(collections.Malignance,
		{
			ammo="Coiste Bodhar",
			neck="Lissome Necklace",
			ear1="Brutal Earring",
			ear2="Sherida Earring",
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Sailfi Belt +1"
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
--	IDLE & RESTING MODS
--

	mods.idle[STATE_MOVING] =
		{
			feet="Skadi's Jambeaux +1"
		}

	mods.engaged[STATE_PLAYER_FACING_FRONT] =
		{
			feet="Horos Toe Shoes +4"
		}