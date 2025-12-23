require "YAGDRSL/do/create_mod.lua"

-- @User
function CreateOverride(OverrideDescription, ControlPanelDisplay, OverrideKeyBind, ...)
	CreateMod(OVERRIDE_VALUES_ROOT_NAME, OverrideDescription, ControlPanelDisplay, OverrideKeyBind, ...)
end