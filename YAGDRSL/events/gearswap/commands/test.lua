function SelfCommandTest1()
	ChatCheckpoint("Command Test 1 Start")

	local ExtDataLibrary = require "extdata"

	local WarpRingID = 28540
	local WarpRingItem = {}
	local WarpRingStatus = {}

	local SearchContainers =
		{
			-- Inventory and all 8 wardrobes
			0, 8, 10, 11, 12, 13, 14, 15, 16
		}

	-- Iterate through inventory and wardrobes, get the items and if they are armor then put them into ArmorItems.
	for _, ContainerIndex in pairs(SearchContainers) do

		local ContainerItems = windower.ffxi.get_items(ContainerIndex)
		for _, Item in ipairs(ContainerItems) do
			if Item.id == WarpRingID then
				WarpRingItem = Item
				break
			end
		end
	end

	if WarpRingItem.extdata then
		WarpRingStatus = ExtDataLibrary.decode(WarpRingItem)
		ChatError("Warp Ring Reuse Time", WarpRingStatus["next_use_time"])
		ChatError("Warp Ring Reuse Date", os.date("%c", WarpRingStatus["next_use_time"]))
	end

	ChatCheckpoint("Command Test 1 End")
end

function SelfCommandTest2()
	ChatCheckpoint("Command Test 2 Start")

	ChatCheckpoint("Command Test 2 End")
end