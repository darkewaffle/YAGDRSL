require "YAGDRSL/mappings/constructed/items.lua"

function GetItemName(ItemID)
	return WINDOWER_RESOURCES.items[ItemID].en
end

function GetItemNameLong(ItemID)
	return WINDOWER_RESOURCES.items[ItemID].enl
end

function GetItemCategory(ItemID)
	return WINDOWER_RESOURCES.items[ItemID].category
end

function GetItemEquippable(ItemID)
	local ItemCategory = GetItemCategory(ItemID)
	if ItemCategory == "Armor" or ItemCategory == "Weapon" then
		return true
	else
		return false
	end
end

function GetItemIsWeapon(ItemID)
	local ItemCategory = GetItemCategory(ItemID)
	local ShieldSize = WINDOWER_RESOURCES.items[ItemID]["shield_size"]

	if ShieldSize or ItemCategory == "Weapon" then
		return true
	else
		return false
	end
end

function GetItemIsArmor(ItemID)
	local ItemCategory = GetItemCategory(ItemID)

	if ItemCategory == "Armor" then
		return true
	else
		return false
	end
end

function GetItemID(ItemName)
	CreateResourceEquipmentNames()
	ItemName = string.lower(ItemName)
	return _G[MAP_EQUIPMENT_NAMES][ItemName]
end

function GetItemIsRare(ItemID)
	if WINDOWER_RESOURCES.items[ItemID] then
		return WINDOWER_RESOURCES.items[ItemID].flags.Rare or false
	else
		return false
	end
end