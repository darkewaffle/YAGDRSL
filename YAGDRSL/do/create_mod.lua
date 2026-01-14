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
		TrackKeyBind(CycleKeyBind, ModName)
	end
end


-- @User
-- Sets the current value of the mod. Useful when you want to define a specific default active value for a mod or changing a mod value within custom code.

function SetModValue(ModName, Value)
	_G[MOD_VALUES_ROOT_NAME][ModName]:set(Value)
end


-- @User
-- Redefines the options in a mod. This can be useful when creating mods in the character file but then re-defining the options in a job file.

function AssignModOptions(ModName, ...)
	if _G[MOD_VALUES_ROOT_NAME][ModName] then
		local PreviousDescription = _G[MOD_VALUES_ROOT_NAME][ModName]["description"]
		_G[MOD_VALUES_ROOT_NAME][ModName] = M{MOD_DEFAULT_OFF, ...}
		_G[MOD_VALUES_ROOT_NAME][ModName]:describe(PreviousDescription)
	else
		ChatError("Mod name does not exist", ModName)
	end
end

-- @User
-- Deletes a mod. This can be useful when a generic mod in the character file doesn't apply to a specific job.
-- This function will automatically remove the mod from all mod orders and unbind the key that cycles it (if applicable).

function DeleteMod(ModName)
	_G[MOD_VALUES_ROOT_NAME][ModName] = nil

	ClearTrackedKeyFromSource(ModName)

	for Index, ModDetails in ipairs(_G[MOD_ORDER_CONTROL_PANEL]) do
		if ModDetails.Name == ModName then
			table.remove(_G[MOD_ORDER_CONTROL_PANEL], Index)
			break
		end
	end

	for _, OrderList in pairs(_G[MOD_ORDER_CONTAINER]) do
		for Index, ModOrderMod in ipairs(OrderList) do
			if ModOrderMod == ModName then
				table.remove(OrderList, Index)
				break
			end
		end
	end

end