function SelfCommandValidate(CommandInputs)

	local ValidationModes = {}
	ValidationModes["AllJobs"] = false
	ValidationModes["SkipWeapons"] = false

	local MapInputToMode =
	{
		["all"]="AllJobs", ["alljobs"]="AllJobs", ["jobs"]="AllJobs",
		["noweapons"]="SkipWeapons", ["noweps"]="SkipWeapons", ["skipweapons"]="SkipWeapons", ["skipweps"]="SkipWeapons"
	}

	local function SetValidationModeTrue(ModeName)
		ValidationModes[ModeName] = true
	end

	-- Iterate through each command input and check if it is valid with MapInputToMode
	-- If valid then call SetValidationModeTrue to set the mode value to true
	-- These mode booleans control validation behavior
	for _, CommandInputs in ipairs(CommandInputs) do
		if MapInputToMode[CommandInputs] then
			SetValidationModeTrue(MapInputToMode[CommandInputs])
		else
			ChatError("Invalid validation parameter: ", CommandInputs)
		end
	end

	if ValidationModes["AllJobs"] then

		-- First record all the item data found in the current job's tables
		-- Reset will then empty the gearset tables in preparation for data from the next job.
		FillValidationTablesFromGearSets()
		ResetLibraryGearSetTables()

		-- Then iterate through JobControls to find other jobs defined by the user
		for JobShortName, JobSettings in pairs(_G[YAG_SETTINGS]["JobControls"]) do

			-- Only proceed when the job is not the current job (since that data was already recorded before iteration began)
			if JobShortName ~= GetCharacterJobShort() then

				-- Check if a new job equipment file was successfully loaded. If so, record the data and reset the tables.
				if LoadJobEquipmentFile(JobShortName) then
					FillValidationTablesFromGearSets()
					ResetLibraryGearSetTables()
				end
			end
		end

	else
		-- Validate only for the current job.
		FillValidationTablesFromGearSets()
	end

	-- Get the equipment data (IDs and augments) from character inventory and wardrobes.
	FillValidationTablesFromCharacter()

	-- Iterates through the data collected by FillValidationTablesFromGearSets() and looks up the item ID for each item name.
	TranslateGearSetItemNamesIntoItemIDs()

	-- Now we have a list of item IDs possessed by the character and item IDs found in the gearsets-
	-- Identify the IDs found in the GearSets that are not on the character.
	GetGearSetItemsNotFound()
	-- Then identify the IDs found on the character that are not used in a GearSet.
	GetEquipmentItemsNotUsed(ValidationModes["SkipWeapons"])

	-- Print out all the results to the chat log
	ChatValidationResults()

	-- Scheduled to ensure that the tables do not start being emptied while any evaluation is occurring.
	-- Original attempts to just set them to {} without schedule resulted in sometimes erroneous results.
	coroutine.schedule(EmptyValidationTables, 3)

	-- Since AllJobs mode wiped the gear and possibly altered settings found in other job equipment files, reload the current job files for a fresh start.
	if ValidationModes["AllJobs"] then
		RestoreGearSetsAfterValidation()
	end
end

function FillValidationTablesFromGearSets()
	ChatCheckpoint("FillValidationTablesFromGearSets")
	GetItemNamesInSets()
	GetItemNamesInMods()
	GetItemNamesInOverrides()
end

function ResetLibraryGearSetTables()
	ChatCheckpoint("ResetLibraryGearSetTables")
	NullifyLibraryGearSetTables()
	DeclareLibraryGearSetTables()
end

function FillValidationTablesFromCharacter()
	ChatCheckpoint("FillValidationTablesFromCharacter")
	GetEquipmentIDsInInventory()
	GetEquipmentIDsInWardrobeAll()
end

function TranslateGearSetItemNamesIntoItemIDs()
	ChatCheckpoint("TranslateGearSetItemNamesIntoItemIDs")
	local ItemNameList =     _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_ITEMS]
	local ItemIDList =       _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_IDS]
	local InvalidItemNames = _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_INVALID_NAMES]
	local ItemID = ""

	for ItemName, AugmentData in pairs(ItemNameList) do
		ItemID = GetItemID(ItemName)
		local Augments = AugmentData[VALIDATION_ITEM_AUGMENTS]
		local AugmentCodes = AugmentData[VALIDATION_ITEM_AUGMENT_CODES]

		if ItemID then
			-- If the item is rare then augments don't matter as the character can only possess one of them
			if GetItemIsRare(ItemID) then
				Augments = {}
				AugmentCodes = {}
			end

			ItemIDList[ItemID] = {[VALIDATION_ITEM_AUGMENTS]=Augments, [VALIDATION_ITEM_AUGMENT_CODES]=AugmentCodes}
		else
			-- If ItemID is nil then the ItemName lookup failed and the ItemName is not valid, record it.
			table.insert(InvalidItemNames, ItemName)
		end
	end
end

function GetGearSetItemsNotFound()
	ChatCheckpoint("GetGearSetItemsNotFound")
	local CharacterEquipmentIDs =            _G[VALIDATION_ROOT_NAME][VALIDATION_CHARACTER_EQUIPMENT_IDS]
	local CharacterEquipmentNames =          _G[VALIDATION_ROOT_NAME][VALIDATION_CHARACTER_EQUIPMENT_NAMES]
	local GearSetIDs =                       _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_IDS]
	local GearSetItemsNotFound =             _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_ITEMS_NOT_FOUND]
	local GearSetItemsInsufficientAugments = _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_UNDEFINED_AUGMENTS]

	for GearSetID, GearSetAugmentData in pairs(GearSetIDs) do
		if not CharacterEquipmentIDs[GearSetID] then
			local GearsetItemName = GetItemName(GearSetID)

			-- Since some items have identical names across multiple IDs, double-check the gearset item name against the compiled list of equipment names
			-- If that fails to match then record item as not found
				if not CharacterEquipmentNames[GearsetItemName] then
					table.insert(GearSetItemsNotFound, {[VALIDATION_ITEM_NAME] = GetItemName(GearSetID)})
				end

			-- GearSetItemID not found in CharacterEquipmentIDs, record the result.
			--table.insert(GearSetItemsNotFound, {[VALIDATION_ITEM_NAME] = GetItemName(GearSetID)})
		else
			
			-- GearSetItemID found in CharacterEquipmentIDs. Evaluate augments.
			local EquipmentAugmentCodes = CharacterEquipmentIDs[GearSetID][VALIDATION_ITEM_AUGMENT_CODES]

			-- Special case where insufficient augment data in gearsets and more than one augmented variation
			-- exists in inventory means the wrong copy could be equipped.
			if #GearSetAugmentData[VALIDATION_ITEM_AUGMENT_CODES] == 0 and #EquipmentAugmentCodes > 1 then
				table.insert(GearSetItemsInsufficientAugments, GetItemName(GearSetID))
			else

				-- Iterate through each augment code corresponding to the ID of the gearset item.
				for i=1, #GearSetAugmentData[VALIDATION_ITEM_AUGMENT_CODES] do
					local AugmentFound = false

					-- Compare the gearset augment code to each augment code associated with the item ID from inventory.
					for _, EquipmentAugmentCode in ipairs(EquipmentAugmentCodes) do

						-- If the gearset augment code is found then the GearSet item exists in inventory. No further action required.
						if GearSetAugmentData[VALIDATION_ITEM_AUGMENT_CODES][i] == EquipmentAugmentCode then
							AugmentFound = true
							break
						end
					end

					-- If the gearset augment code is not found then the gearset item may not exist in inventory. Record the name and augment string.
					-- This result could be a false positive caused by augment formatting differences in the gearset.
					if not AugmentFound then
						table.insert(GearSetItemsNotFound, {[VALIDATION_ITEM_NAME]=GetItemName(GearSetID), [VALIDATION_ITEM_AUGMENTS]=GearSetAugmentData[VALIDATION_ITEM_AUGMENTS][i]})
					end
				end

			end
		end
	end
end

function GetEquipmentItemsNotUsed(SkipWeapons)
	ChatCheckpoint("GetEquipmentItemsNotUsed")
	local CharacterEquipmentIDs = _G[VALIDATION_ROOT_NAME][VALIDATION_CHARACTER_EQUIPMENT_IDS]
	local GearSetIDs =            _G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_IDS]
	local UnusedEquipment =       _G[VALIDATION_ROOT_NAME][VALIDATION_CHARACTER_EQUIPMENT_NOT_USED]

	for CharacterEquipmentID, EquipmentAugmentData in pairs(CharacterEquipmentIDs) do
		-- SkipWeapons enabled and the item is a weapon.
		-- SkipWeapons mode allows weapons the character is carrying (which are commonly not in gearsets) to be
		-- excluded and not clutter the results.
		if SkipWeapons and GetItemIsWeapon(CharacterEquipmentID) then
			-- Do nothing.
		else

			-- CharacterEquipmentID not found in GearSetIDs.
			if not GearSetIDs[CharacterEquipmentID] then
				table.insert(UnusedEquipment, {[VALIDATION_ITEM_NAME] = GetItemName(CharacterEquipmentID)})
			else

				-- CharacterEquipmentID found in GearSetIDs. Evaluate augments.
				local GearSetAugments = GearSetIDs[CharacterEquipmentID][VALIDATION_ITEM_AUGMENT_CODES]

				-- If #GearSetAugments == 0 then GearSet entries provided no augment data and ID match alone means an augment is in a set. No further action required.
				-- If #GearSetAugments >0 then evaluate augments to find a match.
				if #GearSetAugments > 0 then

					-- Iterate through each augment code corresponding to the ID of the equipment item.
					for i=1, #EquipmentAugmentData[VALIDATION_ITEM_AUGMENT_CODES] do
						local AugmentFound = false

						-- Compare the equipment augment code to each augment code associated with the item ID from gearsets.
						for _, GearSetAugmentCode in ipairs(GearSetAugments) do

							-- If the equipment augment code is found then the equipment item exists in a gearset. No further action required.
							if EquipmentAugmentData[VALIDATION_ITEM_AUGMENT_CODES][i] == GearSetAugmentCode then
								AugmentFound = true
								break
							end
						end

						-- If the equipment augment code is not found then the equipment item may not exist in gearsets. Record the name and augment string.
						-- This result could be a false positive caused by augment formatting differences in the gearset.
						if not AugmentFound then
							table.insert(UnusedEquipment, {[VALIDATION_ITEM_NAME] = GetItemName(CharacterEquipmentID), [VALIDATION_ITEM_AUGMENTS]=EquipmentAugmentData[VALIDATION_ITEM_AUGMENTS][i]})
						end
					end
				end
			end
		end
	end
end

function ChatValidationResults()
	ChatCheckpoint("ChatValidationResults")
	local GearSetInvalidSlots =         table.sort(_G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_INVALID_SLOTS])
	local GearSetInvalidNames =         table.sort(_G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_INVALID_NAMES])
	local GearSetInsufficientAugments = table.sort(_G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_UNDEFINED_AUGMENTS])

	function SortValidationTablesWithNameKeys(TableA, TableB)
		return TableA[VALIDATION_ITEM_NAME] < TableB[VALIDATION_ITEM_NAME]
	end

	local GearSetItemsNotFound =  table.sort(_G[VALIDATION_ROOT_NAME][VALIDATION_GEARSET_ITEMS_NOT_FOUND], SortValidationTablesWithNameKeys)
	local EquipmentItemsNotUsed = table.sort(_G[VALIDATION_ROOT_NAME][VALIDATION_CHARACTER_EQUIPMENT_NOT_USED], SortValidationTablesWithNameKeys)

	ChatBlankLineForced()
	ChatNotice("Invalid Slot Names Found In GearSet")
	ChatTableMessage(GearSetInvalidSlots)
	ChatBlankLineForced()

	ChatNotice("Invalid Item Names Found In GearSet")
	ChatTableMessage(GearSetInvalidNames)
	ChatBlankLineForced()

	ChatNotice("Items In GearSet Without Defined Augments and Character Holds >1 Copy")
	ChatTableMessage(GearSetInsufficientAugments)
	ChatBlankLineForced()

	ChatNotice("Items In GearSet and Not In Inventory/Wardrobe")
	for Index, Item in ipairs(GearSetItemsNotFound) do
		ChatMessage(Item[VALIDATION_ITEM_NAME], Item[VALIDATION_ITEM_AUGMENTS])
	end
	ChatBlankLineForced()

	ChatNotice("Equipment In Inventory/Wardrobe and Not In Gearset")
	for Index, Item in ipairs(EquipmentItemsNotUsed) do
		ChatMessage(Item[VALIDATION_ITEM_NAME], Item[VALIDATION_ITEM_AUGMENTS])
	end
	ChatBlankLineForced()

end

function EmptyValidationTables()
	ChatCheckpoint("EmptyValidationTables")
	DeclareValidationTables()
end

function RestoreGearSetsAfterValidation()
	ResetLibraryGearSetTables()
	GetPlayerSettingsProtected()
	LoadMainJobEquipmentFile()
end