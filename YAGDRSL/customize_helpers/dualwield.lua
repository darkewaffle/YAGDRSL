require "YAGDRSL/get/get_dualwield.lua"
require "YAGDRSL/get/get_haste.lua"

function CustomizeDualWield(GearSet, DualWieldToAdd)
	local DualWieldSetAmounts = {}
	local SelectedDualWieldSet = 0

	-- Get the keys from DualWield table which should correspond to the amount of dualwield each set provides
	for DualWieldAmount, _ in pairs(DualWield) do
		table.insert(DualWieldSetAmounts, DualWieldAmount)
	end

	-- Sort dualwield provided by each set from highest to lowest 
	table.sort(DualWieldSetAmounts, SortDescending)

	-- Iterate through dualwield values to find the highest set where DualWieldToAdd is greater than or equal to the Dual Wield provided by the set
	-- This means that if there are sets providing 10 and 20 dualwield and the desired amount is 15 then the set providing 10 will be selected
	for _, DualWieldValue in ipairs(DualWieldSetAmounts) do
		if DualWieldToAdd >= DualWieldValue then
			SelectedDualWieldSet = DualWieldValue
			break
		end
	end

	GearSet = set_combine(GearSet, DualWield[SelectedDualWieldSet])
	return GearSet
end

function SortDescending(ValueA, ValueB)
	return ValueA > ValueB
end