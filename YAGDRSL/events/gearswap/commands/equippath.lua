function SelfCommandEquipPath(CommandInputs)

	local PathElements = CommandInputsToSetPathElements(CommandInputs)
	local GearSet = GetFullSet(PathElements)
	EquipSafe(GearSet, "SelfCommandEquipPath", true)

end

function CommandInputsToSetPathElements(CommandInputs)
	-- Turn the inputs back into a single string - splitting on spaces is helpful for other commands but undesirable in this case
	local StringPath = ""
	for Index, SplitString in ipairs(CommandInputs) do
		if Index == 1 then
			StringPath = SplitString
		else
			StringPath = StringPath .. " " .. SplitString
		end
	end

	-- Replace [ with . and remove ]
	-- ws[Rudra's Storm] -> ws.Rudra's Storm
	StringPath = string.gsub(StringPath, '%[', '.')
	StringPath = string.gsub(StringPath, '%]', '')


	local PathElements = {}
	local SplitStart = 1

	-- Find the location of the first . character
	local SplitLocation = string.find(StringPath, "%.")

	if SplitLocation then
		while SplitLocation and SplitLocation > 0 do

			-- Get the string characters between SplitStart and SplitLocation - 1 (which excludes the period) and store the result
			table.insert(PathElements, string.sub(StringPath, SplitStart, SplitLocation - 1))

			-- Calculate the start for tne next split operation as SplitLocation + 1 to start after the period
			SplitStart = SplitLocation + 1

			-- Search for the next period character
			SplitLocation = string.find(StringPath, "%.", SplitStart)
		end

		-- This occurs when SplitLocation is nil which means there is no other period found. Store the rest of the string following the last found period.
		table.insert(PathElements, string.sub(StringPath, SplitStart, #StringPath))
	else
		ChatError("Invalid path")
	end

	return PathElements
end

function GetFullSet(InputElements)
	local GearCollection = {}

	local FirstElement = table.remove(InputElements, 1)
	local CurrentPath = _G[FirstElement]

	if CurrentPath then
		GearCollection = GetGear(CurrentPath, GearCollection)

		for _, Element in ipairs(InputElements) do
			if CurrentPath[Element] then
				CurrentPath = CurrentPath[Element]
				GearCollection = GetGear(CurrentPath, GearCollection)
			end
		end
	else
		return {}
	end

	return GearCollection
end

function GetGear(Gearset, Results)
	for Slot, Item in pairs(Gearset) do
		if type(Item) == "string" then
			Results[Slot] = Item
		elseif type(Item) == "table" and Item["name"] then
			Results[Slot] = Item
		end
	end

	return Results
end