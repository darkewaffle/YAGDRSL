require "YAGDRSL/get/mods/get_mod_exists.lua"

function SetModOrder(ModOrderName, ...)
	_G[MOD_ORDER_CONTAINER][ModOrderName] = {}

	local ModOrderList = _G[MOD_ORDER_CONTAINER][ModOrderName]
	local ModsToInsert = {...}

	for _, ModName in ipairs(ModsToInsert) do
		if GetModExists(ModName) then
			table.insert(ModOrderList, ModName)
		else
			ChatError("Not Added To Mod Order(s) -", ModName)
		end
	end
end

function AppendModOrder(ModOrderName, ModName, Priority)
	local ModOrderList = _G[MOD_ORDER_CONTAINER][ModOrderName]
	local Position = 0

	if GetModExists(ModName) then

		if Priority == MOD_ORDER_PRIORITY_LOW then
			-- Puts the mod at the start of the order which will make it low priority
			Position = 1
		else
			-- Puts the mod at the end of the order which will make it high priority
			Position = nil
		end

		if Position and Position > 0 then
			table.insert(ModOrderList, Position, ModName)
		else
			table.insert(ModOrderList, ModName)
		end

	else
		ChatError("Not Added To Mod Order(s) -", ModName)
	end

end

function AppendModOrderToOrderList(OrderList, ModName, Priority)
	for _, ModOrderName in ipairs(OrderList) do
		AppendModOrder(ModOrderName, ModName, Priority)
	end
end

function AppendModOrderOffense(ModName, Priority)
	local ModOrderList = GetModOrderListOffense()
	AppendModOrderToOrderList(ModOrderList, ModName, Priority)
end

function AppendModOrderDefense(ModName, Priority)
	local ModOrderList = GetModOrderListDefense()
	AppendModOrderToOrderList(ModOrderList, ModName, Priority)
end

function AppendModOrderClass(ModClass, ModName, Priority)
	local ModOrderList = GetModOrderList(ModClass)
	AppendModOrderToOrderList(ModOrderList, ModName, Priority)
end