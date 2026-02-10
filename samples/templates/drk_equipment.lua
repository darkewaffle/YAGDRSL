--
-- PRECAST JA SETS
--

	sets.precast.ja["Arcane Circle"] =
		{
			
		}

	sets.precast.ja["Blood Weapon"] =
		{
			
		}

	sets.precast.ja["Consume Mana"] =
		{
			
		}

	sets.precast.ja["Diabolic Eye"] =
		{
			
		}

	sets.precast.ja["Last Resort"] =
		{
			
		}

	sets.precast.ja["Nether Void"] =
		{
			
		}

	sets.precast.ja["Souleater"] =
		{
			
		}

	sets.precast.ja["Weapon Bash"] =
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

	sets.precast.ws["Catastrophe"] = 
		{
			
		}

	sets.precast.ws["Entropy"] = 
		{
			
		}

	sets.precast.ws["Fimbulvetr"] = 
		{
			
		}

	sets.precast.ws["Insurgency"] = 
		{
			
		}

	sets.precast.ws["Origin"] = 
		{
			
		}

	sets.precast.ws["Quietus"] = 
		{
			
		}

	sets.precast.ws["Resolution"] = 
		{
			
		}

	sets.precast.ws["Scourge"] = 
		{
			
		}

	sets.precast.ws["Torcleaver"] =
		{
			
		}

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical =
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

--
-- MIDCAST MAGIC SETS
--
	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{
			
		}))

	InsertGearSet(sets.midcast.magic.darkmagic,
		{
			
		})

	sets.midcast.magic.darkmagic.absorb =
		{
			
		}

	sets.midcast.magic.darkmagic.aspir =
		{
			
		}

	sets.midcast.magic.darkmagic.bio =
		{
			
		}

	sets.midcast.magic.darkmagic.drain =
		{
			
		}

	sets.midcast.magic.darkmagic.endark =
		{
			
		}

	InsertGearSet(sets.midcast.magic.enfeebling,
		{
			
		})

	InsertGearSet(sets.midcast.magic.elemental,
		{
			
		})

--
-- MIDCAST MAGIC MODS
--
	
	-- Additional gear that will be equipped when casting dark magic and and Dark Seal is active
	mods.midcast.magic.darkmagic["Dark Seal"] =
		{
			
		}

	-- Additional gear that will be equipped when casting an Absorb spell and Nether Void is active
	mods.midcast.magic.darkmagic.absorb["Nether Void"] =
		{
			
		}

	-- Additional gear that will be equipped when casting a Dragin spell and Nether Void is active
	mods.midcast.magic.darkmagic.drain["Nether Void"] =
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

	-- Additional gear that will be equipped when engaged and and Blood Weapon is active
	mods.status.engaged["Blood Weapon"] =
		{
			
		}

	-- Additional gear that will be equipped when engaged and and Last Resort is active
	mods.status.engaged["Last Resort"] =
		{
			
		}

	-- Additional gear that will be equipped when engaged and and Souleater is active
	mods.status.engaged["Souleater"] =
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