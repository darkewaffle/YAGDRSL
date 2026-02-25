require "YAGDRSL/get/get_character.lua"
require "YAGDRSL/get/paths/walk_path_definitions.lua"

-- Conditionally determines the path elements that will be passed to WalkPath depending on the origin of the GetPaths call.
-- EventOrStatus is evaluated to determine if it is coming from an event (precast) and will contain SpellAttributes (which contribute to the WalkPath elements)
-- or if it is simply a status update where mostly only the character's status matters.
function GetPaths(RootName, EventOrStatus, SpellAttributes)
	local SetPaths = {}
	local SetPathStrings = {}

	local ValidEvents =
		{
			[EVENT_PRECAST] = true,
			[EVENT_MIDCAST] = true,
			[EVENT_AFTERCAST] = true
		}

	local ValidStatus =
		{
			[STATUS_ENGAGED] = true,
			[STATUS_IDLE] = true,
			[STATUS_RESTING] = true
		}

	-- This means that that the request is originating from a casting event and contains SpellAttributes that should be provided to WalkPath.
	if ValidEvents[EventOrStatus] then
		local EventSource = EventOrStatus

		if not SpellAttributes then
			ChatError("GetPaths requires SpellAttributes to proceed")
		else
			if SpellAttributes["Category"] == CATEGORY_RA then
				SetPaths, SetPathStrings = WalkPathRA(RootName, EventSource, SpellAttributes)


			elseif SpellAttributes["Category"] == CATEGORY_WS then
				SetPaths, SetPathStrings = WalkPathWS(RootName, EventSource, SpellAttributes)


			elseif SpellAttributes["Category"] == CATEGORY_JA then
				SetPaths, SetPathStrings = WalkPathJA(RootName, EventSource, SpellAttributes)


			elseif SpellAttributes["Category"] == CATEGORY_MAGIC then
				SetPaths, SetPathStrings = WalkPathMagic(RootName, EventSource, SpellAttributes)
			
			elseif SpellAttributes["Category"] == CATEGORY_ITEM then
				SetPaths, SetPathStrings = WalkPathItem(RootName, EventSource, SpellAttributes)
			end

		end

	-- This means that that the request is originating from a status update and will not contain SpellAttributes.
	elseif ValidStatus[EventOrStatus] then
		
		local CharacterStatus = EventOrStatus
		local ZoneClass = GetCharacterZoneClass()

		SetPaths, SetPathStrings = WalkPathStatus(RootName, CharacterStatus, ZoneClass)

	else
		ChatError("GetPaths received invalid event or status parameter", EventOrStatus)
	end

	return SetPaths, SetPathStrings
end

function GetEventSetPaths(SpellAttributes, EventSource)
	return GetPaths(SETS_ROOT_NAME, EventSource, SpellAttributes)
end

function GetEventModPathsv1(SpellAttributes, EventSource, ModifierName)
	local ModPaths, ModPathStrings = GetPaths(MOD_SETS_ROOT_NAME, EventSource, SpellAttributes)
	return CreateNamedPaths(ModPaths, ModPathStrings, ModifierName)
end

function GetEventModPaths(SpellAttributes, EventSource, ModifierObject)
	local ModParent = GetModParent(ModifierObject)
	local ModValue = GetModValue(ModifierObject)
	local ModPaths, ModPathStrings = GetPaths(MOD_SETS_ROOT_NAME, EventSource, SpellAttributes)

	if not ModParent then
		ModPaths, ModPathStrings = CreateNamedPaths(ModPaths, ModPathStrings, ModValue)
	else
		ModPaths, ModPathStrings = CreateNamedPaths(ModPaths, ModPathStrings, ModParent)
		AppendValidNamedPaths(ModPaths, ModPathStrings, ModValue)
	end

	return ModPaths, ModPathStrings
end

function GetEventOverridePaths(SpellAttributes, EventSource, OverrideName)
	local OverridePaths, OverridePathStrings = GetPaths(OVERRIDE_SETS_ROOT_NAME, EventSource, SpellAttributes)
	return CreateNamedPaths(OverridePaths, OverridePathStrings, OverrideName)	
end

function GetStatusSetPaths(CharacterStatus)
	return GetPaths(SETS_ROOT_NAME, CharacterStatus)
end

function GetStatusModPathsv1(CharacterStatus, ModifierName)
	local ModPaths, ModPathStrings = GetPaths(MOD_SETS_ROOT_NAME, CharacterStatus)
	return CreateNamedPaths(ModPaths, ModPathStrings, ModifierName)
end

function GetStatusModPaths(CharacterStatus, ModifierObject)
	local ModParent = GetModParent(ModifierObject)
	local ModValue = GetModValue(ModifierObject)
	local ModPaths, ModPathStrings = GetPaths(MOD_SETS_ROOT_NAME, CharacterStatus)

	if not ModParent then
		ModPaths, ModPathStrings = CreateNamedPaths(ModPaths, ModPathStrings, ModValue)
	else
		ModPaths, ModPathStrings = CreateNamedPaths(ModPaths, ModPathStrings, ModParent)
		AppendValidNamedPaths(ModPaths, ModPathStrings, ModValue)
	end

	return ModPaths, ModPathStrings
end

function GetStatusOverridePaths(CharacterStatus, OverrideName)
	local OverridePaths, OverridePathStrings = GetPaths(OVERRIDE_SETS_ROOT_NAME, CharacterStatus)
	return CreateNamedPaths(OverridePaths, OverridePathStrings, OverrideName)
end