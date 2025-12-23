require "YAGDRSL/do/create_key_bind.lua"

function ModifyMod(ModName, ModDescription, ControlPanelDisplay, CycleKeyBind)
	_G[MOD_VALUES_ROOT_NAME][ModName]:describe(ModDescription)

	if ControlPanelDisplay then
		table.insert(_G[MOD_ORDER_CONTROL_PANEL], ModName)
	end

	if CycleKeyBind then
		local CycleCommand = "gs c cycle " .. ModName
		BindKey(CycleKeyBind, CycleCommand)
		TrackKeyBind(CycleKeyBind)
	end
end