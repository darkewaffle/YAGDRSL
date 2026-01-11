--
-- PRECAST JA SETS
--

	sets.precast.ja["Bolster"] =
		{

		}

	sets.precast.ja["Concentric Pulse"] =
		{

		}

	sets.precast.ja["Full Circle"] =
		{

		}

	sets.precast.ja["Life Cycle"] =
		{

		}

	sets.precast.ja["Mending Halation"] =
		{

		}

	sets.precast.ja["Radial Arcana"] =
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

	sets.precast.ws["Black Halo"] =
		{

		}

	sets.precast.ws["Dagda"] =
		{

		}

	sets.precast.ws["Exudation"] =
		{

		}

	sets.precast.ws["Hexa Strike"] = 
		{

		}

	sets.precast.ws["Judgment"] = 
		{

		}

	sets.precast.ws["Realmrazer"] = 
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

	sets.precast.magic.elemental =
		{

		}

--
-- MIDCAST MAGIC SETS
--
	-- Gear that will be equipped as midcast for all spells. sets.precast.magic serves as a base that provides recast reduction.
	InsertGearSet(sets.midcast.magic, set_combine(sets.precast.magic,
		{

		}))

	InsertGearSet(sets.midcast.magic.dark,
		{

		})

	sets.midcast.magic.dark.aspir =
		{

		}

	sets.midcast.magic.dark.drain =
		{

		}

	InsertGearSet(sets.midcast.magic.enfeebling,
		{

		})

	InsertGearSet(sets.midcast.magic.elemental,
		{

		})


	InsertGearSet(sets.midcast.magic.geomancy,
		{

		})

	sets.midcast.magic.geomancy.geo =
		{

		}

	sets.midcast.magic.geomancy.indi =
		{

		}

--
-- MIDCAST MAGIC MODS
--
	-- +Magic Accuracy gear that will be equipped when casting an elemental spell the Offense mod = "MAcc"
	mods.midcast.magic.elemental["MAcc"] =
		{
			
		}

	-- +Magic Damage gear that will be equipped when casting an elemental spell the Offense mod = "MDmg"
	mods.midcast.magic.elemental["MDmg"] =
		{
			
		}

	-- Magic burst enhancement gear that will be equipped when casting an elemental spell and the Magic Burst mod = "+MBurst"
	mods.midcast.magic.elemental["+MBurst"] =
		{
			
		}

	-- +Treasure Hunter that will be equipped when casting an elemental spell and TH mod = "+TH"
	mods.midcast.magic.elemental["+TH"] =
		{

		}

--
-- ENGAGED SET
--

	-- Engaged gear that would be appropriate even if the GEO has no luopan. Define mods.engaged["luopan"] below to create your set for when a pet is present.
	sets.engaged =
		{

		}

	-- Anytime a pet is present this mod will be active and it will be the first offense mod applied. Essentially it is your 'engaged with a pet' set.
	mods.engaged["luopan"] =
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
	-- Idle gear that would be appropriate even if the GEO has no luopan. Define mods.idle["luopan"] below to create your set for when a pet is present.
	sets.idle =
		{

		}

	-- Anytime a pet is present this mod will be active and it will be the first offense mod applied. Essentially it is your 'idle with a pet' set.
	mods.idle["luopan"] =
		{

		}

	sets.idle.town =
		{

		}

	-- Resting gear that would be appropriate even if the GEO has no luopan. Define mods.resting["luopan"] below to create your set for when a pet is present.
	sets.resting =
		{

		}

	-- Anytime a pet is present this mod will be active and it will be the first offense mod applied. Essentially it is your 'resting with a pet' set.
	mods.resting["luopan"] =
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