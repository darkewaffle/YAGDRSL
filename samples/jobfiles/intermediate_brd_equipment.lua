--
-- CUSTOMIZATIONS
--
	capes = {}
	capes.bard = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}

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
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			neck="Republican Platinum Medal",
			ring1="Karieyh Ring +1",
			ring2="Ilabrat Ring"
		}

--
-- PRECAST JA SETS
--

	sets.precast.ja["Troubadour"] =
		{
			body="Bihu Justaucorps"
		}

	sets.precast.ja["Soul Voice"] =
		{
			legs="Bihu Cannions"
		}

	sets.precast.ja["Nightingale"] =
		{
			feet="Bihu Slippers"
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
			head="Fili Calot +2",
			ear1="Brutal Earring",
			ear2="Cessance Earring",
			body="Fili Hongreline +2",
			hands="Fili Manchettes +2",
			ring1="Ilabrat Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
		}

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
			ring1="Etana Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Null Belt"
		})

--
-- PRECAST MAGIC SETS
--

	InsertGearSet(sets.precast.magic, templates.fastcast)

	-- sets.precast.magic currently provides 81% Fast Cast
	sets.precast.magic.singing =
		{
			ranged="Miracle Cheer"
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

	sets.midcast.magic.singing.friend =
		{
			head="Fili Calot +2",
			body="Fili Hongreline +2",
			hands="Fili Manchettes +2",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
		}

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

	sets.midcast.magic.singing.enemy =
		{
			main="Daybreak",
			head="Brioso Roundlet +4",
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
		}

	sets.midcast.magic.singing.enemy.lullaby =
		{
			hands="Brioso Cuffs +3"
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

	sets.engaged =
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
	mods.engaged["Acc"] =
		{
			neck="Null Loop"
		}

	-- +Multiattack gear when engaged and the Offense mod = "Multi"
	mods.engaged["Multi"] =
		{
			
		}

	-- +Treasure Hunter gear when engaged and the TH mod = "+TH"
	mods.engaged["+TH"] =
		{
			waist="Chaac Belt"
		}

--
-- ENGAGED DEFENSE MODS
--

	-- Moderate PDT gear when the Physical Defense mod = "PDTLo"
	mods.engaged["PDTLo"] =
		{
			
		}

	-- High PDT gear when the Physical Defense mod = "PDTHi"
	mods.engaged["PDTHi"] =
		{
			
		}

	-- Moderate MDT/MEva gear when the Magical Defense mod = "MEvaLo"
	mods.engaged["MEvaLo"] =
		{
			
		}

	-- High MDT/MEva gear when the Magical Defense mod = "MEvaHi"
	mods.engaged["MEvaHi"] =
		{
			
		}

--
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.idle,
		{
			main="Daybreak",
			head="Fili Calot +2",
			neck="Null Loop",
			ear1="Alabaster Earring",
			ear2="Eabani Earring",
			body="Fili Hongreline +2",
			hands="Fili Manchettes +2",
			ring1="Murky Ring",
			ring2="Defending Ring",
			back="Null Shawl",
			waist="Carrier's Sash",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
		})

	sets.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape",
		}

	sets.resting = set_combine(sets.idle, templates.refresh)

--
-- IDLE & RESTING MODS
--

	mods.idle["+Refresh"] = templates.refresh

--
-- OVERRIDES
--

	overrides.idle["DynaNeck"] = {neck="Bard's Charm +1"}
	overrides.resting["DynaNeck"] = {neck="Bard's Charm +1"}
	overrides.engaged["DynaNeck"] = {neck="Bard's Charm +1"}
	overrides.precast.ws["DynaNeck"] = {neck="Bard's Charm +1"}
	overrides.precast.ja["DynaNeck"] = {neck="Bard's Charm +1"}