require "YAGDRSL/get/paths/concatenate_path_strings.lua"

-- Accepts a list of strings and then tests whether or not a table exists at each step before proceeding to the next element.
-- Records both the valid tables and a string display of said tables before returning both as ValidPaths and ValidPathStrings.
-- For example
-- WalkPath(sets, precast, ws, dagger) will find and return "sets", "sets.precast" and "sets.precast.ws"

function WalkPath(...)
	local PathElements = {...}
	local PathRootString = table.remove(PathElements, 1)
	local PathRoot = _G[PathRootString]

	local ValidPaths = {}
	local ValidPathStrings = {}

	if PathRoot then
		local TestedPath = PathRoot
		local TestedPathString = PathRootString
		table.insert(ValidPaths, TestedPath)
		table.insert(ValidPathStrings, TestedPathString)

		local NextElement = ""

		for Index, Value in ipairs(PathElements) do
			NextElement = PathElements[Index]

			if TestedPath[NextElement] then
				TestedPath = TestedPath[NextElement]
				TestedPathString = ConcatenatePathStrings(TestedPathString, NextElement)

				table.insert(ValidPaths, TestedPath)
				table.insert(ValidPathStrings, TestedPathString)
			else
				break
			end
		end
	end

	return ValidPaths, ValidPathStrings
end

-- Loops through a list of paths and will check to see if any of them contain an element [NameElement]
-- For example
-- If the paths are "sets", "sets.precast" and "sets.precast.ws" and the NameElement is "Evisceration" then
-- It will check to see if "sets.Evisceration", "sets.precast.Evisceration" and "sets.precast.ws.Evisceration" exist
-- and add the results to both Path and PathStrings.

function AppendValidNamedPaths(Paths, PathStrings, NameElement)
	local NumberOfInputPaths = #Paths

	for i=1, NumberOfInputPaths do
		if Paths[i][NameElement] then
			table.insert(Paths, Paths[i][NameElement])
			table.insert(PathStrings, ConcatenatePathStrings(PathStrings[i], NameElement))
		end
	end
end

-- Same as AppendValidNamedPaths except instead of appending the results to the input parameters Paths and PathStrings it instead creates new tables containing only those newly found paths.
-- Mostly used to construct a new list of mod paths that specifically contain the mod value as an element.
-- For example
-- If Paths is "mods", "mods.precast", "mods.precast.ws" and NameElement is "Accuracy" then CreateNamedPaths will only return
-- mods.Accuracy, mods.precast.Accuracy or mods.precast.ws.Accuracy if they exist.
-- This ensures that the original paths of "mods", "mods.precast", and "mods.precast.ws" do not contribute equipment to the ultimate set.

function CreateNamedPaths(Paths, PathStrings, NameElement)
	local NamedPaths = {}
	local NamedPathStrings = {}
	
	local NumberOfInputPaths = #Paths

	for i=1, NumberOfInputPaths do
		if Paths[i][NameElement] then
			table.insert(NamedPaths, Paths[i][NameElement])
			table.insert(NamedPathStrings, ConcatenatePathStrings(PathStrings[i], NameElement))
		end
	end

	return NamedPaths, NamedPathStrings
end