--
-- CUSTOMIZATIONS
--

	capes = {}
	capes.fcsird = { name="Rudianos's Mantle", augments={'HP+60','"Fast Cast"+10','Spell interruption rate down-10%',}}
	capes.tank = { name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	capes.wsd = { name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

	gear.feet_fc = { name="Odyssean Greaves", augments={'INT+8','AGI+9','"Fast Cast"+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	gear.feet_sird = { name="Odyssean Greaves", augments={'MND+9','Spell interruption rate down -9%','"Fast Cast"+4','Accuracy+14 Attack+14','Mag. Acc.+3 "Mag.Atk.Bns."+3',}}


	templates = {}
	templates.enmityhp =
		{
			ammo="Sapience Orb",
			head="Loess Barbuta +1",
			neck="Unmoving Collar +1",
			ear1="Alabaster Earring",
			ear2="Cryptic Earring",
			body="Reverence Surcoat +4",
			hands="Caballarius Gauntlets +2",
			--ring1="",
			ring2="Vengeful Ring",
			back=capes.tank,
			waist="Platinum Moogle Belt",
			--legs="",
			feet="Chevalier's Sabatons +2"
		}

	templates.fastcast =
		{
			ammo="Sapience Orb",
			head="Carmine Mask",
			neck="Voltsurge Torque",
			ear1="Etiolation Earring",
			ear2="Loquacious Earring",
			body="Reverence Surcoat +4",
			hands="Leyline Gloves",
			ring1="Prolix Ring",
			ring2="Kishar Ring",
			back=capes.fcsird,
			legs="Enif Cosciales",
			feet="Chevalier's Sabatons +2",
			feet=gear.feet_fc
		}

	templates.hphi =
		{
			neck="Unmoving Collar +1",
			ear1="Alabaster Earring",
			ring1="Etana Ring",
			ring2="Meridian Ring",
			waist="Platinum Moogle Belt"
		}

	templates.hplo =
		{
			neck="Unmoving Collar +1",
			ear1="Alabaster Earring",
			waist="Platinum Moogle Belt"
		}

	templates.refresh =
		{
			ammo="Homiliary",
			head="Jumalik Helm",
			neck="Sibyl Scarf",
			body="Jumalik Mail"
		}

	templates.sird =
		{
			ammo="Impatiens",					-- 10% SIRD
			head="Chevalier's Armet +2",		--				10% DT
			ear1="Alabaster Earring", 			--				 5% DT
			ear2="Knightly Earring",			--  9% SIRD
			body="Chevalier's Cuirass +2",		-- 15% SIRD
			hands="Chevalier's Gauntlets +2",	--				10% DT
			ring1="Murky Ring",					--  3% SIRD		10% DT
			back=capes.fcsird,					-- 10% SIRD
			waist="Platinum Moogle Belt",		--				 3% DT
			legs="Founder's Hose",				-- 30% SIRD
			feet=gear.feet_sird					-- 29% SIRD
		}

--
-- PRECAST JA SETS
--

	InsertGearSet(sets.precast.ja, templates.enmityhp)

	sets.precast.ja["Chivalry"] =
		{
			hands="Caballarius Gauntlets +2"
		}

	sets.precast.ja["Cover"] =
		{
			head="Reverence Coronet"
		}

	sets.precast.ja["Divine Emblem"] =
		{
			feet="Chevalier's Sabatons +2"
		}

	sets.precast.ja["Fealty"] =
		{
			body="Caballarius Surcoat"
		}

	sets.precast.ja["Holy Circle"] =
		{
			feet="Reverence Leggings"
		}

	sets.precast.ja["Invincible"] =
		{
			legs="Caballarius Breeches"
		}

	sets.precast.ja["Rampart"] =
		{
			head="Caballarius Coronet"
		}

	sets.precast.ja["Sentinel"] =
		{
			feet="Caballarius Leggings +3"
		}

	sets.precast.ja["Shield Bash"] =
		{
			hands="Caballarius Gauntlets +2"
		}
--
-- PRECAST WS SETS
--

	InsertGearSet(sets.precast.ws,
		{
			neck="Fotia Gorget",
			waist="Fotia Belt"
		})

	sets.precast.ws.melee.physical = set_combine(collections.Sakpata,
		{
			ammo="Coiste Bodhar",
			ear1="Cessance Earring",
			ear2="Brutal Earring",
			ring1="Rajas Ring",
			ring2="Karieyh Ring +1",
			back=capes.wsd,
			waist="Sailfi Belt +1",
		})

	sets.precast.ws["Atonement"] = set_combine(templates.enmityhp,
		{
			neck="Fotia Gorget",
			waist="Fotia Belt"
		})

	sets.precast.ws["Chant Du Cygne"] =
		{
			back="Null Shawl",
			ring1="Lehko's Ring"
		}

	sets.precast.ws["Savage Blade"] =
		{
			ammo="Oshasha's Treatise",
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			neck="Republican Platinum Medal",
			feet="Sulevia's Leggings +2"
		}

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
-- PRECAST WS MODS
--

	mods.precast.ws["HPLo"] = templates.hplo
	mods.precast.ws["HPHi"] = templates.hphi

--
-- PRECAST MAGIC SETS
--

	InsertGearSet(sets.precast.magic, templates.fastcast)

--
-- PRECAST MAGIC MODS
--

	mods.precast.magic["HPLo"] =
		{
			neck="Unmoving Collar +1",
			ear2="Alabaster Earring",
			ring1="Meridian Ring",
			waist="Platinum Moogle Belt"
		}

	mods.precast.magic["HPHi"] = mods.precast.magic["HPLo"]

--
-- MIDCAST MAGIC SETS
--
	InsertGearSet(sets.midcast.magic, templates.fastcast)

	sets.midcast.magic.divine["Flash"] =
		{
			
		}

	sets.midcast.magic.divine.enlight =
		{
			
		}

	sets.midcast.magic.enhancing.white.phalanx = 
		{
			hands="Souveran Handschuhs",
			legs="Sakpata's Cuisses",
			feet="Souveran Schuhs",
			back="Weard Mantle"
		}

	sets.midcast.magic.healing.cure = 
		{
			hands="Macabre Gauntlets +1"
		}

--
-- MIDCAST MAGIC MODS
--

	mods.midcast.magic["HPLo"] = mods.precast.magic["HPLo"]
	mods.midcast.magic["HPHi"] = mods.precast.magic["HPHi"]

	mods.midcast.magic.healing["SIRD"] = templates.sird
	mods.midcast.magic.blue["SIRD"] = templates.sird

	mods.midcast.magic["FullSIRD"] = templates.sird

	mods.midcast.magic["Flash"] = {}
	mods.midcast.magic["Flash"]["FullSIRD"] = templates.fastcast

	mods.midcast.magic["Reprisal"] = {}
	mods.midcast.magic["Reprisal"]["FullSIRD"] = templates.fastcast

	mods.midcast.magic.divine.banish["+MBurst"] = set_combine(collections.Nyame, collections.Null,
		{
			helm="Jumalik Helm",
			ear1="Friomisi Earring",
			ear2="Hecate's Earring",
			ring1="Kishar Ring",
			ring2="Etana Ring"
		})

	mods.midcast.magic.divine.holy["+MBurst"] = set_combine(collections.Nyame, collections.Null,
		{
			helm="Jumalik Helm",
			ear1="Friomisi Earring",
			ear2="Hecate's Earring",
			ring1="Kishar Ring",
			ring2="Etana Ring"
		})

	mods.midcast.magic.enhancing.white.protect["Shelter"] = 
		{
			ring1="Sheltered Ring"
		}

	mods.midcast.magic.enhancing.white.shell["Shelter"] = 
		{
			ring1="Sheltered Ring"
		}

--
-- ENGAGED SET
--

	sets.engaged = 
		{
			ammo="Eluder's Sachet",
			head="Chevalier's Armet +2",
			neck="Unmoving Collar +1",
			ear1="Alabaster Earring",
			ear2="Chevalier's Earring",
			body="Reverence Surcoat +4",
			hands="Chevalier's Gauntlets +2",
			ring1="Murky Ring",
			ring2="Lehko's Ring",
			back=capes.tank,
			waist="Platinum Moogle Belt",
			legs="Chevalier's Cuisses +2",
			feet="Chevalier's Sabatons +2"
		}

--
-- ENGAGED OFFENSE MODS
--

	mods.engaged["Hybrid"] = set_combine(collections.Sakpata,
		{
			ammo="Coiste Bodhar",
			ear2="Cessance Earring",
			hands="Chevalier's Gauntlets +2",
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Sailfi Belt +1"
		})
	
	mods.engaged["DPS"] = set_combine(mods.engaged["Hybrid"],
		{
			neck="Lissome Necklace",
			ear1="Brutal Earring",
			waist="Sailfi Belt +1"
		})

	mods.engaged["+BlockTP"] =
		{
			hands="Reverence Gauntlets +3"
		}

--
-- ENGAGED DEFENSE MODS
--

	mods.engaged["MEva"] = set_combine(collections.Sakpata,
		{
			ammo="Vanir Battery"
		})

--
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.idle, 
		{
			ammo="Eluder's Sachet",
			head="Chevalier's Armet +2",
			neck="Unmoving Collar +1",
			ear1="Alabaster Earring",
			ear2="Chevalier's Earring",
			body="Chevalier's Cuirass +2",
			hands="Chevalier's Gauntlets +2",
			ring1="Murky Ring",
			ring2="Shadow Ring",
			back="Shadow Mantle",
			waist="Platinum Moogle Belt",
			legs="Chevalier's Cuisses +2",
			feet="Chevalier's Sabatons +2"
		})

	sets.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape",
			legs="Carmine Cuisses +1"
		}

	sets.resting = set_combine(sets.idle, templates.refresh)

--
-- IDLE & RESTING MODS
--

	mods.idle[STATE_MOVING] =
		{
			legs="Carmine Cuisses +1"
		}

	mods.idle["+Refresh"] = templates.refresh