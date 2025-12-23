--
-- CUSTOMIZATONS
--
	capes = {}
	capes.bard = { name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}

	templates = {}

	templates.fastcast =
		{
			main="Malevolence",				--  5%
			--ammo="Sapience Orb",			--  2%
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
		}									-- 81% w/o Sapience

	templates.refresh =
		{
			main="Daybreak",
			neck="Sibyl Scarf",
			legs="Lengo Pants"
		}

	templates.wsd =
		{
			ammo="Oshasha's Treatise",
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			neck="Republican Platinum Medal"
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
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
		}

	sets.precast.ws["Rudra's Storm"] = templates.wsd

	sets.precast.ws["Savage Blade"] = templates.wsd

	sets.precast.ws["Shark Bite"] = templates.wsd

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

		}

--
-- MIDCAST MAGIC SETS
--
	InsertGearSet(sets.midcast.magic, templates.fastcast)

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

	InsertGearSet(sets.midcast.magic.singing,
		{
			neck="Moonbow Whistle",
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
			--hands="Mousai Gages"
		}

	sets.midcast.magic.singing.friend.madrigal =
		{
			head="Fili Calot +2",
			back=capes.bard
		}

	sets.midcast.magic.singing.friend.mambo = 
		{
			--feet="Mousai Crackows"
		}

	sets.midcast.magic.singing.friend.march =
		{
			hands="Fili Manchettes +2"
		}

	sets.midcast.magic.singing.friend.minne =
		{
			--legs="Mousai Seraweels"
		}

	sets.midcast.magic.singing.friend.minuet =
		{
			body="Fili Hongreline +2"
		}

	sets.midcast.magic.singing.friend.paeon =
		{
			head="Brioso Roundlet +4",
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
			--body="Mousai Manteel"
		}

--
-- ENGAGED SET
--

	sets.engaged = 
		{
			head="Fili Calot +2",
			neck="Null Loop",
			ear1="Brutal Earring",
			ear2="Cessance Earring",
			body="Fili Hongreline +2",
			hands="Fili Manchettes +2",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Sailfi Belt +1",
			legs="Fili Rhingrave +2",
			feet="Fili Cothurnes +2"
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