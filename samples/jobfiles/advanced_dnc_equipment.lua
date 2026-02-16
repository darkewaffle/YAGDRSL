--
-- CUSTOMIZATIONS
--

	capes = {}
	capes.wsd = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	capes.tp = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%'}}

	gear.adhemar = {name="Adhemar Wristbands +1", priority=22}
	gear.ibn = {name="Inquisitor Bead Necklace", priority=55}

	af =
		{
			head = {name="Maxixi Tiara +3", priority=64},
			body = {name="Maxixi Casaque +4", priority=108},
			hands = {name="Maxixi Bangles +4", priority=87},
			legs = {name="Maxixi Tights +4", priority=90},
			feet = {name="Maxixi Toe Shoes +3", priority=59}
		}

	relic =
		{
			head = {name="Horos Tiara +3", priority=86},
			body = {name="Horos Casaque +3", priority=79},
			hands = {name="Horos Bangles +3", priority=85},
			legs = {name="Horos Tights +3", priority=67},
			feet = {name="Horos Toe Shoes +4", priority=83},
		}

	empy =
		{
			head = {name="Maculele Tiara +3", priority=71},
			body = {name="Maculele Casaque +2", priority=83},
			hands = {name="Maculele Bangles +3", priority=57},
			legs = {name="Maculele Tights +3", priority=80},
			feet = {name="Maculele Toe Shoes +3", priority=45},
		}

	MoonshadeAlternates = {"Ishvara Earring", "Sherida Earring"}

	DualWield = {}
	DualWield[0] = {}

	DualWield[4] =
		{
			ear1=gear.eabani
		}

	DualWield[9] =
		{
			ear1=gear.eabani,
			waist="Patentia Sash"
		}

	DualWield[14] =
		{
			ear1=gear.eabani,
			ear2="Suppanomimi",
			waist="Patentia Sash"
		}

	DualWield[20] =
		{
			ear1=gear.eabani,
			body=empy.body,
			waist="Patentia Sash"
		}

	DualWield[25] =
		{
			ear1=gear.eabani,
			ear2="Suppanomimi",
			body=empy.body,
			waist="Patentia Sash"
		}

	templates = {}
	
	templates.maxhp =
		{
			head=empy.head,
			neck=gear.ibn,
			ear1=gear.alabaster,
			ear2=gear.eabani,
			body=af.body,
			hands=af.hands,
			ring1=gear.meridian,
			ring2=gear.etana,
			waist=gear.pmb,
			legs=af.legs,
			feet=relic.feet
		}

	templates.wsd =
		{
			ammo="Oshasha's Treatise",
			head=empy.head,
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			hands=af.hands,
			ring1="Karieyh Ring +1",
			back=capes.wsd,
			legs=relic.legs
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

	sets.precast.ja.jig =
		{
			legs=relic.legs,
			feet=af.feet
		}

	sets.precast.ja.samba =
		{
			head=af.head,
			back=capes.tp
		}

	sets.precast.ja.step = set_combine(collections.Null,
		{
			ammo="Yamarang",
			head=empy.head,
			ear1="Odr Earring",
			ear2="Maculele Earring +1",
			body=af.body,
			hands=af.hands,
			ring1="Mummu Ring",
			ring2="Lehko's Ring",
			legs=empy.legs,
			feet=relic.feet
		})

	sets.precast.ja.waltz =
		{
			head="Anwig Salade",		-- 2 delay
			body=af.body,				-- 19%, 2 delay
			legs="Dashing Subligar",	-- 10%, blink
		}

	sets.precast.ja.waltz.cure = set_combine(templates.maxhp, 
		{
			ammo="Yamarang",			-- 5%
			neck="Etoile Gorget +1",	-- 7%
			ear1=gear.alabaster,
			ear2="Roundel Earring",		-- 5%
			ring1=gear.meridian,
			ring2="Asklepian Ring",		-- 3% received
			back="Toetapper Mantle"		-- 5%
		})


	sets.precast.ja["Animated Flourish"] =
		{
			ammo="Sapience Orb",
			ear2=gear.cryptic,
			neck=gear.unmoving,
			hands=relic.hands,
			ring2=gear.vengeful
		}

	sets.precast.ja["Climactic Flourish"] =
		{
			head=empy.head
		}

	sets.precast.ja["Feather Step"] =
		{
			feet=empy.feet
		}

	sets.precast.ja["No Foot Rise"] =
		{
			body=relic.body
		}

	sets.precast.ja["Reverse Flourish"] =
		{
			hands=empy.hands,
			back="Toetapper Mantle"
		}

	sets.precast.ja["Saber Dance"] =
		{
			legs=relic.legs
		}

	sets.precast.ja["Trance"] =
		{
			head=relic.head
		}

	sets.precast.ja["Violent Flourish"] = set_combine(collections.Null, collections.Malignance, 
		{
			ammo="Yamarang",
			head=empy.head,
			ear1="Odr Earring",
			ear2="Maculele Earring +1",
			body=relic.body,
			hands=af.hands,
			ring1="Mummu Ring",
			ring2="Lehko's Ring",
			feet=empy.feet
		})

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
			ammo="Cath Palug Stone",
			head=empy.head,
			ear1="Sherida Earring",
			ear2="Odr Earring",
			--ear2="Maculele Earring +1",
			body=relic.body,
			hands=empy.hands,
			ring1=gear.ilabrat,
			ring2=gear.regalring,
			back=capes.tp,
			legs=empy.legs,
			feet=empy.feet
		}

	sets.precast.ws["Evisceration"] = set_combine(collections.Gleti,
		{
			ammo="Charis Feather",
			ring1="Lehko's Ring"
		})

	sets.precast.ws["Pyrrhic Kleos"] =
		{

		}

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
			head=empy.head,
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body={name="Samnuha Coat", priority=63},
			hands=af.hands,
			ring1="Karieyh Ring +1",
			ring2="Beithir Ring",
			back=capes.wsd
		})

--
-- PRECAST WS MODS
--

	mods.precast.ws.melee.physical["Acc"] =
		{
			ear1="Odr Earring",
			ear2="Maculele Earring +1",
			body=af.body,
			hands=af.hands,
			back="Null Shawl",
			legs=empy.legs
		}

	mods.precast.ws.melee.physical["Climactic Flourish"] =
		{
			ammo="Charis Feather",
			head=empy.head,
			neck="Etoile Gorget +1"
		}

	mods.precast.ws.melee.physical["Striking Flourish"] =
		{
			body=empy.body
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

	sets.status.engaged = set_combine(collections.Malignance,
		{
			ammo="Yamarang",
			head=empy.head,
			neck="Anu Torque",
			ear1="Cessance Earring",
			ear2="Sherida Earring",
			hands=gear.adhemar,
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			back=capes.tp,
			waist="Sailfi Belt +1",
			feet=relic.feet
		})

--
-- ENGAGED OFFENSE MODS
--

	mods.status.engaged["Acc"] = set_combine(collections.Null, collections.Malignance,
		{
			ammo="Yamarang",
			head=empy.head,
			ear1="Cessance Earring",
			ear2="Odr Earring",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back=capes.tp,
			legs=empy.legs,
			feet=empy.feet
		})

	mods.status.engaged["Multi"] =
		{
			ammo="Coiste Bodhar",
			neck="Lissome Necklace",
			ear1="Brutal Earring",
			ear2="Sherida Earring",
			body=relic.body,
			hands=gear.adhemar,
			ring1="Epona's Ring",
			ring2="Lehko's Ring",
			back=capes.tp,
			waist="Sailfi Belt +1",
			legs={name="Samnuha Tights", priority=41}
		}

	mods.status.engaged["STP"] =
		{
			
		}
	
	mods.status.engaged["Subtle"] =
		{
			
		}

	mods.status.engaged["TH2"] =
		{
			hands=gear.TH2_light_hands
		}

	mods.status.engaged["TH4"] =
		{
			ammo="Perfect Lucky Egg",
			hands=gear.TH2_light_hands,
			waist="Chaac Belt"
		}

--
-- ENGAGED DEFENSE MODS
--

	mods.status.engaged["PDT"] = set_combine(collections.Malignance,
		{
			neck=collections.Null.neck,
			back=capes.tp,
			feet=empy.feet
		})

	mods.status.engaged["PDTHP"] =
		{
			neck=collections.Null.neck,
			ear1=gear.alabaster,
			body=collections.Malignance.body,
			back=capes.tp,
			waist=gear.pmb,
			legs=collections.Malignance.legs,
			feet=empy.feet
		}

	mods.status.engaged["MEvaLo"] = set_combine(collections.Malignance,
		{
			ammo="Yamarang",
			back="Null Shawl"
		})

	mods.status.engaged["MEvaHi"] = set_combine(mods.status.engaged["MEvaLo"],
		{
			ear1=gear.eabani,
			waist="Null Belt",
			ring1=gear.vengeful
		})

	mods.status.engaged["MEvaHP"] = set_combine(mods.status.engaged["MEvaHi"],
		{
			neck=gear.ibn,
			ear2=gear.alabaster,
			waist=gear.pmb
		})

--
-- ENGAGED OVERRIDES
--

	overrides.status["BossTank"] = set_combine(collections.Null, collections.Malignance,
		{
			ammo="Yamarang",
			ear1=gear.alabaster,
			ear2="Sherida Earring",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back=capes.tp,
			legs=empy.legs,
			feet=empy.feet
		})

	overrides.status["Vagary"] = set_combine(collections.Malignance,
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

	InsertGearSet(sets.status.idle, set_combine(collections.Null, collections.Gleti,
		{
			ear1=gear.alabaster,
			ring1="Karieyh Ring +1",
			ring2="Murky Ring",
			back=capes.tp,
			waist=gear.pmb
		}))

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

	mods.status.engaged[STATE_PLAYER_FACING_FRONT] =
		{
			feet=relic.feet
		}