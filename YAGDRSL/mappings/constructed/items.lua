-- Creates a table of {["ItemName_en"]=ItemIndex, ["ItemName_enl"]=BuffIndex} useful for simple validation of ItemNames.

function CreateResourceItemNamesAsKeys(...)
	local ApplyFilter = false
	local IncludeCategories = {...}
	local KeyedCategories = {}

	-- If category filters have been submitted then turn into key values in KeyedCategories.
	if IncludeCategories and #IncludeCategories > 0 then
		ApplyFilter = true
		for Index, IncludeCategory in pairs(IncludeCategories) do
			KeyedCategories[IncludeCategory] = true
		end
	end

	for ItemIndex, ItemProperties in pairs(WINDOWER_RESOURCES.items) do
		if ApplyFilter then

			-- If the results should only include specific categories (from IncludeCategories parameter) then check if ItemProperties.category exists in KeyedCategories.
			-- If yes, create the entries for the item. If not, move on.
			if KeyedCategories[ItemProperties.category] then
				_G[MAP_EQUIPMENT_NAMES][string.lower(ItemProperties.en)] = ItemIndex
				_G[MAP_EQUIPMENT_NAMES][string.lower(ItemProperties.enl)] = ItemIndex
			end
		else
			_G[MAP_EQUIPMENT_NAMES][string.lower(ItemProperties.en)] = ItemIndex
			_G[MAP_EQUIPMENT_NAMES][string.lower(ItemProperties.enl)] = ItemIndex
		end
	end
end

function CreateResourceWeaponNamesAsKeys()
	CreateResourceItemNamesAsKeys("Weapon")
end

function CreateResourceArmorNamesAsKeys()
	CreateResourceItemNamesAsKeys("Armor")
end

function CreateResourceEquipmentNames()
	if not MAP_EQUIPMENT_NAMES_POPULATED then
		CreateResourceItemNamesAsKeys("Weapon")
		CreateResourceItemNamesAsKeys("Armor")
		MAP_EQUIPMENT_NAMES_POPULATED = true
	end
end