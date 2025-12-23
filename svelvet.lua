function get_sets()
	require "YAG_include.lua"
end

function GetPlayerSettings()

	-- Library settings
	ApplyKeybindScripts = true
	AutoCancelDelayAmount = .1
	UnbindMainJobScript = "binds/unbind_main.lua"
	UnbindSubJobScript = "binds/unbind_sub.lua"
	ShowDebugMessages = true
	ForceUpdateAfterCycle = true
	ForceUpdateAfterCycleDelay = .6
	AutomaticPrecastTermination = true


	ForceUpdateAfterZone = true
	ForceUpdateAfterZoneDelay = 8


	TickEnable = false
	TickInterval = 30
	TickForceUpdateCooldown = 2
	TickEvaluateMovement = false
	TickEvaluateFacing = false
	TickEvaluateHook = false


	ControlPanelActiveDecoratorPrefix = "*"
	ControlPanelActiveDecoratorSuffix = "*"
	ControlPanelVisible = true
	ControlPanelDescriptionWidth = 18
	ControlPanelValueWidth = 11
	ControlPanelX = 2750
	ControlPanelY = 950
	ControlPanelDraggable = true
	ControlPanelPadding = 5

	BindKey("f12", "gs c update")

	JobControls = 
		{
		["WAR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_war.lua"},

		["MNK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["WHM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["BLM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["RDM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["THF"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["PLD"] = {macrobook=1, macroset=1, lockstyle=3, file_equipment="samples/intermediate_pld_equipment.lua", file_logic="samples/intermediate_pld_logic.lua", script_binds_main="binds/pld.lua", script_binds_sub=""},

		["DRK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["BST"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["BRD"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="samples/intermediate_brd_equipment.lua", file_logic="samples/intermediate_brd_logic.lua", script_binds_main="", script_binds_sub=""},

		["RNG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["SAM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_sam.lua"},

		["NIN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_nin.lua"},

		["DRG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["SMN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["BLU"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["COR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["PUP"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="samples/simple_pup_equipment.lua", file_logic="samples/simple_pup_logic.lua", script_binds_main="binds/pup.lua", script_binds_sub=""},

		["DNC"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="samples/advanced_dnc_equipment.lua", file_logic="samples/advanced_dnc_logic.lua", script_binds_main="binds/dnc.lua", script_binds_sub="binds/sub_dnc.lua"},

		["SCH"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["GEO"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},

		["RUN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""}
		}

		
	sets.craft =
		{
		main="Caduceus",
		sub="Ossifier's Shield",
		head="Protective Specs.",
		body="Boneworker's Apn.",
		hands="Tanner's Gloves",
		waist="Boneworker's Belt",
		neck="Bone. Torque",
		ring1="Artificer's Ring",
		ring2="Craftmaster's Ring"
		}

	sets.midcast["Apururu (UC)"] =
		{
			body="Apururu Unity Shirt"
		}
	sets.midcast["Sylvie (UC)"] =
		{
			body="Sylvie Unity Shirt"
		}
	sets.midcast["Yoran-Oran (UC)"] =
		{
			body="Yoran Unity Shirt"
		}

	gear = {}
	gear.fastcast_light_head = { name="Herculean Helm", augments={'Pet: Phys. dmg. taken -1%','"Fast Cast"+5',}}
	gear.fastcast_light_body = { name="Taeon Tabard", augments={'"Fast Cast"+5',}}
	gear.fastcast_light_hands = { name="Leyline Gloves"}
	gear.fastcast_light_legs = { name="Herculean Trousers", augments={'"Fast Cast"+6','Mag. crit. hit dmg. +2%','Damage taken-2%',}}
	gear.fastcast_light_feet = { name="Taeon Boots", augments={'"Fast Cast"+3',}}
	gear.TH2_light_hands = { name="Herculean Gloves", augments={'"Dbl.Atk."+1','"Occult Acumen"+9','"Treasure Hunter"+2','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}

end

function EstimateCharacterTotalHaste()

	local Haste_Gear = 25
	local Haste_Magic = 0
	local Haste_JA = 0
	local Haste_Total = 0

	-- Haste or GEO Haste
	if buffactive[33] or buffactive[580] then
		Haste_Magic = Haste_Magic + 30
	end

	-- March
	if buffactive[214] then
		Haste_Magic = Haste_Magic + 10
	end

	-- Embrava
	if buffactive[228] then
		Haste_Magic = Haste_Magic + 25
	end

	-- Mighty Guard
	if buffactive[604] then
		Haste_Magic = Haste_Magic + 15
	end

	-- Haste Samba
	if buffactive[370] then
		if GetCharacterJobShort() == 'DNC' then
			Haste_JA = Haste_JA + 10
		else
			Haste_JA = Haste_JA + 5
		end
	end

	Haste_Magic = Clamp(Haste_Magic, 0, 43)
	Haste_JA = Clamp(Haste_JA, 0, 25)

	Haste_Total = Haste_Gear + Haste_Magic + Haste_JA
	Haste_Total = Clamp(Haste_Total, 0, 80)

	ChatDebug("Estimated total haste", Haste_Total .. "%")
	return Haste_Total
end

function GetDualWieldToCap(JobDualWield, PlayerHaste)

	FractionalHaste = math.floor(PlayerHaste/100 * 1024)
	DualWieldToCap = (1 - (.2/((1024-FractionalHaste)/1024))) * 100
	DualWieldToCap = math.ceil(DualWieldToCap) - JobDualWield

	-- When additional dual wield is needed to reach delay cap then add 1 to lazily account for inaccuracy of using integer percentages rather than exact x/1024 haste values
	if DualWieldToCap > 0 then
		DualWieldToCap = DualWieldToCap + 1
	end

	DualWieldToCap = Clamp(DualWieldToCap, 0, 100)

	ChatDebug("Estimated dualwield to cap", DualWieldToCap .. "%")
	return DualWieldToCap
end