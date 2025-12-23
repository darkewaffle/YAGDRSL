require "YAGDRSL/do/modify_mod.lua"
require "YAGDRSL/get/mods/get_mod_value.lua"

-- @User
-- These functions allow the user to manipulate the built in Defense Priority modifier
-- The value selected by this mod will not affect how the gearset is created directly but instead controls the order in which mods are applied.
-- Mods are broadly split into two classes - defense and offense (or anything that is not-defense really).
-- When Defense Priority is true that means the offense mods will be assembled first and then the defense mods will overwrite them where applicable.
-- When Defense Priority is false the opposite will happen - offense mod gear will overwrite defense mod gear where applicable.
-- It can be manipulated directly by implementation of these functions or you can simply call ConfigureWeaponLock into your player or job file.

-- ModDescription is the description of the mod that will show up in the ControlPanel
-- ControlPanelDisplay should be a true or false value indicating if you want it to display in the ControlPanel
-- ModKeyBind should be a string that represents a key you want to use to cycle WeaponLock
-- Example: ConfigureDefensePriority("DefensePrio", true, "f11")
function ConfigureDefensePriority(ModDescription, ControlPanelDisplay, ModKeyBind)
	ModifyMod(MOD_PRIORITIZE_DEFENSE, ModDescription, ControlPanelDisplay, ModKeyBind)
end

function CycleDefensePriority()
	_G[MOD_VALUES_ROOT_NAME][MOD_PRIORITIZE_DEFENSE]:cycle()
end

function GetModDefensePriority()
	return GetModValue(MOD_PRIORITIZE_DEFENSE, true)
end