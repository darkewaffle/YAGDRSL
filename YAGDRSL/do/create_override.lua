require "YAGDRSL/do/create_mod.lua"

-- @User
function ConfigureOverride(OverrideDescription, ControlPanelDisplayOrder, OverrideKeyBind, ...)
	CreateMod(OVERRIDE_VALUES_ROOT_NAME, OverrideDescription, ControlPanelDisplayOrder, OverrideKeyBind, ...)
end


function AssignOverrideOptions(...)
	AssignModOptions(OVERRIDE_VALUES_ROOT_NAME, ...)
end

function SetOverrideValue(Value)
	SetModValue(OVERRIDE_VALUES_ROOT_NAME, Value)
end