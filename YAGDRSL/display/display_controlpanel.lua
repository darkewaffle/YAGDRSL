require "texts"
require "YAGDRSL/display/format_mod.lua"
require "YAGDRSL/display/display_modorders.lua"

local ControlPanel = {}
local ControlPanelCreated = false

function InitializeControlPanel()
	local CPContents = GetControlPanelContents()
	ControlPanel = texts.new(CPContents, GetControlPanelSettings())
	ControlPanel:visible(_G[YAG_SETTINGS]["ControlPanelVisible"])
	ControlPanelCreated = true
end

function UpdateControlPanel()
	if ControlPanelCreated then
		local CPContents = GetControlPanelContents()
		ControlPanel:text(CPContents)
	end

	if STATE_DISPLAY_ORDER_DEBUG then
		UpdateDisplayModOrders()
	end
end

function GetControlPanelContents()
	local ControlPanelContents = ""

	SortControlPanelMods()

	-- The control panel displays the state of mod values.
	-- _G[MOD_ORDER_CONTROL_PANEL] is a table that will be populated with ModDetails values from user calls of CreateMod
	for Index, ModDetails in ipairs(_G[MOD_ORDER_CONTROL_PANEL]) do
		ControlPanelContents = ControlPanelContents .. FormatModForControlPanel(ModDetails.Name)
		
		-- Append a newline character when the mod is not the last mod in the list.
		if Index ~= #_G[MOD_ORDER_CONTROL_PANEL] then
			ControlPanelContents = ControlPanelContents .. "\n"
		end
	end

	return ControlPanelContents
end

function SortControlPanelMods()
	table.sort(_G[MOD_ORDER_CONTROL_PANEL], SortOrderComparison)
end

function SortOrderComparison(TableA, TableB)
	return TableA.Order < TableB.Order
end