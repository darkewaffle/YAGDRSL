require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/do/modify_strings.lua"

local GearIndex = {
	[1] = {"main"},
	[2] = {"sub"},
	[3] = {"range", "ranged"},
	[4] = {"ammo"},
	[5] = {"head"},
	[6] = {"neck"},
	[7] = {"left_ear",  "ear1", "lear", "learring"},
	[8] = {"right_ear", "ear2", "rear", "rearring"},
	[9] = {"body"},
	[10] = {"hands"},
	[11] = {"left_ring",  "ring1", "lring"},
	[12] = {"right_ring", "ring2", "rring"},
	[13] = {"back"},
	[14] = {"waist"},
	[15] = {"legs"},
	[16] = {"feet"}
}

function ChatGearSet(GearSet, Source, ShowEmptySlots)

	if not next(GearSet) then
		--ChatSet(Source, "set is empty")

	else
		ChatDashLine(Source)
		--ChatSet("Source =", Source)
		local LineText = ""
		local FoundSlots = 0
		local ItemsInSet = 0

		for _, _ in pairs(GearSet) do
			ItemsInSet = ItemsInSet + 1
		end
		local ShowEmptySlots = ShowEmptySlots or ItemsInSet > 8

		for Key, SlotLabels in ipairs(GearIndex) do

			local SlotIsFound = false
			local SlotText = SlotLabels[1] .. "="

			for i=1, #SlotLabels do
				if GearSet[SlotLabels[i]] then

					SlotIsFound = true
					FoundSlots = FoundSlots + 1

					local ItemName = ""
					if type(GearSet[SlotLabels[i]]) == "string" then
						ItemName = GearSet[SlotLabels[i]]
					elseif type(GearSet[SlotLabels[i]]) == "table" then
						ItemName = GearSet[SlotLabels[i]]["name"]
					else
						ItemName = "Undefined"
					end

					SlotText = SlotText .. ItemName
					break
				end
			end

			if SlotIsFound or ShowEmptySlots then
				-- Bad but good enough attempt to account for character width and keep each equipment slot relatively evenly spaced out
				local AdjustedSlotWidth = _G[YAG_SETTINGS]["GearSetChatSlotWidth"] + math.max(0, (6 - math.floor(#SlotText * .25)))
				SlotText = SetStringWidth(SlotText, AdjustedSlotWidth)
				LineText = LineText .. SlotText
			end

			-- When displaying empty slots this ensures that all slots count as being found.
			if ShowEmptySlots then
				FoundSlots = Key
			end

			if (FoundSlots > 0 and FoundSlots % 4 == 0) or (FoundSlots > 0 and Key == 16) or (ShowEmptySlots and Key == 16) then
				ChatSet(LineText)
				LineText = ""
				FoundSlots = 0
			end
		end
	--ChatDashLine()
	end
end

function ChatGearSetCrude(GearSet)
	for Slot, Item in pairs(GearSet) do
		ChatSet(Slot, Item)
	end
end

function ChatSpellAttributes(SpellAttributes)
	ChatDebugForced("Name",        SpellAttributes["Name"])
	ChatDebugForced("Category",    SpellAttributes["Category"])
	ChatDebugForced("Class",       SpellAttributes["Class"])
	ChatDebugForced("Skill",       SpellAttributes["Skill"])
	ChatDebugForced("ParentGroup", SpellAttributes["ParentGroup"])
	ChatDebugForced("ChildGroup" , SpellAttributes["ChildGroup"])

	ChatDebugForced("TargetSymbol",      SpellAttributes["TargetSymbol"])
	ChatDebugForced("TargetID",          SpellAttributes["TargetID"])
	ChatDebugForced("TargetPrimary",     SpellAttributes["TargetPrimary"])
	ChatDebugForced("TargetFriendEnemy", SpellAttributes["TargetFriendEnemy"])
	ChatDebugForced("TargetHPDecimal",   SpellAttributes["TargetHPDecimal"])
	ChatDebugForced("TargetSelf",        SpellAttributes["TargetSelf"])
	ChatDebugForced("TargetParty",       SpellAttributes["TargetParty"])
	ChatDebugForced("TargetAlly",        SpellAttributes["TargetAlly"])
	ChatDebugForced("TargetPlayer",      SpellAttributes["TargetPlayer"])
	ChatDebugForced("TargetNPC",         SpellAttributes["TargetNPC"])
	ChatDebugForced("TargetEnemy",       SpellAttributes["TargetEnemy"])

	ChatDebugForced("DamageType",  SpellAttributes["DamageType"])
	ChatDebugForced("WSRange",     SpellAttributes["WSRange"])
	ChatDebugForced("RecastID",    SpellAttributes["RecastID"])

	ChatDebugForced("Element",               SpellAttributes["Element"])
	ChatDebugForced("Element=Weather",       SpellAttributes["Element=Weather"])
	ChatDebugForced("ElementOpposesWeather", SpellAttributes["ElementOpposesWeather"])
	ChatDebugForced("Element=Day",           SpellAttributes["Element=Day"])
	ChatDebugForced("ElementOpposesDay",     SpellAttributes["ElementOpposesDay"])

	ChatDebugForced("MagicBurstLikely",      SpellAttributes["MagicBurstLikely"])

	ChatDebugForced("SpellIgnoresWeaponLock", SpellAttributes["IgnoreWeaponLock"])
end

function ChatTableKeysAsMessage(ChatTable)
	if ChatTable then
		for Key, Value in pairs(ChatTable) do
			ChatMessage(Key)
		end
	end
end

function ChatTableValuesAsMessage(ChatTable)
	if ChatTable then
		for Key, Value in pairs(ChatTable) do
			ChatMessage(Value)
		end
	end
end

function ChatTableMessage(ChatTable)
	local Iterator = 1
	if ChatTable then
		for Key, Value in pairs(ChatTable) do
			ChatMessage("#" .. tostring(Iterator) .. ": " .. Key, Value)
			Iterator = Iterator + 1
		end
	end
end

function ChatTableDebug(ChatTable)
	if ChatTable then
		for Key, Value in pairs(ChatTable) do
			ChatDebug(Key, Value)
		end
	end
end