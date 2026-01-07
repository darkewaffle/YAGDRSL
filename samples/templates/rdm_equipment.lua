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

	sets.midcast.magic.enfeebling.addle =
		{

		}

	sets.midcast.magic.enfeebling.bind =
		{

		}

	sets.midcast.magic.enfeebling.blind =
		{

		}

	sets.midcast.magic.enfeebling.break =
		{

		}

	sets.midcast.magic.enfeebling.dia =
		{

		}

	sets.midcast.magic.enhancing.dispel =
		{

		}

	sets.midcast.magic.enfeebling.distract =
		{

		}

	sets.midcast.magic.enfeebling.frazzle =
		{

		}

	sets.midcast.magic.enfeebling.gravity =
		{

		}

	sets.midcast.magic.enfeebling.paralyze =
		{

		}

	sets.midcast.magic.enfeebling.poison =
		{

		}

	sets.midcast.magic.enfeebling.silence =
		{

		}

	sets.midcast.magic.enfeebling.sleep =
		{

		}

	sets.midcast.magic.enfeebling.slow =
		{

		}

--
-- MIDCAST MAGIC ENHANCING
--

	InsertGearSet(sets.midcast.magic.enhancing,
		{

		})

	sets.midcast.magic.enhancing.barelement =
		{

		}

	sets.midcast.magic.enhancing.barstatus =
		{
			
		}

	sets.midcast.magic.enhancing.boost =
		{

		}

	sets.midcast.magic.enhancing.enspell =
		{

		}

	sets.midcast.magic.enhancing.flurry =
		{

		}

	sets.midcast.magic.enhancing.gain =
		{

		}

	sets.midcast.magic.enhancing.haste =
		{

		}

	sets.midcast.magic.enhancing.phalanx =
		{

		}

	sets.midcast.magic.enhancing.refresh =
		{

		}

	sets.midcast.magic.enhancing.spikes =
		{

		}

	sets.midcast.magic.enhancing.temper =
		{

		}

--
-- MIDCAST MAGIC HEALING
--

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
	mods.micast.magic.enfeebling["EnfAcc"] =
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