-- When Gearswap loads the first thing it looks for is get_sets().
-- This is where a Gearswap library is usually loaded. The next three lines are required for YAGDRSL to function.
function get_sets()
	require "YAG_include.lua"
end

-- Next we define the GetPlayerSettings function. YAGDRSL will call this after it is loaded to read your player settings.
-- This is a real .lua function so make sure it starts with "function GetPlayerSettings()" and ends with a line that just says "end".
function GetPlayerSettings()

--[[
	The first thing you should define are your JobControls. These will all be automatically loaded or applied when the library loads or you change jobs.

		macrobook represents the macro book number that will be selected
		macroset represents the macro set number that will be selected
		lockstyle represents the lockstyle set number that will be applied
		file_equipment represents the .lua file that contains all the gearsets for a particular job
		file_logic represents the .lua file that contains any additional logic (code, functions) that you may want to use for a job
		Optional: script_binds_main represents the .lua script file that will be executed to set keybinds when the job is your main job
		Optional: script_binds_sub represents the .lua script file that will be executed to set keybinds when the job is your sub job
]]
	JobControls = 
		{
		["WAR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_war.lua"},
		["MNK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["WHM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BLM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RDM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["THF"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["PLD"] = {macrobook=1, macroset=1, lockstyle=3, file_equipment="samples/jobfiles/intermediate_pld_equipment.lua", file_logic="samples/jobfiles/intermediate_pld_logic.lua", script_binds_main="binds/pld.lua", script_binds_sub=""},
		["DRK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BST"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BRD"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="samples/jobfiles/intermediate_brd_equipment.lua", file_logic="samples/jobfiles/intermediate_brd_logic.lua", script_binds_main="", script_binds_sub=""},
		["RNG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SAM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_sam.lua"},
		["NIN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_nin.lua"},
		["DRG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SMN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BLU"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["COR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["PUP"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="samples/jobfiles/simple_pup_equipment.lua", file_logic="samples/jobfiles/simple_pup_logic.lua", script_binds_main="binds/pup.lua", script_binds_sub=""},
		["DNC"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="samples/jobfiles/advanced_dnc_equipment.lua", file_logic="samples/jobfiles/advanced_dnc_logic.lua", script_binds_main="binds/dnc.lua", script_binds_sub="binds/sub_dnc.lua"},
		["SCH"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["GEO"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RUN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""}
		}


--
-- YAGDRSL SETTINGS
--
-- These are settings that control many aspects of how YAGDRSL works and looks. You do not need to include all of them, only the ones you want to use and change.
-- The others will simply use a safe, default value.


	-- KEYBINDS
		-- This setting controls whether or not the script_binds_main and script_binds_sub values in JobControls are actually executed or not.
		ApplyKeybindScripts = false
		
		-- These values define default unbind scripts that will be run anytime your job changes or the library is unloaded.
		UnbindMainJobScript = ""
		UnbindSubJobScript = ""


	-- UPDATE AFTER CHANGING ZONE
		-- These control whether or not an update to your current status set will be applied when you zone and how quickly it will be applied after zoning.
		ForceUpdateAfterZone = false
		ForceUpdateAfterZoneDelay = 10


	-- UPDATE AFTER CYCLING MOD VALUE
		-- These control whether or not an update to your current status set will be applied when you cycle a mod value and how long the update will be delayed.
		-- Essentially this lets you cycle a mod value repeatedly without causing an update every time and then after you stop cycling for ForceUpdateAfterCycleDelay amount of seconds then the update will be applied.
		ForceUpdateAfterCycle = true
		ForceUpdateAfterCycleDelay = 0


	-- CHAT SETTINGS
		-- YAGDRSL has fairly extensive debug messages in place that are normally hidden. But if you want to see them to learn more about how it works or to try to diagnose why something isn't working like you expect then turning them on can be helpful
		-- You can also turn them on at will using a 'gs c debug' command.
		ShowDebugMessages = false
		-- Debug messages will also display gearsets in the chat log. This controls how much horizontal space each slot will take up in the chat log.
		GearSetChatSlotWidth = 35


	-- OTHER SETTINGS
		-- YAGDRSL can automatically cancel buffs when using certain actions. When a cancel takes place this determines how much time the action is delayed before being cast.
		AutoCancelDelayAmount = .2

		-- Precast has some checks in place that will cancel an action (and will not change gear) if the action is on recast, if the action is a Weaponskill and the character has <1000 TP or if the character is already in midcast for another action. This may be expanded in the future. Midcast update termination may not be 100% reliable due to networking shenanigans.
		AutomaticPrecastTermination = false

		-- Prevents status set updates when the character is not in a valid status (such as in a cutscene or speaking to an NPC) or when the character is already in the midcast of an action. Midcast update termination may not be 100% reliable due to networking shenanigans.
		AutomaticUpdateTermination = false


	-- TICK SETTINGS
		-- This controls YAGDRSL's OnTick event. Essentially this allows code to be run at regular intervals regardless of what's happening in the game.
		-- However because of that if it is used irresponsibly then it can degrade game performance. But that should not be a problem as long as you are careful to not set TickInterval too low.

		-- Enables or disables the creation of the tick event when YAGDRSL is loaded.
		TickEnable = false

		-- Controls the frequency of the tick event. Essentially this is the number of frames that must be displayed between each tick. If you play at 30FPS then I would not go lower than 10. If you play at 60FPS then I would not go lower than 20.
		TickInterval = 60

		-- Controls how many seconds must pass between each force update called by tick.
		TickForceUpdateCooldown = 5

		-- So why would we use tick? Because it allows us to track certain things that would not be otherwise possible or reliable.
		-- If tick is enabled then these settings control what happens during tick.

		-- Enables movement tracking so that gearsets can be equipped or modified depending on whether or not the character is moving or stationary.
		-- Useful for idling in defensive gear but then equipping +Movement Speed gear when you start to move.
		TickEvaluateMovement = false

		-- Requires movement between ticks to be at least TickEvaluateMovementMinimumDistance units in order to be considered 'moving'.
		TickEvaluateMovementMinimumDistance = 0

		-- Enables tracking of whether or not you are currently engaged with the target and facing the target's face. Useful for conditionally equipping items like Horos Toe Shoes.
		-- Could also track if you are behind the target.
		TickEvaluateFacing = false

		-- Lastly there is a hook in tick where the user can write their own code that would be run every tick interval as well.
		TickEvaluateHook = false


	-- CONTROL PANEL
		-- The control panel is a text display that will show you the current state of various mods. Most of these should be self explanatory however a few are worth mentioning specifically.

		-- When a mod is formatted into the control panel the description will be padded with spaces up to ControlPanelDescriptionWidth length. And mod values will be padded up to ControlPanelValueWidth.
		-- These settings let you fine tune your control panel so that it doesn't take up more space than necessary - or so that you can use longer descriptions and values if you prefer.
		ControlPanelDescriptionWidth = 20
		ControlPanelValueWidth = 10

		-- This setting controls whether or not the control panel will display all the values a mod contains (highlighting the active value among them) or if it will only display the currently active value.
		ControlPanelActiveValueOnly = false

		ControlPanelVisible = true
		ControlPanelActiveDecoratorPrefix = "*"
		ControlPanelActiveDecoratorSuffix = "*"

		ControlPanelX = 100
		ControlPanelY = 100

		ControlPanelBackgroundTransparency = 128
		ControlPanelBackgroundRed = 0
		ControlPanelBackgroundGreen = 0
		ControlPanelBackgroundBlue = 0
		ControlPanelBackgroundVisible = true

		ControlPanelJustifyRight = false
		ControlPanelJustifyBottom = false
		ControlPanelBold = false
		ControlPanelDraggable = false
		ControlPanelItalic = false

		ControlPanelPadding = 6

		ControlPanelFontSize = 12
		ControlPanelFont = 'Consolas'
		ControlPanelFontTransparency = 255
		ControlPanelFontRed = 255
		ControlPanelFontGreen = 255
		ControlPanelFontBlue = 255

		ControlPanelFontOutlineWidth = 0
		ControlPanelFontOutlineTransparency = 255
		ControlPanelFontOutlineRed = 0
		ControlPanelFontOutlineGreen = 0
		ControlPanelFontOutlineBlue = 0

--
-- EQUIPMENT DECLARATIONS
--
-- The character file is also a good place to include gear that you may want to define for use across multiple jobs.

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

	gear = {}
	gear.fastcast_light_head = { name="Herculean Helm", augments={'Pet: Phys. dmg. taken -1%','"Fast Cast"+5',}}
	gear.fastcast_light_body = { name="Taeon Tabard", augments={'"Fast Cast"+5',}}
	gear.fastcast_light_hands = { name="Leyline Gloves"}
	gear.fastcast_light_legs = { name="Herculean Trousers", augments={'"Fast Cast"+6','Mag. crit. hit dmg. +2%','Damage taken-2%',}}
	gear.fastcast_light_feet = { name="Taeon Boots", augments={'"Fast Cast"+3',}}
	gear.TH2_light_hands = { name="Herculean Gloves", augments={'"Dbl.Atk."+1','"Occult Acumen"+9','"Treasure Hunter"+2','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
end



-- The character file is also a good place to create any custom functions that you may want to use on multiple jobs.
function CharacterCustomFunction()
	ChatMessage("Look mom, a message!")
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