require "YAGDRSL/debug/chat.lua"

-- Iterates through a list of paths and creates a single gearset out of all of them with set_combine.

function CombinePathsToSet(SetPaths, SetPathStrings)
	local NumberOfSets = #SetPaths
	local CombinedSet = {}

	for i = 1, NumberOfSets do
		CombinedSet = set_combine(CombinedSet, SetPaths[i])
		ChatDebug("Component set:", SetPathStrings[i])
	end

	return CombinedSet
end