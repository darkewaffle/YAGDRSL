--
-- CUSTOMIZATIONS
--
	capes.bard = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	capes.wsd = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	capes.tp = { name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}}

	gear.ayanmo_head = {name="Ayanmo Zucchetto +2", priority=45}
	gear.ayanmo_body = {name="Ayanmo Corazza +2", priority=57}
	gear.ayanmo_hands = {name="Ayanmo Manopolas +2", priority=22}
	gear.ayanmo_legs = {name="Ayanmo Cosciales +2", priority=45}

	gear.inyanga_body = {name="Inyanga Jubbah +2", priority=85}
	gear.inyanga_hands = {name="Inyanga Dastanas +2", priority=35}
	gear.inyanga_legs = {name="Inyanga Shalwar +2", priority=55}

	gear.kaykaus_body = {name="Kaykaus Bliaut", priority=124}
	gear.kaykaus_hands = {name="Kaykaus Cuffs", priority=80}

	gear.kali1 = {name="Kali", bag="Wardrobe 1"}
	gear.kali2 = {name="Kali", bag="Wardrobe 2"}

	gear.linos_tp = { name="Linos", augments={'Accuracy+11 Attack+11','"Store TP"+4','Quadruple Attack +3',}}
	gear.linos_ws = { name="Linos", augments={'Attack+15','Weapon skill damage +3%','STR+6 DEX+6',}}

	gear.mousai_head = {name="Mousai Turban", priority=102}
	gear.mousai_body = {name="Mousai Manteel", priority=171}
	gear.mousai_hands = {name="Mousai Gages", priority=68}
	gear.mousai_legs = {name="Mousai Seraweels", priority=136}
	gear.mousai_feet = {name="Mousai Crackows", priority=79}

	gear.vanya_head = {name="Vanya Hood", priority=36}
	gear.vanya_legs = {name="Vanya Slops", priority=43}
	gear.vanya_feet = {name="Vanya Clogs", priority=13}

	af =
		{
			head = {name="Brioso Roundlet +4", priority=74},
			body = {name="Brioso Justaucorps +4", priority=101},
			hands = {name="Brioso Cuffs +4", priority=53},
			legs = {name="Brioso Cannions +1", priority=43},
			feet = {name="Brioso Slippers +4", priority=84}
		}

	relic =
		{
			head = {},
			body = {name="Bihu Justaucorps +3", priority=89},
			hands = {},
			legs = {name="Bihu Cannions", priority=60},
			feet = {name="Bihu Slippers +4", priority=43},
		}

	empy =
		{
			head = {name="Fili Calot +2", priority=56},
			body = {name="Fili Hongreline +2", priority=74},
			hands = {name="Fili Manchettes +2", priority=42},
			legs = {name="Fili Rhingrave +2", priority=63},
			feet = {name="Fili Cothurnes +2", priority=33},
		}

	DualWield = {}
	DualWield[0] = {}

	DualWield[4] =
		{
			ear1=gear.eabani
		}

	DualWield[5] =
		{
			ear1="Suppanomimi"
		}
--[[
	DualWield[7] =
		{
			waist="Reiki Yotai"
		}

	DualWield[9] =
		{
			ear1=gear.eabani,
			ear2="Suppanomimi"
		}

	DualWield[12] =
		{
			ear1="Suppanomimi",
			waist="Reiki Yotai"
		}


	DualWield[16] =
		{
			ear1=gear.eabani,
			ear2="Suppanomimi",
			waist="Reiki Yotai"
		}
]]

	templates = {}

	templates.fastcast =
		{
			main="Malevolence",				--  5%
			head=gear.vanya_head,			-- 10%
			neck="Voltsurge Torque",		--  4%
			ear1=gear.etiolation,			--  1%
			ear2="Loquacious Earring",		--  2%
			body=gear.inyanga_body,			-- 14%
			hands=gear.leyline,				--  7%
			ring1="Kishar Ring",			--  4%
			ring2="Prolix Ring",			--  2%
			back=capes.bard,				-- 10%
			waist="Shinjutsu-no-obi +1",	--  5%
			legs=gear.ayanmo_legs,			--  7%
			feet=empy.feet					-- 10%
		}									-- 81%

	templates.refresh =
		{
			main="Daybreak",
			head=collections.Null.mask,
			neck="Sibyl Scarf",
			body="Kaykaus Bliaut",
			legs="Lengo Pants"
		}

	templates.wsd =
		{
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			body=relic.body,
			ring1=gear.epa,
			back=capes.wsd
		}

--
-- PRECAST JA SETS
--

	sets.precast.ja["Troubadour"] =
		{
			body=relic.body
		}

	sets.precast.ja["Soul Voice"] =
		{
			legs=relic.legs
		}

	sets.precast.ja["Nightingale"] =
		{
			feet=relic.feet
		}

--
-- PRECAST WS SETS
--

	InsertGearSet(sets.precast.ws,
		{
			neck="Fotia Gorget",
			waist="Fotia Belt"
		})

	sets.precast.ws.melee.physical = set_combine(collections.Nyame,
		{
			ranged=gear.linos_ws,
			ear1="Brutal Earring",
			ear2="Cessance Earring",
			body=relic.body,
			--ring1="Lehko's Ring",
			ring1="Fickblix's Ring",
			ring2=gear.ilabrat,
			back="Null Shawl",
			feet=relic.feet
		})

	sets.precast.ws["Evisceration"] =
		{
			--ring1="Lehko's Ring"
			waist="Kentarch Belt +1",
		}

	sets.precast.ws["Mordant Rime"] = set_combine(templates.wsd,
		{
			neck="Bard's Charm +1",
			waist="Kentarch Belt +1"
		})

	sets.precast.ws["Rudra's Storm"] = set_combine(templates.wsd,
		{
			neck="Bard's Charm +1",
			waist="Kentarch Belt +1"
		})

	sets.precast.ws["Savage Blade"] = set_combine(templates.wsd,
		{
			head=collections.Null.mask,
			neck="Republican Platinum Medal",
			waist="Sailfi Belt +1"
		})

	sets.precast.ws.melee.magical = set_combine(collections.Null, collections.Nyame,
		{
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body=relic.body,
			ring1=gear.epa,
			ring2=gear.stik1,
			back=capes.wsd
		})

--
-- PRECAST MAGIC SETS
--

	InsertGearSet(sets.precast.magic, templates.fastcast)

	-- sets.precast.magic currently provides 81% Fast Cast
	InsertGearSet(sets.precast.magic.singing,
		{
			ranged="Miracle Cheer"
		})

	sets.precast.magic.singing.enemy.lullaby.horde =
		{
			ranged="Blurred Harp"
		}

	sets.precast.magic.singing.friend["Honor March"] =
		{
			ranged="Marsyas"
		}

--
-- MIDCAST MAGIC SETS
--

	InsertGearSet(sets.midcast.magic, templates.fastcast)

	InsertGearSet(sets.midcast.magic.enfeebling, set_combine(collections.Null,
		{
			main="Daybreak",
			sub="Ammurapi Shield",
			ranged="Nibiru Harp",
			head=af.head,
			ear1="Regal Earring",
			ear2="Fili Earring +1",
			body=af.body,
			hands=gear.inyanga_hands,
			ring1=gear.stik1,
			ring2=gear.stik2,
			legs=empy.legs,
			feet=af.feet
		}))

	sets.midcast.magic.healing.cure =
		{
			main="Daybreak",
			--head=gear.vanya_head,
			head=collections.Null.mask,
			ear2="Mendicant's Earring",
			body=gear.kaykaus_body,
			hands=gear.kaykaus_hands,
			ring1="Naji's Loop",
			ring2="Mephitas's Ring +1",
			waist="Shinjutsu-no-obi +1",
			legs=gear.vanya_legs,
			feet=gear.vanya_feet
		}

	sets.midcast.magic.healing.curaga = sets.midcast.magic.healing.cure

	InsertGearSet(sets.midcast.magic.singing,
		{
			ranged="Miracle Cheer",
			neck="Moonbow Whistle +1",
		})

	InsertGearSet(sets.midcast.magic.singing.friend,
		{
			ear2="Fili Earring +1",
			head=empy.head,
			body=empy.body,
			hands=empy.hands,
			legs=empy.legs,
			feet=empy.feet
		})

	sets.midcast.magic.singing.friend.ballad =
		{
			legs=empy.legs
		}

	sets.midcast.magic.singing.friend.carol =
		{
			hands=gear.mousai_hands
		}

	sets.midcast.magic.singing.friend.etude =
		{
			hands=gear.mousai_head
		}

	sets.midcast.magic.singing.friend.madrigal =
		{
			head=empy.head,
			back=capes.bard
		}

	sets.midcast.magic.singing.friend.mambo = 
		{
			feet=gear.mousai_feet
		}

	sets.midcast.magic.singing.friend.march =
		{
			hands=empy.hands
		}

	sets.midcast.magic.singing.friend.march["Honor March"] =
		{
			main=gear.kali1,
			sub=gear.kali2,
			ranged="Marsyas",
			legs=gear.inyanga_legs,
			feet=af.feet
		}

	sets.midcast.magic.singing.friend.minne =
		{
			legs=gear.mousai_legs
		}

	sets.midcast.magic.singing.friend.minuet =
		{
			body=empy.body
		}

	sets.midcast.magic.singing.friend.paeon =
		{
			head=af.head
		}

	sets.midcast.magic.singing.friend.prelude =
		{
			back=capes.bard
		}

	sets.midcast.magic.singing.friend["Sentinel's Scherzo"] =
		{
			feet=empy.feet
		}

	InsertGearSet(sets.midcast.magic.singing.enemy,
		{
			main="Daybreak",
			sub="Ammurapi Shield",
			head=af.head,
			ear1="Regal Earring",
			ear2="Fili Earring +1",
			body=empy.body,
			hands=empy.hands,
			ring1=gear.stik1,
			ring2=gear.stik2,
			back=capes.bard,
			waist="Null Belt",
			legs=gear.inyanga_legs,
			feet=af.feet
		})

	InsertGearSet(sets.midcast.magic.singing.enemy.lullaby,
		{
			hands=af.hands
		})

	sets.midcast.magic.singing.enemy.lullaby.foe =
		{
			-- Just wants to be full MAcc + Duration from sets.midcast.magic.singing.enemy
		}

	sets.midcast.magic.singing.enemy.lullaby.horde =
		{
			ranged="Blurred Harp"
		}

	sets.midcast.magic.singing.enemy.lullaby.horde["Horde Lullaby II"] =
		{
			--ear2="Gersemi Earring",
			body=af.body,
			hands=af.hands,
			--hands=gear.inyanga_hands,
			--hands=empy.hands,
			--waist="Harfner's Sash",
			waist="Null Belt",
			feet=relic.feet
		}

	sets.midcast.magic.singing.enemy.threnody =
		{
			body=gear.mousai_body
		}

--
-- MIDCAST MAGIC MODS
--

	-- +Magic Accuracy gear when the Debuff mod = "MAcc"
	mods.midcast.magic.singing.enemy["MAcc"] =
		{
			
		}

	-- +Duration gear when the Debuff mod = "Duration"
	mods.midcast.magic.singing.enemy["Duration"] =
		{
			
		}

	-- Additional midcast gear that will be equipped when Troubadour is active and the song is targeting an enemy
	mods.midcast.magic.singing.enemy["Troubadour"] =
		{
			
		}

--
-- ENGAGED SET
--

	sets.status.engaged = set_combine(collections.Nyame, 
		{
			ranged=gear.linos_tp,
			head=gear.ayanmo_head,
			neck="Bard's Charm +1",
			ear1="Telos Earring",
			ear2="Cessance Earring",
			body=gear.ayanmo_body,
			hands=collections.Bunzi.hands,
			ring1=gear.ilabrat,
			ring2="Fickblix's Ring",
			--ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Sailfi Belt +1",
			legs=empy.legs,
			--feet=empy.feet
		})

--
-- ENGAGED OFFENSE MODS
--

	-- +Accuracy gear when engaged and the Offense mod = "Acc"
	mods.status.engaged["Acc"] =
		{
			neck=collections.Null.neck
		}

	-- +Multiattack gear when engaged and the Offense mod = "Multi"
	mods.status.engaged["Multi"] =
		{
			
		}

	-- +Treasure Hunter gear when engaged and the TH mod = "+TH"
	mods.status.engaged["+TH"] =
		{
			waist="Chaac Belt"
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

	InsertGearSet(sets.status.idle, set_combine(collections.Bunzi,
		{
			main="Daybreak",
			sub="Genmei Shield",
			head=empy.head,
			neck="Warder's Charm +1",
			ear1=gear.alabaster,
			ear2=gear.eabani,
			--body=empy.body,
			--hands=empy.hands,
			ring1="Murky Ring",
			--ring2="Defending Ring",
			ring2=gear.vengeful,
			back="Null Shawl",
			waist="Carrier's Sash",
			legs=empy.legs,
			feet=empy.feet
		}))

	sets.status.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape",
		}

	sets.status.resting = set_combine(sets.status.idle, templates.refresh)

--
-- IDLE & RESTING MODS
--

	mods.status["Naeg"] = {main="Naegling"}
	mods.status["Dayb"] = {main="Daybreak"}

	mods.status["Dem"] = {sub="Demersal Degen +1"}
	mods.status["TP"] = {sub="Centovente"}
	mods.status["Ammu"] = {sub="Ammurapi Shield"}

	mods.status.idle["+Refresh"] = templates.refresh

--
-- OVERRIDES
--

	overrides.status["DynaNeck"] = {neck="Bard's Charm +1"}
	overrides.precast.ws["DynaNeck"] = {neck="Bard's Charm +1"}
	overrides.precast.ja["DynaNeck"] = {neck="Bard's Charm +1"}

	overrides.status.engaged["Odin"] =
		{
			main="Norgish Dagger",
			sub="Esoteric Athame",
			ranged=gear.linos_tp,
			head=af.head,
			ear1="Suppanomimi",
			ear2="Brutal Earring",
			--hands=collections.Bunzi.hands,
			hands=gear.ayanmo_hands,
			ring1=gear.etana,
			ring2="Fickblix's Ring",
			back="Null Shawl",
			waist="Sailfi Belt +1",
			legs=empy.legs,
			feet=af.feet
		}

sets.precast.magic.singing["Army's Paeon"] = {range="Daurdabla"}
sets.midcast.magic.singing["Army's Paeon"] = {range="Daurdabla"}