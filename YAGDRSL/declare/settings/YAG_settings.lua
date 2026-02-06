require "YAGDRSL/do/math_helpers.lua"

YAG_SETTINGS = "yag_settings"
SETTINGS_DEFAULT = "yag_default_settings"

-- This is the table for settings that will be referenced throughout the library.
-- It will first be populated by the default setting values from _G[YAG_SETTINGS][SETTINGS_DEFAULT] and then
-- User defined settings existing in the global space will then be retrieved to overwrite the default values.
_G[YAG_SETTINGS] = {}

-- This table only holds default values.
-- It is not read for any library operation.
_G[YAG_SETTINGS][SETTINGS_DEFAULT] =
{
	ApplyKeybindScripts = false,
	UnbindMainJobScript = "",
	UnbindSubJobScript = "",

	ForceUpdateAfterZone = false,
	ForceUpdateAfterZoneDelay = 10,

	ForceUpdateAfterCycle = true,
	ForceUpdateAfterCycleDelay = 0,
	AutoCancelDelayAmount = .2,

	AutomaticPrecastTermination = false,
	AutomaticUpdateTermination = false,

	TickEnable = false,
	TickInterval = 60,
	TickForceUpdateCooldown = 5,
	TickEvaluateMovement = false,
	TickEvaluateMovementMinimumDistance = 0,
	TickEvaluateFacing = false,
	TickEvaluateHook = false,

	ShowDebugMessages = false,
	GearSetChatSlotWidth = 35,

	ControlPanelVisible = true,
	ControlPanelDescriptionWidth = 20,
	ControlPanelValueWidth = 10,
	ControlPanelActiveValueOnly = false,
	ControlPanelActiveDecoratorPrefix = "*",
	ControlPanelActiveDecoratorSuffix = "*",

	ControlPanelX = 100,
	ControlPanelY = 100,

	ControlPanelBackgroundTransparency = 128,
	ControlPanelBackgroundRed = 0,
	ControlPanelBackgroundGreen = 0,
	ControlPanelBackgroundBlue = 0,
	ControlPanelBackgroundVisible = true,

	ControlPanelJustifyRight = false,
	ControlPanelJustifyBottom = false,
	ControlPanelBold = false,
	ControlPanelDraggable = false,
	ControlPanelItalic = false,

	ControlPanelPadding = 6,

	ControlPanelFontSize = 12,
	ControlPanelFont = 'Consolas',
	ControlPanelFontTransparency = 255,
	ControlPanelFontRed = 255,
	ControlPanelFontGreen = 255,
	ControlPanelFontBlue = 255,

	ControlPanelFontOutlineWidth = 0,
	ControlPanelFontOutlineTransparency = 255,
	ControlPanelFontOutlineRed = 0,
	ControlPanelFontOutlineGreen = 0,
	ControlPanelFontOutlineBlue = 0,

	JobControls = {
		["WAR"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["MNK"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["WHM"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["BLM"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["RDM"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["THF"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["PLD"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["DRK"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["BST"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["BRD"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["RNG"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["SAM"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["NIN"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["DRG"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["SMN"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["BLU"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["COR"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["PUP"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["DNC"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["SCH"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["GEO"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""},
		["RUN"] = {JOB_CONTROL_MACRO_BOOK=1, JOB_CONTROL_MACRO_SET=1, JOB_CONTROL_LOCK_STYLE=1, JOB_CONTROL_FILE_EQUIPMENT="", JOB_CONTROL_FILE_LOGIC="", JOB_CONTROL_SCRIPT_BIND_MAIN="", JOB_CONTROL_SCRIPT_BIND_SUB=""}
		}
}

function DeclareDefaultSettings()
	-- Iterate through the default settings and create them in the settings table.
	for SettingName, SettingValue in pairs(_G[YAG_SETTINGS][SETTINGS_DEFAULT]) do
		_G[YAG_SETTINGS][SettingName] = SettingValue
	end
end

function ApplyPlayerSettings()
	-- Iterate through the SettingName keys.
	for SettingName, _ in pairs(_G[YAG_SETTINGS][SETTINGS_DEFAULT]) do

		-- If the user has specified a value for any of the settings in their character/job files then overwrite the value in the settings table.
		if _G[SettingName] ~= nil then
			_G[YAG_SETTINGS][SettingName] = _G[SettingName]
		end
	end

	ValidateSettings()
end

function ValidateSettings()
	-- Make sure certain values are in an acceptable range.
	_G[YAG_SETTINGS]["ForceUpdateAfterCycleDelay"] = Clamp(_G[YAG_SETTINGS]["ForceUpdateAfterCycleDelay"], 0, 60)
	_G[YAG_SETTINGS]["AutoCancelDelayAmount"] = Clamp(_G[YAG_SETTINGS]["AutoCancelDelayAmount"], 0, 60)

	_G[YAG_SETTINGS]["TickInterval"] = Clamp(_G[YAG_SETTINGS]["TickInterval"], 1, 600)
	_G[YAG_SETTINGS]["TickForceUpdateCooldown"] = Clamp(_G[YAG_SETTINGS]["TickForceUpdateCooldown"], .1, 60)

	_G[YAG_SETTINGS]["TickEvaluateMovementMinimumDistance"] = Clamp(_G[YAG_SETTINGS]["TickEvaluateMovementMinimumDistance"], 0, 100)
end