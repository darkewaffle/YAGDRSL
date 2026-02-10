function get_sets()
	require "YAG_include.lua"
end


function GetPlayerSettings()

	JobControls =
		{
		["WAR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="war_equipment.lua", file_logic="war_logic.lua", script_binds_main="", script_binds_sub=""},
		["MNK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="mnk_equipment.lua", file_logic="mnk_logic.lua", script_binds_main="", script_binds_sub=""},
		["WHM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="whm_equipment.lua", file_logic="whm_logic.lua", script_binds_main="", script_binds_sub=""},
		["BLM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="blm_equipment.lua", file_logic="blm_logic.lua", script_binds_main="", script_binds_sub=""},
		["RDM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="rdm_equipment.lua", file_logic="rdm_logic.lua", script_binds_main="", script_binds_sub=""},
		["THF"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="thf_equipment.lua", file_logic="thf_logic.lua", script_binds_main="", script_binds_sub=""},
		["PLD"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="pld_equipment.lua", file_logic="pld_logic.lua", script_binds_main="", script_binds_sub=""},
		["DRK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="drk_equipment.lua", file_logic="drk_logic.lua", script_binds_main="", script_binds_sub=""},
		["BST"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="bst_equipment.lua", file_logic="bst_logic.lua", script_binds_main="", script_binds_sub=""},
		["BRD"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="brd_equipment.lua", file_logic="brd_logic.lua", script_binds_main="", script_binds_sub=""},
		["RNG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="rng_equipment.lua", file_logic="rng_logic.lua", script_binds_main="", script_binds_sub=""},
		["SAM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="sam_equipment.lua", file_logic="sam_logic.lua", script_binds_main="", script_binds_sub=""},
		["NIN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="nin_equipment.lua", file_logic="nin_logic.lua", script_binds_main="", script_binds_sub=""},
		["DRG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="drg_equipment.lua", file_logic="drg_logic.lua", script_binds_main="", script_binds_sub=""},
		["SMN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="smn_equipment.lua", file_logic="smn_logic.lua", script_binds_main="", script_binds_sub=""},
		["BLU"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="blu_equipment.lua", file_logic="blu_logic.lua", script_binds_main="", script_binds_sub=""},
		["COR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="cor_equipment.lua", file_logic="cor_logic.lua", script_binds_main="", script_binds_sub=""},
		["PUP"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="pup_equipment.lua", file_logic="pup_logic.lua", script_binds_main="", script_binds_sub=""},
		["DNC"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="dnc_equipment.lua", file_logic="dnc_logic.lua", script_binds_main="", script_binds_sub=""},
		["SCH"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="sch_equipment.lua", file_logic="sch_logic.lua", script_binds_main="", script_binds_sub=""},
		["GEO"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="geo_equipment.lua", file_logic="geo_logic.lua", script_binds_main="", script_binds_sub=""},
		["RUN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="run_equipment.lua", file_logic="run_logic.lua", script_binds_main="", script_binds_sub=""}
		}

	ForceUpdateAfterCycle = true
	ForceUpdateAfterCycleDelay = 1

	TickEnable = true
	TickInterval = 30
	TickEvaluateMovement = true
	TickForceUpdateCooldown = 3

	AutomaticPrecastTermination = true
	AutomaticUpdateTermination = true

	ControlPanelX = 200
	ControlPanelY = 200
	ControlPanelDescriptionWidth = 20
	ControlPanelValueWidth = 12
	ControlPanelDraggable = true

	CreateMod("Offense",         "F9    Offense",1, "f9",    "Acc",    "Multi")
	CreateMod("PhysicalDefense", "F10   PDef",   2, "f10",   "PDTLo",  "PDTHi")
	CreateMod("MagicalDefense",  "F11   MDef",   3, "f11",   "MEvaLo", "MEvaHi")
	CreateMod("TH",              "ShF12 TH",     4, "~f12",  "+TH")

	ConfigureDefensePriority("End   DefPriority", 98, "end")
	ConfigureWeaponLock(     "ShEnd WepLock",     99, "~end")

	SetModOrderPrecastWSOffense("Offense")

	SetModOrderMidcastMagicOffense("Offense", "TH")
	SetModOrderMidcastMagicDefense("PhysicalDefense", "MagicalDefense")

	SetModOrderMidcastRADefense("PhysicalDefense", "MagicalDefense")

	SetModOrderEngagedOffense ("Offense", "TH")
	SetModOrderEngagedDefense ("PhysicalDefense", "MagicalDefense")

	SetModOrderIdleDefense    ("PhysicalDefense", "MagicalDefense")
	SetModOrderRestingDefense ("PhysicalDefense", "MagicalDefense")

	BindKey("f12", "gs c update", true)

	SetAutoCancelBuff({"Monomi: Ichi", "Sneak", "Spectral Jig"},
					  {"Sneak"})


	-- Gear that should be equipped when dealing magic damage that matches the game weather element
		WeatherItems.universal = { }
		WeatherItems.fire =      { }
		WeatherItems.ice =       { }
		WeatherItems.wind =      { }
		WeatherItems.earth =     { }
		WeatherItems.lightning = { }
		WeatherItems.water =     { }
		WeatherItems.light =     { }
		WeatherItems.dark =      { }


	-- Gear that should be equipped when dealing magic damage that matches the game day element
		DayItems.universal = { }
		DayItems.fire =      { }
		DayItems.ice =       { }
		DayItems.wind =      { }
		DayItems.earth =     { }
		DayItems.lightning = { }
		DayItems.water =     { }
		DayItems.light =     { }
		DayItems.dark =      { }


	function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet) -- @Hook
		-- This is a function the user can override to implement custom logic.
		-- It must return a gearset in order proceed properly.

		-- Precast customize for weather/day gear will only apply to weaponskills
		if SpellAttributes["Category"] == "ws" then
			PrecastSet = CustomizeGearForDayElement(SpellAttributes, PrecastSet)
			PrecastSet = CustomizeGearForWeatherElement(SpellAttributes, PrecastSet)
		end

		return PrecastSet
	end


	function HookMidcastCustomizeOffense(SpellAttributes, MidcastSet) -- @Hook
		-- This is a function the user can override to implement custom logic.
		-- It must return a gearset in order proceed properly.

		-- Midcast customize for weather/day gear will only apply to spells
		if SpellAttributes["Category"] == "magic" then
			MidcastSet = CustomizeGearForDayElement(SpellAttributes, MidcastSet)
			MidcastSet = CustomizeGearForWeatherElement(SpellAttributes, MidcastSet)
		end

		return MidcastSet
	end

end