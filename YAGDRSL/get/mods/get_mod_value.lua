require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/get/mods/get_mod_exists.lua"

function GetModValue(ModName, ReturnDefaultValue)
	if not GetModExists(ModName) then
		return nil
	end

	local ReturnDefaultValue = ReturnDefaultValue or false
	local ModObject = _G[MOD_VALUES_ROOT_NAME][ModName]

	if ModObject["value"] == nil then
		ChatWarning("MOD: " .. ModName, "exists but has no value")
		return nil
	end

	local ModValue = ModObject["value"]

	-- All mods should be created with CreateMod which gives each mod a default value of MOD_DEFAULT_OFF meaning the mod is inactive.
	if ModValue ~= MOD_DEFAULT_OFF or ReturnDefaultValue then
		return ModValue
	else
		return nil
	end
end