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
	InsertGearSet(sets.precast.ws,
		{
			
		})

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

	InsertGearSet(sets.precast.magic, 
		{
			
		})

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

	-- Gear that will be equipped for blue spells that primarily inflict ailments
	sets.midcast.magic.blue.enfeebling =
		{
			
		}

	-- Gear that will be equipped for blue spells that primarily grant buffs
	sets.midcast.magic.blue.enhancing =
		{
			
		}
	
	-- Gear that will be equipped for blue spells that primarily deal magic damage
	sets.midcast.magic.blue.magical =
		{
			
		}

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

	sets.engaged =
		{
			
		}

--
-- ENGAGED OFFENSE MODS
--

	-- +Accuracy gear when engaged and the Offense mod = "Acc"
	mods.engaged["Acc"] =
		{
			
		}

	-- +Multiattack gear when engaged and the Offense mod = "Multi"
	mods.engaged["Multi"] =
		{
			
		}

	-- +Treasure Hunter gear when engaged and the TH mod = "+TH"
	mods.engaged["+TH"] =
		{
			
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

	sets.idle =
		{
			
		}

	sets.idle.town =
		{
			
		}

	sets.resting =
		{
			
		}

--
-- IDLE & RESTING MODS
--

	mods.idle["PDTLo"] =
		{
			
		}

	mods.idle["PDTHi"] =
		{
			
		}

	mods.idle["MEvaLo"] =
		{
			
		}

	mods.idle["MEvaHi"] =
		{
			
		}

	-- Additional gear that will be equipped when idle and the player is moving.
	mods.idle["player_moving"] =
		{
			
		}

	-- Additional Refresh gear that will be equipped when idle and the Refresh mod = "+Refresh"
	mods.idle["+Refresh"] =
		{
			
		}

	-- Additional Refresh gear that will be equipped when resting and the Refresh mod = "+Refresh"
	mods.resting["+Refresh"] =
		{
			
		}