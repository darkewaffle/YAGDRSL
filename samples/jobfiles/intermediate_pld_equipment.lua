--
-- CUSTOMIZATIONS
--

	capes = {}
	capes.fcsird = { name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}, priority=80}
	capes.tank = { name="Rudianos's Mantle", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	capes.wsd = { name="Rudianos's Mantle", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

	gear.feet_fc = { name="Odyssean Greaves", augments={'INT+8','AGI+9','"Fast Cast"+7','Mag. Acc.+4 "Mag.Atk.Bns."+4',}, priority=20}
	gear.feet_sird = { name="Odyssean Greaves", augments={'MND+9','Spell interruption rate down -9%','"Fast Cast"+4','Accuracy+14 Attack+14','Mag. Acc.+3 "Mag.Atk.Bns."+3',}, priority=20}

	gear.carmine_legs = {name="Carmine Cuisses +1", priority=130}
	gear.founder_hose = {name="Founder's Hose", priority=54}
	gear.jumalik_head = {name="Jumalik Helm", priority=45}
	gear.jumalik_body = {name="Jumalik Mail", priority=116}
	gear.loess = {name="Loess Barbuta +1", priority=105}
	gear.macabre = {name="Macabre Gauntlets +1", priority=70}
	gear.sakpata_sword = {name="Sakpata's Sword", priority=100}
	gear.souveran_hands = {name="Souveran Handschuhs", priority=164}
	gear.souveran_feet = {name="Souveran Schuhs", priority=152}

	af =
		{
			head = {name="Reverence Coronet", priority=19},
			body = {name="Reverence Surcoat +4", priority=264},
			hands = {name="Reverence Gauntlets +3", priority=113},
			legs = {},
			feet = {name="Reverence Leggings", priority=38}
		}

	relic =
		{
			head = {name="Caballarius Coronet", priority=59},
			body = {name="Caballarius Surcoat", priority=70},
			hands = {name="Caballarius Gauntlets +2", priority=114},
			legs = {name="Caballarius Breeches", priority=24},
			feet = {name="Caballarius Leggings +3", priority=63},
		}

	empy =
		{
			head = {name="Chevalier's Armet +2", priority=135},
			body = {name="Chevalier's Cuirass +3", priority=151},
			hands = {name="Chevalier's Gauntlets +2", priority=54},
			legs = {name="Chevalier's Cuisses +2", priority=117},
			feet = {name="Chevalier's Sabatons +2", priority=42},
		}

	templates = {}
	templates.enmityhp =
		{
			ammo="Sapience Orb",
			head=gear.loess,
			neck=gear.unmoving,
			ear1=gear.alabaster,
			ear2=gear.cryptic,
			body=af.body,
			hands=relic.hands,
			--ring1="",
			ring2=gear.vengeful,
			back=capes.tank,
			waist=gear.pmb,
			--legs="",
			feet=empy.feet
		}

	templates.fastcast =
		{
			ammo="Sapience Orb",
			head={name="Carmine Mask", priority=38},
			neck="Voltsurge Torque",
			ear1="Loquacious Earring",
			ear2=gear.etiolation,
			body=af.body,
			hands=gear.leyline,
			ring1="Prolix Ring",
			ring2="Kishar Ring",
			back=capes.fcsird,
			legs={name="Enif Cosciales", priority=40},
			feet=gear.feet_fc
		}

	templates.hphi =
		{
			neck=gear.unmoving,
			ear1=gear.alabaster,
			ring1=gear.etana,
			ring2=gear.meridian,
			waist=gear.pmb
		}

	templates.hplo =
		{
			neck=gear.unmoving,
			ear1=gear.alabaster,
			waist=gear.pmb
		}

	templates.refresh =
		{
			ammo="Homiliary",
			head=gear.jumalik_head,
			neck="Sibyl Scarf",
			body=gear.jumalik_body
		}

	templates.sird =
		{
			ammo="Staunch Tathlum +1",			-- 11% SIRD		 3% DT
			head=empy.head,						--				10% DT
			ear1=gear.alabaster, 				-- 				 5% DT
			body=empy.body,						-- 20% SIRD
			hands=empy.hands,					--				10% DT
			ring1="Murky Ring",					--	3% SIRD		10% DT
			back=capes.fcsird,					-- 10% SIRD
			waist=gear.pmb,						--				 3% DT
			legs=gear.founder_hose,				-- 30% SIRD
			feet=gear.feet_sird					-- 29% SIRD
		}

	templates.sirdcure =
		{
			ammo="Staunch Tathlum +1",			-- 11% SIRD		 3% DT
			head=empy.head,						--				10% DT
			ear1=gear.alabaster, 				--				 5% DT
			ear2="Chevalier's Earring",			--						10% CPot
			body=empy.body,						-- 20% SIRD
			hands=gear.macabre,					--						11% CPot
			ring1="Murky Ring",					--	3% SIRD		10% DT
			ring2="Defending Ring",				--				10% DT
			back=capes.fcsird,					-- 10% SIRD
			waist=gear.pmb,						--				 3% DT
			legs=gear.founder_hose,				-- 30% SIRD
			feet=gear.feet_sird					-- 29% SIRD
		}
--
-- PRECAST JA SETS
--

	InsertGearSet(sets.precast.ja, templates.enmityhp)

	sets.precast.ja["Chivalry"] =
		{
			hands=relic.hands
		}

	sets.precast.ja["Cover"] =
		{
			head=af.head
		}

	sets.precast.ja["Divine Emblem"] =
		{
			feet=empy.feet
		}

	sets.precast.ja["Fealty"] =
		{
			body=relic.body
		}

	sets.precast.ja["Holy Circle"] =
		{
			feet=af.feet
		}

	sets.precast.ja["Invincible"] =
		{
			legs=relic.legs
		}

	sets.precast.ja["Rampart"] =
		{
			head=relic.head
		}

	sets.precast.ja["Sentinel"] =
		{
			feet=relic.feet
		}

	sets.precast.ja["Shield Bash"] =
		{
			hands=relic.hands
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
			ring1=gear.regalring,
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

	sets.precast.ws.melee.magical = set_combine(collections.Null, collections.Nyame,
		{
			ammo="Oshasha's Treatise",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			ring1=gear.etana,
			ring2="Karieyh Ring +1",
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

	mods.precast.magic["HPLo"] = templates.hplo

	mods.precast.magic["HPHi"] = templates.hphi

--
-- MIDCAST MAGIC SETS
--
	InsertGearSet(sets.midcast.magic, templates.fastcast)

	sets.midcast.magic.divine["Flash"] = set_combine(collections.Gleti,
		{
			main="Brilliance",
			ammo="Sapience Orb",
			neck=gear.unmoving,
			head=gear.loess,
			body=af.body,
			feet=empy.feet
		})

	sets.midcast.magic.divine.enlight =
		{
			head=gear.jumalik_head,
			body=af.body
		}

	sets.midcast.magic.enhancing.white.phalanx =
		{
			main=gear.sakpata_sword,
			hands=gear.souveran_hands,
			legs="Sakpata's Cuisses",
			feet=gear.souveran_feet,
			back={name="Weard Mantle", priority=40}
		}

	sets.midcast.magic.enhancing.white.protect =
		{
			sub="Duban"
		}

	sets.midcast.magic.healing.cure =
		{
			ear2="Chevalier's Earring",
			body=gear.jumalik_body,
			hands=gear.macabre,
			ring2="Naji's Loop",
			feet=gear.feet_fc
		}

--
-- MIDCAST MAGIC MODS
--

	mods.midcast.magic["HPLo"] = templates.hplo
	mods.midcast.magic["HPHi"] = templates.hphi


	mods.midcast.magic.blue["SIRD"] = templates.sird
	mods.midcast.magic.healing.cure["SIRD"] = templates.sirdcure


	mods.midcast.magic["FullSIRD"] = templates.sird
	mods.midcast.magic.healing.cure["FullSIRD"] = templates.sirdcure


	mods.midcast.magic["Flash"] = {}
	mods.midcast.magic["Flash"]["FullSIRD"] = set_combine(templates.fastcast, {ear2=gear.alabaster, ring1=gear.meridian, waist=gear.pmb})

	mods.midcast.magic["Reprisal"] = {}
	mods.midcast.magic["Reprisal"]["FullSIRD"] = set_combine(templates.fastcast, {ear2=gear.alabaster, ring1=gear.meridian, waist=gear.pmb})

	mods.midcast.magic.divine.banish["+MBurst"] = set_combine(collections.Null, collections.Nyame,
		{
			head=gear.jumalik_head,
			ear1="Friomisi Earring",
			ear2="Hecate's Earring",
			ring1="Kishar Ring",
			ring2=gear.etana
		})

	mods.midcast.magic.divine.holy["+MBurst"] = set_combine(collections.Null, collections.Nyame,
		{
			head=gear.jumalik_head,
			ear1="Friomisi Earring",
			ear2="Hecate's Earring",
			ring1="Kishar Ring",
			ring2=gear.etana
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

	sets.status.engaged = 
		{
			ammo="Eluder's Sachet",
			head=empy.head,
			neck=gear.unmoving,
			ear1=gear.alabaster,
			ear2="Chevalier's Earring",
			body=af.body,
			hands=empy.hands,
			ring1="Murky Ring",
			ring2="Lehko's Ring",
			back=capes.tank,
			waist=gear.pmb,
			legs=empy.legs,
			feet=empy.feet
		}

--
-- ENGAGED OFFENSE MODS
--

	mods.status.engaged["Hybrid"] = set_combine(collections.Sakpata,
		{
			ammo="Coiste Bodhar",
			ear2="Cessance Earring",
			hands=empy.hands,
			ring1="Rajas Ring",
			ring2="Lehko's Ring",
			back="Null Shawl",
			waist="Sailfi Belt +1"
		})
	
	mods.status.engaged["DPS"] = set_combine(mods.status.engaged["Hybrid"],
		{
			neck="Lissome Necklace",
			ear1="Brutal Earring"
		})

	mods.status.engaged["+BlockTP"] =
		{
			hands=af.hands
		}

--
-- ENGAGED DEFENSE MODS
--

	mods.status.engaged["MEva"] = set_combine(collections.Sakpata,
		{
			ammo="Vanir Battery"
		})

--
-- IDLE & RESTING SETS
--

	InsertGearSet(sets.status.idle, 
		{
			ammo="Eluder's Sachet",
			head=empy.head,
			neck=gear.unmoving,
			ear1=gear.alabaster,
			ear2="Chevalier's Earring",
			body=empy.body,
			hands=empy.hands,
			ring1="Murky Ring",
			ring2="Shadow Ring",
			back="Shadow Mantle",
			waist=gear.pmb,
			legs=empy.legs,
			feet=empy.feet
		})

	sets.status.idle.town =
		{
			ring1="Warp Ring",
			ring2="Trizek Ring",
			back="Nexus Cape",
			legs=gear.carmine_legs
		}

	sets.status.resting = set_combine(sets.status.idle, templates.refresh)

--
-- IDLE & RESTING MODS
--

	mods.status["Sak"] = {main=gear.sakpata_sword}
	mods.status["Naeg"] = {main="Naegling"}
	mods.status["Malig"] = {main="Malignance Sword"}

	mods.status["Aegis"] = {sub="Aegis"}
	mods.status["Duban"] = {sub="Duban"}
	mods.status["Ochain"] = {sub="Ochain"}


	mods.status.idle[STATE_MOVING] =
		{
			legs=gear.carmine_legs
		}

	mods.status.idle["+Refresh"] = templates.refresh