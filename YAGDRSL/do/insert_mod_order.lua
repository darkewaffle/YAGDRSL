require "YAGDRSL/get/mods/get_mod_exists.lua"

function InsertIntoModOrder(ModOrderName, ResetList, ...)

	if ResetList then
		_G[MOD_ORDER_CONTAINER][ModOrderName] = {}
	end

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

function SetModOrder(ModOrderName, ...)
	InsertIntoModOrder(ModOrderName, true, ...)
end

function AppendModOrder(ModOrderName, ...)
	InsertIntoModOrder(ModOrderName, false, ...)
end

function AppendModOrderToOrderList(OrderList, ...)
	for _, ModOrderName in ipairs(OrderList) do
		AppendModOrder(ModOrderName, ...)
	end
end

function AppendModOrderOffense(...)
	local ModOrderList = GetModOrderListOffense()
	AppendModOrderToOrderList(ModOrderList, ...)
end

function AppendModOrderDefense(...)
	local ModOrderList = GetModOrderListDefense()
	AppendModOrderToOrderList(ModOrderList, ...)
end

function AppendModOrderClass(ModClass, ...)
	local ModOrderList = GetModOrderList(ModClass)
	AppendModOrderToOrderList(ModOrderList, ...)
end