require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/get/mods/get_mod_value.lua"

-- Wrapper function that will only submit a set to equip if the set has items in it.
-- Equip probably already does this but better safe than sorry.
-- More importantly the SwapEarrings and SwapRings logic is a bugfix to address slots sometimes becoming 'locked' to GearSwap
-- when ring A is equipped in Ring1 slot ingame but an equip request is sent that tells the game to put it in Ring2.
-- EvaluateAmmo will check if the ammo in the gearset is compatible with the ranged weapon in the gearset or equipped by the character with priority given to the gearset.
-- If the ammo would cause the range item to be unequipped then the ammo will be removed from the gearset.

function EquipSafe(GearSet, Message, IgnoreWeaponLock)
	if next(GearSet) then
		ChatCheckpointLogged("Equip Gear From", Message)

		if not IgnoreWeaponLock then
			GearSet = WeaponLock(GearSet)
		end

		if _G[YAG_SETTINGS]["ProtectRangeFromWrongAmmo"] then
			GearSet = EvaluateAmmo(GearSet)
		end

		GearSet = SwapEarrings(GearSet)
		GearSet = SwapRings(GearSet)
		equip(GearSet)
	else
		ChatDebug("Empty set not submitted for equip from:", Message)
	end
end

function SwapEarrings(GearSet)
	local PlayerEar1 = player.equipment.left_ear
	local PlayerEar2 = player.equipment.right_ear

	local Ear1SlotLabels = {"left_ear", "ear1", "lear", "learring"}
	local Ear2SlotLabels= {"right_ear", "ear2", "rear", "rearring"}

	local GearSetEar1 = {Label="", Name=""}
	local GearSetEar2 = {Label="", Name=""}

	-- Identify which key value is used for ear1 in the gearset.
	for Index, EarSlotLabel in ipairs(Ear1SlotLabels) do
		if GearSet[EarSlotLabel] then
			GearSetEar1["Label"] = EarSlotLabel
			GearSetEar1["Name"] = GearSet[EarSlotLabel]
		end
	end

	-- Identify which key value is used for ear2 in the gearset.
	for Index, EarSlotLabel in ipairs(Ear2SlotLabels) do
		if GearSet[EarSlotLabel] then
			GearSetEar2["Label"] = EarSlotLabel
			GearSetEar2["Name"] = GearSet[EarSlotLabel]
		end
	end

	-- Check if the earring assigned to ear1 is the same as the earring equipped in ear2
	-- or if the earring assigned to ear2 is the asme as the earring equipped in ear1.
	-- If so, swap them.
	if (GearSetEar1["Name"] == PlayerEar2) or (GearSetEar2["Name"] == PlayerEar1) then
		ChatDebug("GearSet Ear1 " .. GearSetEar1["Name"] .. " =", "Equipped Ear2 " .. PlayerEar2)
		ChatDebug("OR")
		ChatDebug("GearSet Ear2 " .. GearSetEar2["Name"] .. " =", "Equipped Ear1 " .. PlayerEar1)
		ChatDebug("GearSet earrings will be swapped")
		GearSet[GearSetEar1["Label"]] = GearSetEar2["Name"]
		GearSet[GearSetEar2["Label"]] = GearSetEar1["Name"]
	end

	return GearSet
end

function SwapRings(GearSet)
	-- See SwapEarrings for explanatory comments. They're identical.
	local PlayerRing1 = player.equipment.left_ring
	local PlayerRing2 = player.equipment.right_ring

	local Ring1SlotLabels = {"left_ring",  "ring1", "lring"}
	local Ring2SlotLabels = {"right_ring", "ring2", "rring"}

	local GearSetRing1 = {Label="", Name=""}
	local GearSetRing2 = {Label="", Name=""}

	for Index, RingSlotLabel in ipairs(Ring1SlotLabels) do
		if GearSet[RingSlotLabel] then
			GearSetRing1["Label"] = RingSlotLabel
			GearSetRing1["Name"] = GearSet[RingSlotLabel]
		end
	end

	for Index, RingSlotLabel in ipairs(Ring2SlotLabels) do
		if GearSet[RingSlotLabel] then
			GearSetRing2["Label"] = RingSlotLabel
			GearSetRing2["Name"] = GearSet[RingSlotLabel]
		end
	end

	if (GearSetRing1["Name"] == PlayerRing2) or (GearSetRing2["Name"] == PlayerRing1) then
		ChatDebug("GearSet Ring1 " .. GearSetRing1["Name"] .. " =", "Equipped Ring2 " .. PlayerRing2)
		ChatDebug("OR")
		ChatDebug("GearSet Ring2 " .. GearSetRing2["Name"] .. " =", "Equipped Ring1 " .. PlayerRing1)
		ChatDebug("GearSet rings will be swapped")
		GearSet[GearSetRing1["Label"]] = GearSetRing2["Name"]
		GearSet[GearSetRing2["Label"]] = GearSetRing1["Name"]
	end

	return GearSet
end

function WeaponLock(GearSet)
	local MapLockToSlots =
	{
		[MOD_LOCK_ALL] = {"main", "sub", "range", "ranged", "ammo"},
		[MOD_LOCK_MAIN_SUB_AMMO] = {"main", "sub", "ammo"},
		[MOD_LOCK_MAIN_SUB_RANGE] = {"main", "sub", "range", "ranged"},
		[MOD_LOCK_MAIN_SUB] = {"main", "sub"},
		[MOD_LOCK_RANGE_AMMO] = {"range", "ranged", "ammo"}
	}

	local LockState = GetModWeaponLock()

	if LockState and MapLockToSlots[LockState] then
		for _, SlotName in pairs(MapLockToSlots[LockState]) do
			GearSet[SlotName] = nil
		end
	end

	return GearSet
end

function EvaluateAmmo(GearSet)
	local MapAmmoToRange =
	{
		["Arrow"]    = "Bow",
		["Bait"]     = "Fishing Rod",
		["Bolt"]     = "Crossbow",
		["Bullet"]   = "Gun",
		["Oil"]      = "Animator",
		["Shell"]    = "Cannon"
	}

	local MapRangeToAmmo =
	{
		["Animator"]    = "Oil",
		["Bow"]         = "Arrow",
		["Cannon"]      = "Shell",
		["Crossbow"]    = "Bolt",
		["Gun"]         = "Bullet",
		["Fishing Rod"] = "Bait"
	}


	-- If the gearset does not contain ammo then return.
	if not GearSet["ammo"] then
		return GearSet
	end


	local RangeID = 0
	local ItemsEquipped = GetCharacterEquipment()
	local GearsetRangeName = GearSet["range"] or GearSet["ranged"]


	-- Gearset contains a range item
	if GearsetRangeName then
		RangeID = GetItemID(RangeName)

	-- Character has range item equipped
	elseif ItemsEquipped["range"] > 0 then
		RangeID = windower.ffxi.get_items(ItemsEquipped["range_bag"], ItemsEquipped["range"])["id"]

	-- Gearset has no range item and a range item is not equipped, return as ammo cannot have side effects
	else
		return GearSet
	end


	local RangeType = GetItemRangeType(RangeID)
	local AmmoName = GearSet["ammo"]
	local AmmoID = GetItemID(AmmoName)
	local AmmoType = GetItemAmmoType(AmmoID)

	if not MapRangeToAmmo[RangeType] or MapRangeToAmmo[RangeType] ~= AmmoType then
		GearSet["ammo"] = nil
	end


	return GearSet
end