--
-- PRECAST JA SETS
--

	sets.precast.ja["Accomplice"] =
		{
			
		}

	sets.precast.ja["Collaborator"] =
		{
			
		}

	sets.precast.ja["Despoil"] =
		{
			
		}

	sets.precast.ja["Flee"] =
		{
			
		}

	sets.precast.ja["Hide"] =
		{
			
		}

	sets.precast.ja["Mug"] =
		{
			
		}

	sets.precast.ja["Perfect Dodge"] =
		{
			
		}

	sets.precast.ja["Steal"] =
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

	sets.precast.ws["Mandalic Stab"] = 
		{
			
		}

	sets.precast.ws["Rudra's Storm"] = 
		{
			
		}

	sets.precast.ws["Ruthless Stroke"] = 
		{
			
		}

	sets.precast.ws["Shark Bite"] =
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

	-- Additional gear that will be equipped when using a melee, physical weaponskill and Sneak Attack is active
	mods.precast.ws.melee.physical["Sneak Attack"] =
		{
			
		}

	-- Additional gear that will be equipped when using a melee, physical weaponskill and Trick Attack is active
	mods.precast.ws.melee.physical["Trick Attack"] =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	-- Probably just Fast Cast gear
	InsertGearSet(sets.precast.magic,
		{
			
		})

--
-- MIDCAST MAGIC SETS
--

	-- THF isn't a caster so just use the magic precast set to shorten recast
	InsertGearSet(sets.midcast.magic, sets.precast.magic)

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

	-- Additional gear that will be equipped when engaged and Conspirator is active
	mods.engaged["Conspirator"] =
		{
			
		}

	-- Additional gear that will be equipped when engaged and Feint is active
	mods.engaged["Feint"] =
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

	-- Additional gear that will be equipped when engaged and Flee is active
	mods.engaged["Flee"] =
			{

			}

	-- Additional gear that will be equipped when engaged and Perfect Dodge is active
	mods.engaged["Perfect Dodge"] =
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

	-- Additional gear that will be equipped when idle and Flee is active
	mods.idle["Flee"] =
		{
			
		}

	-- Additional gear that will be equipped when idle and Perfect Dodge is active
	mods.idle["Perfect Dodge"] =
		{
			
		}

	-- Additional gear that will be equipped when idle and the player is moving.
	mods.idle["player_moving"] =
		{
			
		}