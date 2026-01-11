--
-- PRECAST JA SETS
--

	sets.precast.ja["Angon"] =
		{

		}

	sets.precast.ja["Ancient Circle"] =
		{

		}

	sets.precast.ja["Call Wyvern"] =
		{

		}

	sets.precast.ja["Spirit Link"] =
		{

		}

	sets.precast.ja["Spirit Surge"] =
		{

		}

	-- Gear that will be equipped for all Jump abilities
	sets.precast.ja.jump =
		{

		}

	sets.precast.ja["Jump"] = 
		{
			
		}

	sets.precast.ja["High Jump"] = 
		{
			
		}

	sets.precast.ja["Super Jump"] = 
		{
			
		}

	sets.precast.ja["Spirit Jump"] = 
		{
			
		}

	sets.precast.ja["Soul Jump"] = 
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

	sets.precast.ws["Camlann's Torment"] =
		{

		}

	sets.precast.ws["Diarmuid"] =
		{

		}

	sets.precast.ws["Drakesbane"] =
		{

		}

	sets.precast.ws["Impulse Drive"] =
		{

		}

	sets.precast.ws["Stardiver"] =
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
	sets.precast.magic =
		{

		}
--
-- MIDCAST MAGIC SETS
--
	-- WAR isn't a caster so just use the magic precast set to shorten recast
	sets.midcast.magic = sets.precast.magic

--
-- ENGAGED SET
--

	-- Engaged gear that would be appropriate even if the DRG has no pet. Define mods.engaged["wyvern"] below to create your set for when a pet is present.
	sets.engaged =
		{

		}

	-- Anytime a pet is present this mod will be active and it will be the first offense mod applied. Essentially it is your 'engaged with a pet' set.
	mods.engaged["wyvern"] =
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