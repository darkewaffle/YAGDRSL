require "YAGDRSL/get/mods/get_mod_value.lua"

function GetOverrideValue()
	return GetModValue(OVERRIDE_VALUES_ROOT_NAME, false)
end