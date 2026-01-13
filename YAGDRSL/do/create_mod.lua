require "YAGDRSL/do/create_key_bind.lua"
require "YAGDRSL/libraries/modes.lua"

-- @User
-- Wrapper function to make sure that mods follow an expected template for use with the library.
-- Also just makes it less of a hassle.

function CreateMod(ModName, ModDescription, ControlPanelDisplayOrder, CycleKeyBind, ...)	
	_G[MOD_VALUES_ROOT_NAME][ModName] = M{MOD_DEFAULT_OFF, ...}
	_G[MOD_VALUES_ROOT_NAME][ModName]:describe(ModDescription)

	if ControlPanelDisplayOrder > 0 then
		table.insert(_G[MOD_ORDER_CONTROL_PANEL], {["Name"]=ModName, ["Order"]=ControlPanelDisplayOrder})
	end

	if CycleKeyBind then
		local CycleCommand = "gs c cycle " .. ModName
		BindKey(CycleKeyBind, CycleCommand)
		-- Records the bound keys for mods so they can be unbound later during unload.
		TrackKeyBind(CycleKeyBind)
	end
end

function SetModValue(ModName, Value)
	_G[MOD_VALUES_ROOT_NAME][ModName]:set(Value)
end

function AssignModOptions(ModName, ...)
	if _G[MOD_VALUES_ROOT_NAME][ModName] then
		local PreviousDescription = _G[MOD_VALUES_ROOT_NAME][ModName]["description"]
		_G[MOD_VALUES_ROOT_NAME][ModName] = M{MOD_DEFAULT_OFF, ...}
		_G[MOD_VALUES_ROOT_NAME][ModName]:describe(PreviousDescription)
	else
		ChatError("Mod name does not exist", ModName)
	end
end