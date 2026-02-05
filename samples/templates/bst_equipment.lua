--
-- PRECAST JA SETS
--

	sets.precast.ja["Bestial Loyalty"] =
		{
			
		}

	sets.precast.ja["Call Beast"] =
		{
			
		}

	sets.precast.ja["Charm"] =
		{
			
		}

	sets.precast.ja["Familiar"] =
		{
			
		}

	sets.precast.ja["Feral Howl"] =
		{
			
		}

	sets.precast.ja["Killer Instinct"] =
		{
			
		}

	sets.precast.ja["Ready"] =
		{
			
		}

	sets.precast.ja["Reward"] =
		{
			
		}

	sets.precast.ja["Sic"] =
		{
			
		}

	sets.precast.ja["Spur"] =
		{
			
		}

	sets.precast.ja["Tame"] =
		{
			
		}

--
-- PRECAST JA MODS
--

	-- Additional gear that will be equipped when using Charm and Unleash is active
	mods.precast.ja["Charm"] = {}
	mods.precast.ja["Charm"]["Unleash"] =
		{
			
		}

	-- Additional gear that will be equipped when using Ready and Unleash is active
	mods.precast.ja["Ready"] = {}
	mods.precast.ja["Ready"]["Unleash"] =
		{
			
		}

	-- Additional gear that will be equipped when using Sic and Unleash is active
	mods.precast.ja["Sic"] = {}
	mods.precast.ja["Sic"]["Unleash"] =
		{
			
		}

--
-- MIDCAST JA SETS
--

	sets.midcast.ja.petready =
	{

	}

	sets.midcast.ja.petready.magical =
	{

	}

	sets.midcast.ja.petready.physical =
	{

	}

--
-- MIDCAST JA MODS
--

	-- Additional gear that will be equipped when a pet begins to use a Ready ability and Unleash is active
	mods.midcast.ja.petready["Unleash"] = 
	{

	}

	-- Additional gear that will be equipped when a pet begins to use a magical Ready ability and Unleash is active
	mods.midcast.ja.petready.magical["Unleash"] =
	{

	}

	-- Additional gear that will be equipped when a pet begins to use a physical Ready ability and Unleash is active
	mods.midcast.ja.petready.physical["Unleash"] =
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

	sets.precast.ws["Blitz"] =
		{
			
		}

	sets.precast.ws["Cloudsplitter"] =
		{
			
		}

	sets.precast.ws["Onslaught"] =
		{
			
		}

	sets.precast.ws["Primal Rend"] =
		{
			
		}

	sets.precast.ws["Ruinator"] =
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

	-- Probably just Fast Cast gear
	InsertGearSet(sets.precast.magic,
		{
			
		})

--
-- MIDCAST MAGIC SETS
--

	-- BST isn't a caster so just use the magic precast set to shorten recast
	InsertGearSet(sets.midcast.magic, sets.precast.magic)

--
-- ENGAGED SET
--

	-- Engaged gear that would be appropriate even if the BST has no pet. Define mods.status.engaged["beast"] below to create your set for when a pet is present.
	sets.status.engaged =
		{
			
		}

	-- Anytime a pet is present this mod will be active and it will be the first offense mod applied. Essentially it is your 'engaged with a pet' set.
	mods.status.engaged["beast"] =
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