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

	sets.midcast.magic.enfeebling.black.bind =
		{
			
		}

	sets.midcast.magic.enfeebling.black.blind =
		{
			
		}

	sets.midcast.magic.enfeebling.black.break =
		{
			
		}

	sets.midcast.magic.enfeebling.black.dispel =
		{
			
		}

	sets.midcast.magic.enfeebling.black.distract =
		{
			
		}

	sets.midcast.magic.enfeebling.black.frazzle =
		{
			
		}

	sets.midcast.magic.enfeebling.black.gravity =
		{
			
		}

	sets.midcast.magic.enfeebling.black.poison =
		{
			
		}

	sets.midcast.magic.enfeebling.black.sleep =
		{
			
		}

	InsertGearSet(sets.midcast.magic.enfeebling.white,
		{
			
		})

	sets.midcast.magic.enfeebling.white.addle =
		{
			
		}

	sets.midcast.magic.enfeebling.white.dia =
		{
			
		}

	sets.midcast.magic.enfeebling.white.paralyze =
		{
			
		}

	sets.midcast.magic.enfeebling.white.silence =
		{
			
		}

	sets.midcast.magic.enfeebling.white.slow =
		{
			
		}

--
-- MIDCAST MAGIC ENHANCING
--

	InsertGearSet(sets.midcast.magic.enhancing,
		{
			
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

	sets.midcast.magic.enhancing.white.boost =
		{
			
		}

	sets.midcast.magic.enhancing.white.enspell =
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

	-- +Magic Accuracy gear when casting an elemental spell and Magic Offense mod = "NukeAcc"
	mods.midcast.magic.elemental["NukeAcc"] =
		{
			
		}

	-- +Magic Accuracy gear when casting an elemental spell and Magic Offense mod = "MDmg"
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