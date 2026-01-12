require "YAGDRSL/do/modify_mod.lua"
require "YAGDRSL/get/mods/get_mod_value.lua"

-- @User
-- These functions allow the user to manipulate the built in Locked Weapons modifier
-- The value selected by this mod will not affect how the gearset is created but instead it will determine which, if any, slots are removed from the gearset before it is equipped.
-- It can be manipulated directly by implementation of these functions or you can simply call ConfigureWeaponLock in your player or job file.

-- ModDescription is the description of the mod that will show up in the ControlPanel
-- ControlPanelDisplayOrder should be a numeric value that controls the order that the mod will be displayed in the Control Panel. If <= 0 then it will not be displayed.
-- ModKeyBind should be a string that represents a key you want to use to cycle WeaponLock
-- Example: ConfigureWeaponLock("DisabledWeps", true, "f12")
function ConfigureWeaponLock(ModDescription, ControlPanelDisplayOrder, ModKeyBind)
	ModifyMod(MOD_LOCK_WEAPONS, ModDescription, ControlPanelDisplayOrder, ModKeyBind)
end

function CycleWeaponLock()
	_G[MOD_VALUES_ROOT_NAME][MOD_LOCK_WEAPONS]:cycle()
end

function SetWeaponLock(Value)
	local ValidLockStates =
	{
		[MOD_LOCK_ALL] = true,
		[MOD_LOCK_MAIN_SUB_RANGE] = true,
		[MOD_LOCK_MAIN_SUB] = true,
		[MOD_LOCK_RANGE_AMMO] = true
	}

	if ValidLockStates[Value] then
		SetModValue(MOD_LOCK_WEAPONS, Value)
	else
		ChatError("Invalid weapon lock state submitted to SetWeaponLock")
	end
end

function SetWeaponLockAll()
	SetWeaponLock(MOD_LOCK_ALL)
end

function SetWeaponLockMainSubRange()
	SetWeaponLock(MOD_LOCK_MAIN_SUB_RANGE)
end

function SetWeaponLockMainSub()
	SetWeaponLock(MOD_LOCK_MAIN_SUB)
end

function SetWeaponLockRangeAmmo()
	SetWeaponLock(MOD_LOCK_RANGE_AMMO)
end

function GetModWeaponLock()
	return GetModValue(MOD_LOCK_WEAPONS, false)
end