--
-- CUSTOMIZATIONS
--

	templates = {}

	templates.fastcast =
		{
			ammo="Sapience Orb",
			head=gear.fastcast_light_head,
			neck="Voltsurge Torque",
			ear1=gear.etiolation,
			ear2="Loquacious Earring",
			body=gear.fastcast_light_body,
			hands=gear.leyline,
			ring1="Kishar Ring",
			--ring2="Naji's Loop",
			ring2=gear.meridian,
			--waist="Sailfi Belt +1",
			waist=gear.pmb,
			legs=gear.fastcast_light_legs,
			feet=gear.fastcast_light_feet
		}

--
-- PRECAST JA SETS
--

	sets.precast.ja["Azure Lore"] =
		{
			
		}

--
-- PRECAST WS SETS
--

	-- Gear that should apply to all weaponskills
	-- Likely just Fotia or +Weaponskill Damage pieces
	InsertGearSet(sets.precast.ws, set_combine(collections.Null, collections.Nyame,
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

	sets.precast.ws["Expiacion"] =
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
			ear1="Ishvara Earring",
			ear2="Moonshade Earring",
			ring1="Karieyh Ring +1",
			ring2="Beithir Ring",
			waist="Sailfi Belt +1"

		}

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

	InsertGearSet(sets.precast.magic.blue,
		{
			
		})

--
-- MIDCAST MAGIC SETS
--

	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{
			
		}))

	-- Gear that will be equipped for all blue spells
	InsertGearSet(sets.midcast.magic.blue,
		{
			
		})

	-- Gear that will be equipped for blue spells that cure HP
	sets.midcast.magic.blue.cure =
		{
			
		}

	sets.midcast.magic.blue.cure["White Wind"] = set_combine(collections.Nyame,
		{
			neck=gear.unmoving,
			ear1=gear.alabaster,
			ear2=gear.eabani,

			ring1=gear.meridian,
			ring2=gear.etana,
			waist=gear.pmb,
			legs="Carmine Cuisses +1"
		})

	-- Gear that will be equipped for blue spells that primarily inflict ailments
	sets.midcast.magic.blue.enfeebling =
		{
			
		}

	-- Gear that will be equipped for blue spells that primarily grant buffs
	sets.midcast.magic.blue.enhancing =
		{
			ring1=gear.stik1,
			ring2=gear.stik2
		}
	
	-- Gear that will be equipped for blue spells that primarily deal magic damage
	sets.midcast.magic.blue.magical = set_combine(collections.Null, collections.Nyame,
		{
			ammo="Ghastly Tathlum +1",
			neck="Sibyl Scarf",
			ear1="Regal Earring",
			ear2="Friomisi Earring",
			ring1="Mephitas's Ring +1",
			ring2="Kishar Ring",
			waist="Eschan Stone"
		})

	-- Gear that will be equipped for blue spells that primarily deal physical damage
	sets.midcast.magic.blue.physical =
		{
			
		}

	-- Gear that will be equipped for blue spells that grant refresh
	sets.midcast.magic.blue.refresh =
		{
			
		}
	
	-- Gear that will be equipped for blue spells that grant regen
	sets.midcast.magic.blue.regen =
		{
			
		}

	sets.midcast.magic.blue["Entomb"] =
		{
			ammo="Perfect Lucky Egg",
			hands = gear.TH2_light_hands,
			waist="Chaac Belt"
		}


--
-- MIDCAST MAGIC MODS
--

	-- Additional gear that will be equipped when casting a magical blue spell and Burst Affinity is active
	mods.midcast.magic.blue.magical["Burst Affinity"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a physical blue spell and Chain Affinity is active
	mods.midcast.magic.blue.physical["Chain Affinity"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a magical blue spell and Convergence is active
	mods.midcast.magic.blue.magical["Convergence"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a blue spell and Diffusion is active
	mods.midcast.magic.blue["Diffusion"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a physical blue spell and Efflux is active
	mods.midcast.magic.blue.physical["Efflux"] =
		{
			
		}

--
-- ENGAGED SET
--

	sets.status.engaged = set_combine(collections.Null, collections.Malignance,
		{
			ammo="Coiste Bodhar",
			ear1="Telos Earring",
			ear2="Cessance Earring",
			ring1="Epona's Ring",
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
			back="Nexus Cape",
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
			
		}

	-- Additional Refresh gear that will be equipped when idle and the Refresh mod = "+Refresh"
	mods.status.idle["+Refresh"] =
		{
			
		}

	-- Additional Refresh gear that will be equipped when resting and the Refresh mod = "+Refresh"
	mods.status.resting["+Refresh"] =
		{
			
		}

--
-- OVERRIDES
--

	overrides["Learn"] =
		{
			hands="Assimilator's Bazubands +1"
		}

	overrides.status.engaged["Learn"] =
		{
			legs="Samnuha Tights",
			body="Ayanmo Corazza +2"
		}

	overrides["+CP"] =
		{
			back=capes.cp
		}