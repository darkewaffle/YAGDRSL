function get_sets()
	require "YAG_include.lua"
end

function GetPlayerSettings()

	JobControls =
		{
		["WAR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["MNK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["WHM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BLM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RDM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["THF"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["PLD"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["DRK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BST"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BRD"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RNG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SAM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["NIN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["DRG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SMN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BLU"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["COR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["PUP"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["DNC"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SCH"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["GEO"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RUN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""}
		}

	ForceUpdateAfterCycle = true
	ForceUpdateAfterCycleDelay = 1

	AutomaticPrecastTermination = true
	AutomaticUpdateTermination = true

	ControlPanelX = 200
	ControlPanelY = 200
	ControlPanelDescriptionWidth = 20
	ControlPanelValueWidth = 10

	CreateMod("Offense",         "F9    Offense",true, "f9",    "Acc",    "Multi")
	CreateMod("PhysicalDefense", "F10   PDef",   true, "f10",   "PDTLo",  "PDTHi")
	CreateMod("MagicalDefense",  "F11   MDef",   true, "f11",   "MEvaLo", "MEvaHi")
	CreateMod("TH",              "ShF12 TH",     true, "~f12",  "+TH")

	ConfigureDefensePriority("End   DefPriority", true, "end")
	ConfigureWeaponLock("ShEnd WepLock", true, "~end")

	SetModOrderPrecastWSOffense("Offense")

	SetModOrderMidcastMagicOffense("Offense", "TH")
	SetModOrderMidcastMagicDefense("PhysicalDefense", "MagicalDefense")

	SetModOrderMidcastRAOffense("Offense", "TH")
	SetModOrderMidcastRADefense("PhysicalDefense", "MagicalDefense")

	SetModOrderEngagedOffense ("Offense", "TH")
	SetModOrderEngagedDefense ("PhysicalDefense", "MagicalDefense")

	SetModOrderIdleDefense    ("PhysicalDefense", "MagicalDefense")
	SetModOrderRestingDefense ("PhysicalDefense", "MagicalDefense")

	BindKey("f12", "gs c update")

	SetAutoCancelBuff({"Monomi: Ichi", "Sneak", "Spectral Jig"},	
					  {"Sneak"})

end