require "YAGDRSL/do/create_key_bind.lua"

function ModifyMod(ModName, ModDescription, ControlPanelDisplayOrder, CycleKeyBind)
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