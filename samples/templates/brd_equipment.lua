--
-- PRECAST JA SETS
--

	sets.precast.ja["Troubadour"] =
		{
			
		}

	sets.precast.ja["Soul Voice"] =
		{
			
		}

	sets.precast.ja["Nightingale"] =
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

	sets.precast.ws["Evisceration"] =
		{
			
		}

	sets.precast.ws["Mordant Rime"] = 
		{
			
		}

	sets.precast.ws["Rudra's Storm"] = 
		{
			
		}

	sets.precast.ws["Ruthless Stroke"] = 
		{
			
		}

	sets.precast.ws["Savage Blade"] =
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

	sets.precast.magic.singing =
		{
			
		}

--
-- MIDCAST MAGIC SETS
--

	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{
			
		}))

	InsertGearSet(sets.midcast.magic.enfeebling,
		{
			
		})

	InsertGearSet(sets.midcast.magic.enhancing,
		{
			
		})

	sets.midcast.magic.healing.cure =
		{
			
		}

	-- Midcast gear for all songs
	InsertGearSet(sets.midcast.magic.singing,
		{
			
		})

	-- Midcast gear for all songs (buffs) that target a friendly character
	sets.midcast.magic.singing.friend =
		{
			
		}

	sets.midcast.magic.singing.friend.ballad =
		{
			
		}

	sets.midcast.magic.singing.friend.carol =
		{
			
		}

	sets.midcast.magic.singing.friend.madrigal =
		{
			
		}

	sets.midcast.magic.singing.friend.mambo = 
		{
			
		}

	sets.midcast.magic.singing.friend.march =
		{
			
		}

	sets.midcast.magic.singing.friend.minne =
		{
			
		}

	sets.midcast.magic.singing.friend.minuet =
		{
			
		}

	sets.midcast.magic.singing.friend.paeon =
		{
			
		}

	sets.midcast.magic.singing.friend.prelude =
		{
			
		}

	sets.midcast.magic.singing.friend["Sentinel's Scherzo"] =
		{
			
		}

	-- Midcast gear for all songs (debuffs) that target an enemy unit
	sets.midcast.magic.singing.enemy =
		{
			
		}

	InsertGearSet(sets.midcast.magic.singing.enemy.lullaby,
		{
			
		})

	sets.midcast.magic.singing.enemy.lullaby.foe =
		{
			
		}

	sets.midcast.magic.singing.enemy.lullaby.horde =
		{
			
		}

	sets.midcast.magic.singing.enemy.lullaby["Horde Lullaby II"] =
		{
			
		}

	sets.midcast.magic.singing.enemy.threnody =
		{
			
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

	-- Additional Refresh gear that will be equipped when idle and the Refresh mod = "+Refresh"
	mods.status.idle["+Refresh"] =
		{
			
		}

	-- Additional Refresh gear that will be equipped when resting and the Refresh mod = "+Refresh"
	mods.status.resting["+Refresh"] =
		{
			
		}