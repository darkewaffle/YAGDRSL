	af =
		{
			head = {name="Hachiya Hatsuburi +4", priority=74},
			body = {},
			hands = {},
			legs = {},
			feet = {}
		}

	relic =
		{
			head = {name="Mochizuki Hatsuburi +4", priority=66},
			body = {name="Mochizuki Chainmail +3", priority=79},
			hands = {},
			legs = {name="Mochizuki Hakama +3", priority=82},
			feet = {name="Mochizuki Kyahan +4", priority=43},
		}

	empy =
		{
			head = {name="Hattori Zukin +2", priority=61},
			body = {name="Hattori Ningi +2", priority=83},
			hands = {name="Hattori Tekko +2", priority=47},
			legs = {name="Hattori Hakama +2", priority=70},
			feet = {name="Hattori Kyahan +2", priority=35},
		}

	--capes.fc = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10',}}
	capes.wsd = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	capes.mab = { name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}

	templates = {}
	templates.wsd =
		{
			ammo="Oshasha's Treatise",
			head=af.head,
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			ring1=gear.epa,
			back=capes.wsd,
			legs=relic.legs,
			feet=empy.feet
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
			ring2="Kishar Ring",
			waist="Sailfi Belt +1",
			--back=capes.fc,
			legs=gear.fastcast_light_legs,
			feet=gear.fastcast_light_feet
		}

--
-- PRECAST JA SETS
--

	sets.precast.ja["Mijin Gakure"] =
		{
			legs=relic.legs
		}

--
-- PRECAST WS SETS
--

	-- Gear that should apply to all weaponskills
	-- Likely just Fotia or +Weaponskill Damage pieces
	InsertGearSet(sets.precast.ws,
		{
			neck="Fotia Gorget",
			waist="Fotia Belt",
			back="Null Shawl"
		})

	-- Gear that should apply to all melee, hybrid weaponskills
	sets.precast.ws.melee.hybrid = set_combine(collections.Nyame, templates.wsd,
		{
			ring2=gear.regalring
		})

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical = set_combine(collections.Nyame, templates.wsd,
		{
			--head=relic.head,
			ear1="Friomisi Earring",
			ammo="Ghastly Tathlum +1",
			ring2="Dingir Ring"
		})

	-- Gear that should apply to all melee, physical weaponskills
	sets.precast.ws.melee.physical = set_combine(collections.Mpaca,
		{
			ammo="Coiste Bodhar",
			ear1="Brutal Earring",
			ear2="Hattori Earring +1",
			ring1="Fickblix's Ring",
			ring2=gear.regalring
		})

	sets.precast.ws["Blade: Hi"] = set_combine(templates.wsd,
		{
			ear2="Hattori Earring +1"
		})

	sets.precast.ws["Blade: Kamu"] = set_combine(templates.wsd,
		{
			ear2="Hattori Earring +1"
		})

	sets.precast.ws["Blade: Ku"] =
		{
			
		}

	sets.precast.ws["Blade: Ten"] = set_combine(templates.wsd,
		{
			head=collections.Mpaca.head,
			neck="Republican Platinum Medal",
			waist="Kentarch Belt +1"
		})

	sets.precast.ws["Blade: Shun"] =
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

	mods.precast.ws.melee.magical["THAoE"] =
		{
			hands=gear.TH2_light_hands
		}

--
-- PRECAST MAGIC SETS
--

	-- Probably just Fast Cast gear
	InsertGearSet(sets.precast.magic, templates.fastcast)

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

	sets.midcast.magic.ninjutsu.debuff = set_combine(collections.Null, collections.Nyame,
		{
			feet=relic.feet
		})

	sets.midcast.magic.ninjutsu.elemental = set_combine(collections.Null, collections.Nyame,
		{
			ammo="Ghastly Tathlum +1",
			head=relic.head,
			neck="Sibyl Scarf",
			ear1="Friomisi Earring",
			ring1="Dingir Ring",
			ring2=gear.stik1,
			back=capes.mab,
			feet=relic.feet
		})

	sets.midcast.magic.ninjutsu.utsusemi =
		{
			back=capes.mab,
			feet=empy.feet
		}

--
-- MIDCAST MAGIC MODS
--

	-- Additional gear that will be equipped when casting elemental ninjutsu and Futae is active
	mods.midcast.magic.ninjutsu.elemental["Futae"] =
		{
			hands=empy.hands
		}

--
-- ENGAGED SET
--

	sets.status.engaged = set_combine(collections.Null, collections.Malignance,
		{
			ammo="Date Shuriken",
			head=empy.head,
			body=collections.Mpaca.body,
			ear1="Telos Earring",
			ear2="Cessance Earring",
			neck="Ninja Nodowa +1",
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
			hands=gear.TH2_light_hands
		}

	-- Additional gear that will be equipped when engaged and Innin is active
	mods.status.engaged["Innin"] =
		{
			head=empy.head
		}

	-- Additional gear that will be equipped when engaged and Sange is active
	mods.status.engaged["Sange"] =
		{
			ammo="Happo Shuriken"
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

	-- Additional gear that will be equipped when engaged and Yonin is active
	mods.status.engaged["Yonin"] =
		{
			legs=empy.legs
		}

--
-- IDLE & RESTING SETS
--

	sets.status.idle = set_combine(collections.Null, collections.Malignance,
		{
			ammo="Yamarang",
			head=collections.Null.mask,
			ear1=gear.alabaster,
			ear2=gear.eabani,
			ring1=gear.vengeful,
			ring2="Murky Ring"
		})

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
			feet="Danzo Sune-Ate"
		}

	mods.status.idle["THAoE"] = set_combine(collections.Mpaca,
		{
			feet="Danzo Sune-Ate"
		})

	mods.status["Migawari"] =
		{
			body=empy.body
		}