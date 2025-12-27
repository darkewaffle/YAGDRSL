function GetEquipmentIDsInContainer(ContainerName)

	local InventoryIndexes =
		{
			["i"]=0, ["inv"]=0, ["inventory"]=0,
			["safe"]=1,
			["storage"]=2,
			["temporary"]=3,
			["locker"]=4,
			["satchel"]=5,
			["sack"]=6,
			["case"]=7,
			["w"]=8, ["wardrobe"]=8, ["wardrobe1"]=8,
			["safe 2"]=9,
			["w2"]=10, ["wardrobe 2"]=10, ["wardrobe2"]=10,
			["w3"]=11, ["wardrobe 3"]=11, ["wardrobe3"]=11,
			["w4"]=12, ["wardrobe 4"]=12, ["wardrobe4"]=12,
			["w5"]=13, ["wardrobe 5"]=13, ["wardrobe5"]=13,
			["w6"]=14, ["wardrobe 6"]=14, ["wardrobe6"]=14,
			["w7"]=15, ["wardrobe 7"]=15, ["wardrobe7"]=15,
			["w8"]=16, ["wardrobe 8"]=16, ["wardrobe8"]=16,
			["recycle"]=17
		}
	
	local ContainerName = string.lower(ContainerName)
	local ContainerIndex = InventoryIndexes[ContainerName]
	if not ContainerIndex then
		ChatError("GetEquipmentIDsInContainer: Invalid Container Index for", ContainerName)
		return
	end

	local ContainerObject = windower.ffxi.get_items(ContainerIndex)
	local ContainerIDList = _G[VALIDATION_ROOT_NAME][VALIDATION_CHARACTER_EQUIPMENT_IDS]

	for Index, Item in ipairs(ContainerObject) do

		-- windower.ffxi.get_items returns a list of inventory slots
		-- Item.id > 0 indicates an item, Item.id = 0 is empty
		-- GetItemEquippable returns true only for Weapons and Armor
		if Item.id > 0 and GetItemEquippable(Item.id) then
			local ItemID = Item.id
			local ItemAugment = GetAugmentString(Item)
			local ItemAugmentCode = EncodeAugmentString(ItemAugment)

			-- If the item is rare then augments don't matter as the character can only possess one of them
			if GetItemIsRare(ItemID) then
				ItemAugment = nil
				ItemAugmentCode = nil
			end

			if ContainerIDList[ItemID] then
				-- If ItemID is already in the list, just insert the augment data
				table.insert(ContainerIDList[ItemID][VALIDATION_ITEM_AUGMENTS], ItemAugment)
				table.insert(ContainerIDList[ItemID][VALIDATION_ITEM_AUGMENT_CODES], ItemAugmentCode)
			else
				-- If ItemID is not in the list create it and create the augment data table
				ContainerIDList[ItemID] = {[VALIDATION_ITEM_AUGMENTS]={ItemAugment}, [VALIDATION_ITEM_AUGMENT_CODES]={ItemAugmentCode}}
			end

		end
	end
end

function GetEquipmentIDsInInventory()
	GetEquipmentIDsInContainer("inventory")
end

function GetEquipmentIDsInWardrobe(WardrobeNumber)
	if WardrobeNumber and WardrobeNumber > 1 then
		WardrobeContainer = 'wardrobe' .. tostring(WardrobeNumber)
	else
		WardrobeContainer = 'wardrobe'
	end

	GetEquipmentIDsInContainer(WardrobeContainer)
end

function GetEquipmentIDsInWardrobeAll()
	for i = 1, 8 do
		GetEquipmentIDsInWardrobe(i)
	end
end

