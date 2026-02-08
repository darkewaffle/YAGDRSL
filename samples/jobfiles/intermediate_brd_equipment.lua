--
-- CUSTOMIZATIONS
--
	capes = {}
	capes.bard = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	capes.wsd = { name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

	DualWield = {}
	DualWield[0] = {}

	DualWield[4] =
		{
			ear1="Eabani Earring"
		}

	DualWield[5] =
		{
			ear1="Suppanomimi"
		}

	DualWield[7] =
		{
			ear1="Reiki Yotai"
		}

	DualWield[9] =
		{
			ear1="Eabani Earring",
			ear2="Suppanomimi"
		}

	DualWield[12] =
		{
			ear1="Suppanomimi",
			waist="Reiki Yotai"
		}


	DualWield[16] =
		{
			ear1="Eabani Earring",
			ear2="Suppanomimi",
			waist="Reiki Yotai"
		}

	templates = {}

	templates.fastcast =
		{
			main="Malevolence",				--  5%
			head="Vanya Hood",				-- 10%
			neck="Voltsurge Torque",		--  4%
			ear1="Etiolation Earring",		--  1%
			ear2="Loquacious Earring",		--  2%
			body="Inyanga Jubbah +2",		-- 14%
			hands="Leyline Gloves",			--  7%
			ring1="Kishar Ring",			--  4%
			ring2="Prolix Ring",			--  2%
			back=capes.bard,				-- 10%
			waist="Shinjutsu-no-obi +1",	--  5%
			legs="Ayanmo Cosciales +2",		--  7%
			feet="Fili Cothurnes +2"		-- 10%
		}									-- 81%

	templates.refresh =
		{
			main="Daybreak",
			neck="Sibyl Scarf",
			legs="Lengo Pants"
		}

	templates.wsd =
		{
			neck="Republican Platinum Medal",
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			body="Bihu Justaucorps +3",
			ring1="Karieyh Ring +1",
			ring2="Ilabrat Ring",
			back=capes.wsd,
			waist="Sailfi Belt +1"
		}

--
-- PRECAST JA SETS
--

	sets.precast.ja["Troubadour"] =
		{
			body="Bihu Justaucorps +3"
		}

	sets.precast.ja["Soul Voice"] =
		{
			legs="Bihu Cannions"
		}

	sets.precast.ja["Nightingale"] =
		{
			feet="Bihu Slippers +4"
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
			ranged="Linos",
			ear1="Brutal Earring",
			ear2="Cessance Earring",
			body="Bihu Justaucorps +3",
			ring1="Ilabrat Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			feet="Bihu Slippers +4"
		})

	sets.precast.ws["Evisceration"] =
		{
			
		}

	sets.precast.ws["Mordant Rime"] =
		{
			
		}

	sets.precast.ws["Rudra's Storm"] = templates.wsd

	sets.precast.ws["Savage Blade"] = templates.wsd

	sets.precast.ws.melee.magical = set_combine(collections.Nyame,
		{
			ammo="Oshasha's Treatise",
			neck="Null Loop",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body="Bihu Justaucorps +3",
			ring1="Etana Ring",
			ring2="Lehko's Ring",
			back=capes.wsd,
			waist="Null Belt"
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

--
-- MIDCAST MAGIC SETS
--

	InsertGearSet(sets.midcast.magic, templates.fastcast)

	InsertGearSet(sets.midcast.magic.enfeebling,
		{
			main="Daybreak",
			head="Brioso Roundlet +4",
			neck="Null Loop",
			ear1="Regal Earring",
			ear2="Fili Earring",
			body="Fili Hongreline +2",
			hands="Fili Manchettes +2",
			ring1="Etana Ring",
			ring2="Kishar Ring",
			back=capes.bard,
			waist="Null Belt",
			legs="Fili Rhingrave +2",
			feet="Brioso Slippers +4"
		})

	sets.midcast.magic.healing.cure =
		{
			main="Daybreak",
			head="Vanya Hood",
			ear2="Mendicant's Earring",
			body="Kaykaus Bliaut",
			hands="Kaykaus Cuffs",
			ring1="Naji's Loop",
			ring2="Mephitas's Ring +1",
			waist="Shinjutsu-no-obi +1",
			legs="Vanya Slops",
			feet="Vanya Clogs"
		}

	sets.midcast.magic.healing.curaga = sets.midcast.magic.healing.cure

	InsertGearSet(sets.midcast.magic.singing,
		{
			ranged="Miracle Cheer",
			neck="Moonbow Whistle +1",
		})

	InsertGearSet(sets.midcast.magic.singing.friend,
		{
			head="Fili Calot +2",
			body="Fili Hongreline +2",
			hands="Fili Manchettes +2",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
		})

	sets.midcast.magic.singing.friend.ballad =
		{
			legs="Fili Rhingrave +2"
		}

	sets.midcast.magic.singing.friend.carol =
		{
			hands="Mousai Gages"
		}

	sets.midcast.magic.singing.friend.madrigal =
		{
			head="Fili Calot +2",
			back=capes.bard
		}

	sets.midcast.magic.singing.friend.mambo = 
		{
			feet="Mousai Crackows"
		}

	sets.midcast.magic.singing.friend.march =
		{
			hands="Fili Manchettes +2"
		}

	sets.midcast.magic.singing.friend.minne =
		{
			legs="Mousai Seraweels"
		}

	sets.midcast.magic.singing.friend.minuet =
		{
			body="Fili Hongreline +2"
		}

	sets.midcast.magic.singing.friend.paeon =
		{
			head="Brioso Roundlet +4"
		}

	sets.midcast.magic.singing.friend.prelude =
		{
			back=capes.bard
		}

	sets.midcast.magic.singing.friend["Sentinel's Scherzo"] =
		{
			feet="Fili Cothurnes +2"
		}

	InsertGearSet(sets.midcast.magic.singing.enemy,
		{
			main="Kali",
			head="Brioso Roundlet +4",
			ear1="Regal Earring",
			ear2="Fili Earring",
			body="Fili Hongreline +2",
			hands="Fili Manchettes +2",
			ring1="Etana Ring",
			ring2="Kishar Ring",
			back=capes.bard,
			waist="Null Belt",
			legs="Inyanga Shalwar +2",
			feet="Brioso Slippers +4"
		})

	InsertGearSet(sets.midcast.magic.singing.enemy.lullaby,
		{
			hands="Brioso Cuffs +3"
		})

	sets.midcast.magic.singing.enemy.lullaby.foe =
		{
			-- Just wants to be full MAcc + Duration from sets.midcast.magic.singing.enemy
		}

	sets.midcast.magic.singing.enemy.lullaby.horde =
		{
			ranged="Blurred Harp"
		}

	sets.midcast.magic.singing.enemy.lullaby["Horde Lullaby II"] =
		{
			ear2="Gersemi Earring",
			body="Brioso Justaucorps +2",
			hands="Inyanga Dastanas +2",
			--hands="Fili Manchettes +2",
			waist="Harfner's Sash",
			feet="Bihu Slippers +4"
		}

	sets.midcast.magic.singing.enemy.threnody =
		{
			body="Mousai Manteel"
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

	sets.status.engaged =
		{
			ranged="Linos",
			head="Ayanmo Zucchetto +2",
			neck="Bard's Charm +1",
			ear1="Brutal Earring",
			ear2="Cessance Earring",
			body="Ayanmo Corazza +2",
			hands="Bunzi's Gloves",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Sailfi Belt +1",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
		}

--
-- ENGAGED OFFENSE MODS
--

	-- +Accuracy gear when engaged and the Offense mod = "Acc"
	mods.status.engaged["Acc"] =
		{
			neck="Null Loop"
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
			head="Fili Calot +2",
			neck="Warder's Charm +1",
			ear1="Alabaster Earring",
			ear2="Eabani Earring",
			--body="Fili Hongreline +2",
			--hands="Fili Manchettes +2",
			ring1="Murky Ring",
			--ring2="Defending Ring",
			ring2="Vengeful Ring",
			back="Null Shawl",
			waist="Carrier's Sash",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
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

	mods.status.idle["+Refresh"] = templates.refresh

--
-- OVERRIDES
--

	overrides.status["DynaNeck"] = {neck="Bard's Charm +1"}
	overrides.precast.ws["DynaNeck"] = {neck="Bard's Charm +1"}
	overrides.precast.ja["DynaNeck"] = {neck="Bard's Charm +1"}

	overrides.status["Cat"] =
		{
			ranged="Linos",
			head="Fili Calot +2",
			neck="Null Loop",
			ear1="Suppanomimi",
			ear2="Brutal Earring",
			body="Fili Hongreline +2",
			hands="Bunzi's Gloves",
			ring1="Ilabrat Ring",
			ring2="Lehko's Ring",
			waist="Sailfi Belt +1",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
		}