	templates = {}

	templates.fastcast =
		{
			ammo="Sapience Orb",
			head="Carmine Mask",
			neck="Voltsurge Torque",
			ear1=gear.etiolation,
			ear2="Loquacious Earring",
			body=gear.fastcast_light_body,
			hands=gear.leyline,
			ring1="Kishar Ring",
			ring2="Naji's Loop",
			--waist="Sailfi Belt +1",
			waist=gear.pmb,
			legs="Ayanmo Cosciales +2",
			feet=gear.fastcast_light_feet
		}

--
-- PRECAST JA SETS
--

	sets.precast.ja["Chainspell"] =
		{
			
		}

	sets.precast.ja["Convert"] =
		{
			
		}

--
-- PRECAST WS SETS
--

	-- Gear that should apply to all weaponskills
	-- Likely just Fotia or +Weaponskill Damage pieces
	InsertGearSet(sets.precast.ws, set_combine(collections.Null, collections.Nyame, collections.rse,
		{
			neck="Fotia Gorget",
			waist="Fotia Belt"
		}))

	-- Gear that should apply to all melee, physical weaponskills
	sets.precast.ws.melee.physical =
		{
			
		}

	sets.precast.ws["Chant du Cygne"] = 
		{
			
		}

	sets.precast.ws["Death Blossom"] =
		{
			
		}

	sets.precast.ws["Imperator"] = 
		{
			
		}

	sets.precast.ws["Requiescat"] = 
		{
			
		}

	sets.precast.ws["Savage Blade"] =
		{
			ammo="Oshasha's Treatise",
			neck="Republican Platinum Medal",
			ear1="Moonshade Earring",
			ear2="Ishvara Earring",
			hands="Jhakri Cuffs +2",
			ring1="Karieyh Ring +1",
			ring2=gear.ilabrat,
			waist="Sailfi Belt +1"
		}

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical = set_combine(collections.rse,
		{
			ammo="Ghastly Tathlum +1",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			hands="Jhakri Cuffs +2",
			ring1="Karieyh Ring +1",
			ring2="Jhakri Ring"
		})

--
-- PRECAST WS MODS
--

	-- +Accuracy gear for melee, physical weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.physical["Acc"] =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	InsertGearSet(sets.precast.magic, templates.fastcast)

--
-- MIDCAST MAGIC SETS
--
	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{
			
		}))

--
-- MIDCAST MAGIC ELEMENTAL
--

	InsertGearSet(sets.midcast.magic.elemental,
		{
			
		})

--
-- MIDCAST MAGIC ENFEEBLING
--

	InsertGearSet(sets.midcast.magic.enfeebling,
		{
			
		})

	InsertGearSet(sets.midcast.magic.enfeebling.black,
		{
			
		})

	sets.midcast.magic.enfeebling.black.dispel =
		{
			
		}

	sets.midcast.magic.enfeebling.black.duration =
		{
			
		}

	sets.midcast.magic.enfeebling.black.poison =
		{
			
		}

	sets.midcast.magic.enfeebling.black.potency =
		{
			
		}

	InsertGearSet(sets.midcast.magic.enfeebling.white,
		{
			
		})

	sets.midcast.magic.enfeebling.white.dia =
		{
			
		}

	sets.midcast.magic.enfeebling.white.duration =
		{
			
		}

	sets.midcast.magic.enfeebling.white.potency =
		{
			
		}

--
-- MIDCAST MAGIC ENHANCING
--

	InsertGearSet(sets.midcast.magic.enhancing,
		{
			head="Carmine Mask",
			hands="Chironic Gloves",
			legs="Carmine Cuisses +1",
			feet="Lethargy Houseaux",
			ring1=gear.stik1,
			ring2=gear.stik2,
			back="Sucellos's Cape"
		})

	sets.midcast.magic.enhancing.black.spikes =
		{
			
		}

	sets.midcast.magic.enhancing.white.barelement =
		{
			
		}

	sets.midcast.magic.enhancing.white.barstatus =
		{
			
		}

	sets.midcast.magic.enhancing.white.enspell1 =
		{
			
		}

	sets.midcast.magic.enhancing.white.enspell2 =
		{
			
		}

	sets.midcast.magic.enhancing.white.flurry =
		{
			
		}

	sets.midcast.magic.enhancing.white.gain =
		{
			
		}

	sets.midcast.magic.enhancing.white.haste =
		{
			
		}

	sets.midcast.magic.enhancing.white.phalanx =
		{
			main="Sakpata's Sword"
		}

	sets.midcast.magic.enhancing.white.refresh =
		{
			
		}

	sets.midcast.magic.enhancing.white.temper =
		{
			
		}

--
-- MIDCAST MAGIC HEALING
--

	InsertGearSet(sets.midcast.magic.healing,
		{
			
		})

	sets.midcast.magic.healing.cure =
		{
			
		}

	sets.midcast.magic.healing.statusremoval =
		{
			
		}

	sets.midcast.magic["Cursna"] =
		{
			
		}

--
-- MIDCAST MAGIC MODS
--
	-- +Magic Accuracy gear when casting an enfeebling spell and Debuff mod = "EnfAcc"
	mods.midcast.magic.enfeebling["EnfAcc"] =
		{
			
		}

	-- +Magic Accuracy gear when casting an elemental spell and MagicOffense mod = "NukeAcc"
	mods.midcast.magic.elemental["NukeAcc"] =
		{
			
		}

	-- +Magic damage gear when casting an elemental spell and MagicOffense mod = "MDmg"
	mods.midcast.magic.elemental["MDmg"] =
		{
			
		}

	-- Additional gear that will be equipped when casting an enhancing spell and Composure is active
	mods.midcast.magic.enhancing["Composure"] =
		{
			
		}

	-- Additional gear that will be equipped when casting an enfeebling spell and Composure is active
	mods.midcast.magic.enfeebling["Composure"] =
		{
			
		}

	-- Additional gear that will be equipped when casting an enfeebling spell and Saboteur is active
	mods.midcast.magic.enfeebling["Saboteur"] =
		{
			
		}

	-- Additional gear that will be equipped when casting an enfeebling spell and Stymie is active
	mods.midcast.magic.enfeebling["Stymie"] =
		{
			
		}

--
-- ENGAGED SET
--

	sets.status.engaged = set_combine(collections.Null, collections.Malignance,
		{
			main="Tauret",
			ammo="Coiste Bodhar",
			ear1="Telos Earring",
			ear2="Cessance Earring",
			ring1=gear.ilabrat,
			ring2="Fickblix's Ring",
			waist="Sailfi Belt +1"
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

	InsertGearSet(sets.status.idle, set_combine(collections.Null, collections.Nyame,
		{
			main="Tauret",
			ammo="Staunch Tathlum +1",
			head=collections.Null.mask,
			ear1=gear.alabaster,
			ear2=gear.eabani,
			ring1="Vengeful Ring",
			ring2="Murky Ring",
			waist=gear.pmb,
			legs="Carmine Cuisses +1"
		}))

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

	-- Additional Refresh gear that will be equipped when idle and the Refresh mod = "+Refresh"
	mods.status.idle["+Refresh"] =
		{
			
		}

	-- Additional Refresh gear that will be equipped when resting and the Refresh mod = "+Refresh"
	mods.status.resting["+Refresh"] =
		{
			
		}



	-- Additional gear that will be equipped when idle and the player is moving.
	mods.status.idle["player_moving"] =
		{
			legs="Carmine Cuisses +1"
		}

	mods.precast.ws.melee.magical["THAoE"] =
		{
			ammo="Perfect Lucky Egg",
			waist="Chaac Belt"
		}

	overrides.status["+CP"] =
		{
			back=capes.cp
		}

	overrides.precast.ws["+CP"] =
		{
			back=capes.cp
		}

	overrides.status.idle["+CP"] =
		{
			legs="Carmine Cuisses +1"
		}