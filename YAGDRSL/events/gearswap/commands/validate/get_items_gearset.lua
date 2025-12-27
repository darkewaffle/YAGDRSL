function GetItemNamesInRootTable(RootObject)

	local ValidGearSlots =
		{
			["main"] = true,
			["sub"] = true,
			["range"] = true, ["ranged"] = true,
			["ammo"] = true,
			["head"] = true,
			["neck"] = true,
			["left_ear"] = true,  ["ear1"] = true, ["lear"] = true, ["learring"] = true,
			["right_ear"] = true, ["ear2"] = true, ["rear"] = true, ["rearring"] = true,
			["body"] = true,
			["hands"] = true,
			["left_ring"] = true,  ["ring1"] = true, ["lring"] = true,
			["right_ring"] = true, ["ring2"] = true, ["rring"] = true,
			["back"] = true,
			["waist"] = true,
			["legs"] = true,
			["feet"] = true
		}

	local ItemNameList = _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_ITEMS]
	local UnidentifiedSlots = _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_INVALID_SLOTS]

	for Key, Value in pairs(RootObject) do

		-- Type == table means the table may be an 'aliased' item like
		-- neck = gear.WSDNeck
		-- Or it may be another child gearset entirely.
		if type(Value) == "table" then

			-- Absence of "name" means this table is not an item. Continue iterating.
			if not Value["name"] then
				GetItemNamesInRootTable(RootObject[Key])


			-- "empty" is the name assigned to gearswap global value 'empty' which is used in sets.naked. Ignore it.
			-- empty = {name="empty"}
			elseif Value["name"] == "empty" then


			else
				-- Presence of "name" means this table is an item.
				-- Augments may or may not be present.
				-- eg: {name="Fotia Gorget"} or {name="Taeon Tabard", augments={'"Fast Cast"+5',}}

				local ItemName = string.lower(Value["name"])
				local ItemAugment = nil
				local ItemAugmentCode = nil

				-- VALIDATION_GEARSET_AUGMENT_NAMES is a library table containing the possible keys that GearSwap recognizes to designate augments
				-- Iterates through the keys, checks if the key exists and Gets the augment data when key is found
				for _, AugmentKey in ipairs(VALIDATION_GEARSET_AUGMENT_NAMES) do
					if Value[AugmentKey] then
						ItemAugment = GetAugmentStringFromGearSetAugments(Value[AugmentKey])
						ItemAugmentCode = EncodeAugmentString(ItemAugment)
						break
					end
				end

				if ValidGearSlots[Key] then
					if ItemNameList[ItemName] then
						-- If item name is already in the list, just insert the augment data.
						table.insert(ItemNameList[ItemName][VALIDATION_ITEM_AUGMENTS], ItemAugment)
						table.insert(ItemNameList[ItemName][VALIDATION_ITEM_AUGMENT_CODES], ItemAugmentCode)
					else
						-- If ItemID is not in the list create it and create the augment table.
						ItemNameList[ItemName] = {[VALIDATION_ITEM_AUGMENTS]={ItemAugment}, [VALIDATION_ITEM_AUGMENT_CODES]={ItemAugmentCode}}
					end
				else
					-- If the gearset slot is invalid, record the result. This catches invalid gearset definitions like
					-- nekc = gear.WSDNeck
					table.insert(UnidentifiedSlots, Key .. "=" .. ItemName)
				end
			end

		elseif type(Value) == "string" then
			-- Type == string means it is a normal gearset entry.
			-- neck = "Fotia Gorget"
			local ItemName = string.lower(Value)
			if ValidGearSlots[Key] then

				if ItemNameList[ItemName] then
					--The item name is already in the list and this variant has no data.
				else
					--The item name is not in the list. Create it with empty augment data.
					ItemNameList[ItemName] = {[VALIDATION_ITEM_AUGMENTS]={}, [VALIDATION_ITEM_AUGMENT_CODES]={}}
				end

			else
				-- If the gearset slot is invalid, record the result. This catches invalid gearset definitions like
				-- nekc = "Fotia Gorget"
				table.insert(UnidentifiedSlots, Key .. "=" .. Value)
			end
		end
	end
end

function GetItemNamesInSets()
	GetItemNamesInRootTable(_G[SETS_ROOT_NAME])
end

function GetItemNamesInMods()
	GetItemNamesInRootTable(_G[MOD_SETS_ROOT_NAME])
end

function GetItemNamesInOverrides()
	GetItemNamesInRootTable(_G[OVERRIDE_SETS_ROOT_NAME])
end

function GetItemNamesInGear()
	--GetItemNamesInRootTable(_G[GEAR_ITEMS_ROOT_NAME])
end