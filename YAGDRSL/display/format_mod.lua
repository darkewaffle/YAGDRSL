require "YAGDRSL/do/modify_strings.lua"
require "YAGDRSL/get/mods/get_mod_value.lua"

-- This function accepts a mod (which is also a Mode per libraries/modes.lua) and formats it into a line of text appropriate for display in the control panel.
function FormatModForControlPanel(ModName)

	local ModObject = _G[MOD_VALUES_ROOT_NAME][ModName]
	local ModAsString = SetStringWidth(ModObject["Description"] or "No Description", _G[YAG_SETTINGS]["ControlPanelDescriptionWidth"])
	local ActiveValue = GetModValue(ModName, true)

	for _, ModValue in ipairs(ModObject) do

		local ModValueString = ""
		
		-- Active ModValue
		-- Decorate to highlight it in the control panel.
		if ModValue == ActiveValue then

			-- If ControlPanelActiveValueOnly and ActiveValue = 'off' then don't fully decorate. Just set the width.
			if _G[YAG_SETTINGS]["ControlPanelActiveValueOnly"] and ActiveValue == MOD_DEFAULT_OFF then
				ModValueString = FormatModValue(ModValue, false, true, false)
			
			-- Fully decorate.
			else
				ModValueString = FormatModValue(ModValue, true, true, true)
			end

		-- Inactive mode values. Just set the width.
		else
			ModValueString = FormatModValue(ModValue, false, true, false)
		end

		-- The ModValue is not the mode's active value and ControlPanelActiveValueOnly is enabled.
		if ModValue ~= ActiveValue and _G[YAG_SETTINGS]["ControlPanelActiveValueOnly"] then
			-- Do nothing.
		else
			-- Append the value string.
			ModAsString = ModAsString .. ModValueString
		end
	end

	return ModAsString
end

-- Composite function to format a modvalue for display in on-screen elements created by the 'texts' library.
-- To ensure proper display the decoration characters must be applied first.
-- Then the string must be padded with spaces to the appropriate length.
-- Then the padded string can be wrapped with the characters that control color as they are not displayed and will not affect string length.
function FormatModValue(ModValue, Decorate, SetWidth, ColorWrap)

	local ModValueString = tostring(ModValue)

	local RedValue = 0
	local GreenValue = 0
	local BlueValue = 0

	if ModValueString == "false" then
		RedValue = 255
	else
		GreenValue = 255
	end

	if Decorate then
		ModValueString = DecorateString(ModValueString)
	end

	if SetWidth then
		ModValueString = SetStringWidth(ModValueString, _G[YAG_SETTINGS]["ControlPanelValueWidth"])
	end

	if ColorWrap then
		ModValueString = ColorWrapForTexts(ModValueString, RedValue, GreenValue, BlueValue)
	end

	return ModValueString
end