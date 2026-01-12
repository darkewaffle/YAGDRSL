--
-- PRECAST JA SETS
--

	sets.precast.ja["Barrage"] =
		{
			
		}

	sets.precast.ja["Bounty Shot"] =
		{
			
		}

	sets.precast.ja["Camouflage"] =
		{
			
		}

	sets.precast.ja["Double Shot"] =
		{
			
		}

	sets.precast.ja["Eagle Eye Shot"] =
		{
			
		}

	sets.precast.ja["Flashy Shot"] =
		{
			
		}

	sets.precast.ja["Scavenge"] =
		{
			
		}

	sets.precast.ja["Shadowbind"] =
		{
			
		}

	sets.precast.ja["Sharpshot"] =
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

	-- Gear that should apply to all melee weaponskills
	InsertGearSet(sets.precast.ws.melee,
		{
			
		})

	-- Gear that should apply to all melee, physical weaponskills
	sets.precast.ws.melee.physical =
		{
			
		}

	sets.precast.ws["Savage Blade"] =
		{
			
		}

	-- Gear that should apply to all melee, magical weaponskills
	sets.precast.ws.melee.magical =
		{
			
		}

	-- Gear that should apply to all ranged weapon weaponskills
	InsertGearSet(sets.precast.ws.distant,
		{
			
		})

	-- Gear that should apply to all ranged weapon, hybrid weaponskills
	sets.precast.ws.distant.hybrid =
		{
			
		}

	-- Gear that should apply to all ranged weapon, physical weaponskills
	sets.precast.ws.distant.physical =
		{
			
		}

	-- Gear that should apply to all ranged weapon, magical weaponskills
	sets.precast.ws.distant.magical =
		{
			
		}

	sets.precast.ws["Apex Arrow"] =
		{
			
		}

	sets.precast.ws["Detonator"] =
		{
			
		}

	sets.precast.ws["Jishnu's Radiance"] =
		{
			
		}

	sets.precast.ws["Last Stand"] =
		{
			
		}

	sets.precast.ws["Sarv"] =
		{
			
		}

	sets.precast.ws["Terminus"] =
		{
			
		}

	sets.precast.ws["Trueflight"] =
		{
			
		}

	sets.precast.ws["Wildfire"] =
		{
			
		}

--
-- PRECAST WS MODS
--

	-- +Accuracy gear for melee, physical weaponskills when the Offense mod = "Acc"
	mods.precast.ws.melee.physical["Acc"] =
		{
			
		}

	-- +Ranged/Magical Accuracy gear for ranged, hybrid weaponskills when the Ranged Offense mod = "RAcc"
	mods.precast.ws.distant.hybrid["RAcc"] =
		{
			
		}

	-- +Ranged Accuracy gear for ranged, physical weaponskills when the Ranged Offense mod = "RAcc"
	mods.precast.ws.distant.physical["RAcc"] =
		{
			
		}

	-- +Ranged/Magical Accuracy gear for ranged, magical weaponskills when the Ranged Offense mod = "RAcc"
	mods.precast.ws.distant.magical["RAcc"] =
		{
			
		}

	-- Additional gear that will be equipped when using a ranged weapon weaponskill and Barrage is active
	mods.precast.ws.distant["Barrage"] =
		{
			
		}

	-- Additional gear that will be equipped when using a ranged weapon weaponskill and Unlimited Shot is active
	-- mods.precast.ws.distant.magical["Unlimited Shot"] and mods.precast.ws.distant.physical["Unlimited Shot"] can both also be defined
	mods.precast.ws.distant["Unlimited Shot"] =
		{
			
		}

	-- Additional gear that will be equipped when using a ranged weapon weaponskill and Velocity Shot is active
	mods.precast.ws.distant["Velocity Shot"] =
		{
			
		}

--
-- PRECAST MAGIC SETS
--

	-- Probably just Fast Cast gear
	sets.precast.magic =
		{
			
		}
--
-- MIDCAST MAGIC SETS
--

	-- RNG isn't a caster so just use the magic precast set to shorten recast
	sets.midcast.magic = sets.precast.magic

--
-- PRECAST RA SETS
--

	sets.precast.ra =
		{
			
		}

--
-- MIDCAST RA SETS
--

	sets.midcast.ra =
		{
			
		}

--
-- MIDCAST RA MODS
--

	-- +Ranged Accuracy gear when using a ranged attack and Ranged Offense mod = "RAcc"
	mods.midcast.ra["RAcc"] =
		{
			
		}

	-- +Treasure Hunter gear when using a ranged attack and TH mod = "+TH"
	mods.midcast.ra["+TH"] =
		{
			
		}

	-- Additional gear that will be equipped when performing a ranged attack and Barrage is active
	mods.midcast.ra["Barrage"] =
		{
			
		}

	-- Additional gear that will be equipped when performing a ranged attack and Double Shot is active
	mods.midcast.ra["Double Shot"] =
		{
			
		}

	-- Additional gear that will be equipped when performing a ranged attack and Hover Shot is active
	mods.midcast.ra["Hover Shot"] =
		{
			
		}

	-- Additional gear that will be equipped when performing a ranged attack and Overkill is active
	mods.midcast.ra["Overkill"] =
		{
			
		}

	-- Additional gear that will be equipped when performing a ranged attack and Velocity Shot is active
	mods.midcast.ra["Velocity Shot"] =
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