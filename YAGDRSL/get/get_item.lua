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

function GetItemAmmoType(ItemID)
	local AmmoType = WINDOWER_RESOURCES.items[ItemID]["ammo_type"]

	local AutomatonOils =
		{
			[18731] = true,
			[18732] = true,
			[18733] = true,
			[19185] = true
		}

	if AmmoType then
		return AmmoType
	elseif AutomatonOils[ItemID] then
		return "Oil"
	else
		return nil
	end

end

function GetItemRangeType(ItemID)
	local RangeType = WINDOWER_RESOURCES.items[ItemID]["range_type"]

	local Animators =
		{
			[17857] = true,
			[17858] = true,
			[17859] = true,
			[17923] = true,
			[21392] = true,
			[21433] = true,
			[21453] = true,
			[21454] = true,
			[21456] = true,
			[21457] = true,
			[21458] = true,
			[21459] = true,
			[22260] = true,
			[21375] = true
		}

	if RangeType then
		return RangeType
	elseif Animators[ItemID] then
		return "Animator"
	else
		return nil
	end

end