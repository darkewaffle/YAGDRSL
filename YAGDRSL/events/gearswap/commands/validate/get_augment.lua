local ExtDataLibrary = require "extdata"

function GetAugmentString(Item)
	local NoExtdata = string.char(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
	local AugmentString = ""
	local AugmentTable = {}

	if Item.extdata ~= NoExtdata then
		AugmentTable = ExtDataLibrary.decode(Item).augments
		if AugmentTable then
			for AugmentIndex, AugmentText in ipairs(AugmentTable) do
				if AugmentText ~= "none" then
					-- String construction copied from GearSwap/export.lua
					AugmentString = AugmentString .. "'" .. AugmentText:gsub("'", "\\'") .."',"
				end
			end
		end
	end

	return AugmentString
end

-- Removes all spaces and non-alphanumeric characters from the string and then makes all remaining letters lowercase
function CleanAugmentString(AugmentString)
	if AugmentString and #AugmentString > 0 then
		AugmentString = string.gsub(AugmentString, "%p", "")
		AugmentString = string.gsub(AugmentString, "%s", "")
		AugmentString = string.lower(AugmentString)
		return AugmentString
	end

	return nil
end

-- Turns the Cleaned augment string into a table of individual characters, sorts by character and then concatenates them into a single long string
-- Crude but when used to identify if an augment matches between a GearSet item and an in-game item then it should help identify them in spite of possible differences in order, case, punctuation, etc.
function EncodeAugmentString(AugmentString)
	AugmentString = CleanAugmentString(AugmentString)

	if AugmentString and #AugmentString > 0 then
		local StringAsTable = {}
		for i=1, #AugmentString do
			StringAsTable[i] = AugmentString:sub(i,i)
		end
		table.sort(StringAsTable)
		return table.concat(StringAsTable)
	end
	return nil
end

function GetAugmentStringFromGearSetAugments(AugmentTable)
	local AugmentString = ""

	for Index, AugmentText in ipairs(AugmentTable) do
		-- String construction copied from GearSwap/export.lua
		AugmentString = AugmentString .. "'" .. AugmentText:gsub("'", "\\'") .."',"
	end

	if AugmentString == "" then
		return nil
	end

	return AugmentString
end