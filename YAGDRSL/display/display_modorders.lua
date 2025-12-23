require "texts"
require "YAGDRSL/display/format_order.lua"

local DisplayModOrders = {}

function InitializeDisplayModOrders()
	local DisplayContents = GetDisplayModOrdersContents()

	local DisplaySettings = GetControlPanelSettings()
	DisplaySettings.pos.x = 100
	DisplaySettings.pos.y = 100
	DisplaySettings.text.size = 10
	DisplaySettings.padding = 2

	DisplayModOrders = texts.new(DisplayContents, DisplaySettings)
	DisplayModOrders:visible(true)
end

function UpdateDisplayModOrders()
	local DebugOrderOffense = GetFormattedModOrdersOffense()
	local DebugOrderDefense = GetFormattedModOrdersDefense()
	local CPContents = DebugOrderOffense .. DebugOrderDefense
	DisplayModOrders:text(CPContents)
end

function GetDisplayModOrdersContents()
	return GetFormattedModOrdersOffense() .. GetFormattedModOrdersDefense()
end

function DestroyDisplayModOrders()
	DisplayModOrders:visible(false)
	DisplayModOrders = {}
end