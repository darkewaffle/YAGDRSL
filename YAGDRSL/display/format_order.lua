require "YAGDRSL/do/modify_strings.lua"
require "YAGDRSL/display/format_mod.lua"
require "YAGDRSL/get/mods/get_mod_value.lua"

function GetFormattedModOrders(OrderList)

	local DisplayContents = ""
	local ModOrderHeaderText = ""
	local ModOrderValuesText = ""
	local DebugModOrderColumnWidth = 20

	-- Order list is a container that holds a grouping of mod order names. 
	for Index, OrderName in ipairs(OrderList) do

		-- Get the ModOrder table from the OrderName
		local ModOrder = _G[MOD_ORDER_CONTAINER][OrderName]
		ModOrderHeaderText = OrderName .. "\n"
		ModOrderValuesText = ""

		-- If the ModOrder has values in it, proceed.
		if next(ModOrder) then

			for _, ModName in ipairs(ModOrder) do

				local ModValue = GetModValue(ModName, true)

				-- Trims the "Tracking_" prefix from tracker mods so they take up less space in the debug display.
				if string.sub(ModName, 1, 9) == "Tracking_" then
					ModName = string.sub(ModName, 10, #ModName)
				end

				if ModValue and ModValue ~= MOD_DEFAULT_OFF then
					ModValue = "**" .. ModValue .. "**"
				end

				ModOrderHeaderText = ModOrderHeaderText .. SetStringWidth(ModName, DebugModOrderColumnWidth)
				ModOrderValuesText = ModOrderValuesText .. SetStringWidth(ModValue, DebugModOrderColumnWidth)
			end

			-- Newline to separate the headers and values and then two newlines to place a blank line between this text and the next mod order results appended to it.
			DisplayContents = DisplayContents .. ModOrderHeaderText .. "\n" .. ModOrderValuesText .. "\n" .. "\n"
		end
	end

	return DisplayContents
end

function GetFormattedModOrdersOffense()
	return GetFormattedModOrders(_G[MOD_ORDER_LIST_OFFENSE])
end

function GetFormattedModOrdersDefense()
	return GetFormattedModOrders(_G[MOD_ORDER_LIST_DEFENSE])
end