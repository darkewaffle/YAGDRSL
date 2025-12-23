require "YAGDRSL/get/paths/get_setpaths.lua"
require "YAGDRSL/get/paths/combine_paths.lua"

-- Functions to call Get___Paths, pass the result to CombinePathsToSet and then return the completed set.

function BuildEventSet(SpellAttributes, EventSource)
	local EventSet = {}
	local SetPaths, SetPathStrings = GetEventSetPaths(SpellAttributes, EventSource)

	ChatSet("Building set for", EventSource)

	EventSet = CombinePathsToSet(SetPaths, SetPathStrings)
	return EventSet
end

function BuildEventMod(SpellAttributes, EventSource, ModifierName)
	local EventMod = {}
	local ModPaths, ModPathStrings = GetEventModPaths(SpellAttributes, EventSource, ModifierName)

	ChatSet("Building mod for", EventSource .. " - " .. ModifierName)

	EventMod = CombinePathsToSet(ModPaths, ModPathStrings)
	return EventMod
end

function BuildEventOverride(SpellAttributes, EventSource, OverrideName)
	local EventOverride = {}
	local OverridePaths, OverridePathStrings = GetEventOverridePaths(SpellAttributes, EventSource, OverrideName)

	ChatSet("Building override for", EventSource .. " - " .. OverrideName)

	EventOverride = CombinePathsToSet(OverridePaths, OverridePathStrings)
	return EventOverride
end

function BuildStatusSet(CharacterStatus)
	local StatusSet = {}
	local SetPaths, SetPathStrings = GetStatusSetPaths(CharacterStatus)

	ChatSet("Building set for", CharacterStatus)

	StatusSet = CombinePathsToSet(SetPaths, SetPathStrings)
	return StatusSet
end

function BuildStatusMod(CharacterStatus, ModifierName)
	local StatusMod = {}
	local ModPaths, ModPathStrings = GetStatusModPaths(CharacterStatus, ModifierName)

	ChatSet("Building mod for", CharacterStatus .. " - " .. ModifierName)

	StatusMod = CombinePathsToSet(ModPaths, ModPathStrings)
	return StatusMod
end

function BuildStatusOverride(CharacterStatus, OverrideName)
	local StatusOverride = {}
	local OverridePaths, OverridePathStrings = GetStatusOverridePaths(CharacterStatus, OverrideName)

	ChatSet("Building override for", CharacterStatus .. " - " .. OverrideName)

	StatusOverride = CombinePathsToSet(OverridePaths, OverridePathStrings)
	return StatusOverride
end