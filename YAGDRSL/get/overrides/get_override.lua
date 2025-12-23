require "YAGDRSL/get/sets/build_set.lua"
require "YAGDRSL/get/overrides/get_override_value.lua"

function GetEventOverride(SpellAttributes, EventSource)
	local EventOverride = {}
	local OverrideValue = GetOverrideValue()

	if OverrideValue then
		EventOverride = BuildEventOverride(SpellAttributes, EventSource, OverrideValue)
	end


	ChatGearSet(EventOverride, EventSource .. " override")
	return EventOverride
end

function GetStatusOverride(CharacterStatus)
	local StatusOverride = {}
	local OverrideValue = GetOverrideValue()

	if OverrideValue then
		StatusOverride = BuildStatusOverride(CharacterStatus, OverrideValue)
	end

	ChatGearSet(StatusOverride, CharacterStatus .. " override")
	return StatusOverride
end

function GetPrecastOverride(SpellAttributes)
	return GetEventOverride(SpellAttributes, EVENT_PRECAST)
end

function GetMidcastOverride(SpellAttributes)
	return GetEventOverride(SpellAttributes, EVENT_MIDCAST)
end