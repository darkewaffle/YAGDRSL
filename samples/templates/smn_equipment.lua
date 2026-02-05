--
-- PRECAST JA SETS
--

	sets.precast.ja["Astral Flow"] =
		{
			
		}

	sets.precast.ja["Avatar's Favor"] =
		{
			
		}

	sets.precast.ja["Elemental Siphon"] =
		{
			
		}

	sets.precast.ja["Mana Cede"] =
		{
			
		}

	sets.precast.ja.bloodpact =
		{
			
		}

--
-- MIDCAST JA SETS
--

	sets.midcast.ja.bloodpact =
		{
			
		}

	sets.midcast.ja.bloodpact.rage =
		{
			
		}
		
	sets.midcast.ja.bloodpact.rage.hybrid =
		{
			
		}
		
	sets.midcast.ja.bloodpact.rage.magical =
		{
			
		}
		
	sets.midcast.ja.bloodpact.rage.physical =
		{
			
		}
		
	sets.midcast.ja.bloodpact.ward =
		{
			
		}

	-- Gear that will be equipped for Bloodpact Wards that target an enemy (debuff)
	sets.midcast.ja.bloodpact.ward.enemy =
		{
			
		}

	-- Gear that will be equipped for Bloodpact Wards that target a friendly unit (buff)
	sets.midcast.ja.bloodpact.ward.friend =
		{
			
		}
		

--
-- MIDCAST JA MODS
--

	-- This type of mod is supported for all pet names and types of bloodpacts.
	-- It can be used to equip avatar-specific gear only when the named avatar is active.
	mods.midcast.ja.bloodpact["Cait Sith"] =
		{
			
		}

	-- +Pet Accuracy gear that will be equipped when using a hybrid bloodpact and the Offense mod = "PetAcc"
	mods.midcast.ja.bloodpact.rage.hybrid["PetAcc"] =
		{
			
		}

	-- +Pet Accuracy gear that will be equipped when using a hybrid bloodpact and the Offense mod = "PetDmg"
	mods.midcast.ja.bloodpact.rage.hybrid["PetDmg"] =
		{
			
		}

	mods.midcast.ja.bloodpact.rage.magical["PetAcc"] =
		{
			
		}

	mods.midcast.ja.bloodpact.rage.magical["PetDmg"] =
		{
			
		}

	mods.midcast.ja.bloodpact.rage.physical["PetAcc"] =
		{
			
		}

	mods.midcast.ja.bloodpact.rage.physical["PetDmg"] =
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

	sets.precast.ws["Garland of Bliss"] =
		{
			
		}

	sets.precast.ws["Myrkr"] =
		{
			
		}

	sets.precast.ws["Oshala"] =
		{
			
		}

	sets.precast.ws["Shattersoul"] =
		{
			
		}

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	InsertGearSet(sets.precast.magic,
		{
			
		})

	sets.precast.magic.healing.cure =
		{
			
		}
--
-- MIDCAST MAGIC SETS
--

	InsertGearSet(sets.midcast.magic.enfeebling,
		{
			
		})

	InsertGearSet(sets.midcast.magic.enhancing,
		{
			
		})

	sets.midcast.magic.enhancing.white.barelement =
		{
			
		}

	InsertGearSet(sets.midcast.magic.healing,
		{
			
		})

	sets.midcast.magic.healing.cure =
		{
			
		}

	sets.midcast.magic.healing.statusremoval =
		{
			
		}

	sets.midcast.magic.summoning =
		{
			
		}

	sets.midcast.magic["Cursna"] =
		{
			
		}

--
-- MIDCAST MAGIC MODS
--

	-- +Treasure Hunter gear that will be equipped when casting a Dia spell and the Treasure Hunter mod = "+TH"
	mods.midcast.magic.enfeebling.white.dia["+TH"] =
		{
			
		}

--
-- ENGAGED SET
--
	sets.status.engaged =
		{
			
		}

--
-- ENGAGED OFFENSE MODS
--

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
	sets.status.idle =
		{
			
		}

	sets.status.idle.town =
		{
			
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

	-- This type of mod is supported for all pet names.
	-- It can be used to equip avatar-specific gear only when the named avatar is active.
	mods.status.idle["Carbuncle"] =
		{
			
		}