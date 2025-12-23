--@@require "YAGDRSL/events/gearswap/commands/validate/get_items_equipment.lua"
--@@require "YAGDRSL/events/gearswap/commands/validate/get_augment.lua"
--@@require "YAGDRSL/get/get_item.lua"
--@@require "YAGDRSL/do/send_game_command.lua"

local ExtDataLibrary = require "extdata"
local UsableRings = {}
local UseRing = ""
local UseRingSlot = ""

local Rings_XP =
	{
		-- Rings that are no longer attainable are commented out.
		{id=27556, name="Echad Ring"},
		{id=26164, name="Caliber Ring"},
		{id=14671, name="Allied Ring"},
		{id=15840, name="Kupofried's Ring"},
		--{id=28569, name="Expertise Ring"},
		{id=28568, name="Resolution Ring"},
		{id=15763, name="Emperor Band"},
		{id=15762, name="Empress Band"},
		{id=15761, name="Chariot Band"},
		--{id=28562, name="Duodecennial Ring"},
		--{id=28528, name="Undecennial Ring"},
		--{id=10796, name="Decennial Ring"},
		--{id=15793, name="Anniversary Ring"},
		--{id=11666, name="Novennial Ring"},
	}

local Rings_CP =
	{
		{id=28469, name="Endorsement Ring"},
		{id=27557, name="Trizek Ring"},
		{id=26165, name="Facility Ring"},
		{id=28546, name="Capacity Ring"},
		{id=28563, name="Vocation Ring"}
	}


function SelfCommandRing(CommandInputs)
	ChatCheckpoint("Auto-ring starting")

	local CPFeatures = {["list"]=Rings_CP, ["buff"]="Commitment"}
	local XPFeatures = {["list"]=Rings_XP, ["buff"]="Dedication"}

	local MapRingType =
	{
		["c"] = CPFeatures, ["cp"] = CPFeatures, ["cap"] = CPFeatures,
		["x"] = XPFeatures, ["xp"] = XPFeatures, ["exp"] = XPFeatures
		
	}

	local MapRingSlot =
	{
		[1] = "left_ring", ["r1"] = "left_ring", ["left_ring"] = "left_ring", ["l"] = "left_ring", ["left"] = "left_ring", ["lring"] = "left_ring",
		[2] = "right_ring", ["r2"] = "right_ring", ["right_ring"] = "right_ring", ["r"] = "right_ring", ["right"] = "right_ring", ["rring"] = "right_ring"
	}
	
	local RingsToFind = MapRingType[CommandInputs[1]].list
	local BuffToCheck = MapRingType[CommandInputs[1]].buff
	local EquipSlot = MapRingSlot[CommandInputs[2]] or "left_ring"

	if buffactive[BuffToCheck] then
		ChatDebug("XP/CP buff found. Canceling ring use.")
		return
	end

	if RingsToFind then
		local UsableRing = FindUsableRing(RingsToFind)
		
		if UsableRing then
			local UsableRingName = GetItemName(UsableRing)
			EquipRingAndScheduleUse(UsableRingName, EquipSlot)
		else
			ChatNotice("No rings can be used right now.")
			return
		end

	else
		local BadInput = CommandInputs[1] or "please input a ring type (xp/cp)"
		ChatError("Invalid ring type input: " .. BadInput or "")
		return
	end
end



function FindUsableRing(RingsToFind)

	local UseThisRing = 0
	local ArmorItems = {}
	local SearchContainers =
		{
			-- Inventory and all 8 wardrobes
			0, 8, 10, 11, 12, 13, 14, 15, 16
		}

	-- Iterate through inventory and wardrobes, get the items and if they are armor then put them into ArmorItems.
	for _, ContainerIndex in pairs(SearchContainers) do

		local ContainerItems = windower.ffxi.get_items(ContainerIndex)
		for _, Item in ipairs(ContainerItems) do
			if Item.id > 0 and GetItemIsArmor(Item.id) then
				table.insert(ArmorItems, Item)
			end
		end

	end

	-- Create a list of ring IDs from the RingsToFind list that are present in inventory and able to be used.
	local UsableRingIDs = FindUsableRingsInContainer(ArmorItems, RingsToFind)

	-- Iterate through RingData with ipairs (which forces it to go in order - Rings_CP and Rings_XP are in priority order)
	-- and look for the first ring in RingsToFind that exists in the UsableRingIDs list
	for _, RingData in ipairs(RingsToFind) do
		if UsableRingIDs[RingData.id] then
			UseThisRing = RingData.id
			break
		end
	end

	if UseThisRing and UseThisRing > 0 then
		return UseThisRing
	else
		return nil
	end
end

function FindUsableRingsInContainer(ContainerItems, RingsToFind)

	local UsableRingIDs = {}
	for Index, Item in ipairs(ContainerItems) do
		if GetItemIsUsableRing(Item, RingsToFind) then
			UsableRingIDs[Item.id] = true
		end
	end
	return UsableRingIDs
end

function GetItemIsUsableRing(Item, RingsToFind)
	for _, RingData in ipairs(RingsToFind) do
		if Item.id == RingData.id then
			local RingStatus = GetRingStatus(Item)

			-- Genuinely this is, to me, the most confusing line of code in this entire project. I copied it. It works. I don't know why.
			-- next_use_time being timezone adjusted makes no sense to me.
			local TimeToReuse = os.time(os.date("!*t", RingStatus["next_use_time"])) - os.time()

			if RingStatus["charges_remaining"] > 0 and TimeToReuse <= 0 then
				return true
			end
		end
	end

	return false
end

function GetRingStatus(Item)
	local NoExtdata = string.char(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
	local StatusTable = {}

	if Item.extdata ~= NoExtdata then
		StatusTable = ExtDataLibrary.decode(Item)
	end

	return StatusTable
end

function EquipRingAndScheduleUse(RingName, RingSlot)
	ChatNotice("Using ring", RingName)
	UseRing = RingName
	UseRingSlot = RingSlot

	local RingSet = {[RingSlot] = RingName}

	EquipSafe(RingSet, "Automatic XP/CP Ring Usage")
	disable(UseRingSlot)
	coroutine.schedule(RingUsage, 6)
end

function RingUsage()
	local Command = '/item "' .. UseRing .. '" <me>'
	SendGameItem(UseRing, "<me>")
	coroutine.schedule(RingUsageCleanup, 3)
end

function RingUsageCleanup()
	enable(UseRingSlot)
	UseRing = ""
	UseRingSlot = ""
	ChatCheckpoint("Auto-ring complete")
end