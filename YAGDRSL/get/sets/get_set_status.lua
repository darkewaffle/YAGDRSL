require "YAGDRSL/debug/chat.lua"

require "YAGDRSL/get/sets/build_set.lua"
require "YAGDRSL/get/mods/get_mod_total.lua"
require "YAGDRSL/get/mods/get_mod_value.lua"
require "YAGDRSL/get/overrides/get_override.lua"

function GetStatusSet(CharacterStatus)
	local OriginalStatus = CharacterStatus
	local CharacterStatus = GetValidStatusFromCharacterStatus(CharacterStatus)

	local TerminateStatus = false
	local TerminateReason = ""
	TerminateStatus, TerminateReason = GetStatusSetTerminate(CharacterStatus)
	if TerminateStatus then
		ChatWarning("GetStatusSet Terminating: " .. TerminateReason, OriginalStatus)
		return {}
	end

	local StatusSet = {}
	local StatusModOffense = {}
	local StatusModDefense = {}
	local StatusOverride = {}

	StatusSet = BuildStatusSet(CharacterStatus)
	StatusModOffense = GetStatusModOffense(CharacterStatus)
	StatusModDefense = GetStatusModDefense(CharacterStatus)
	StatusOverride = GetStatusOverride(CharacterStatus)

	if GetModDefensePriority() then
		StatusSet = set_combine(StatusSet, StatusModOffense)
		StatusSet = HookStatusCustomizeOffense(CharacterStatus, StatusSet) -- @Hook

		StatusSet = set_combine(StatusSet, StatusModDefense)
		StatusSet = HookStatusCustomizeDefense(CharacterStatus, StatusSet) -- @Hook
	else
		StatusSet = set_combine(StatusSet, StatusModDefense)
		StatusSet = HookStatusCustomizeDefense(CharacterStatus, StatusSet) -- @Hook

		StatusSet = set_combine(StatusSet, StatusModOffense)
		StatusSet = HookStatusCustomizeOffense(CharacterStatus, StatusSet) -- @Hook
	end

	StatusSet = set_combine(StatusSet, StatusOverride)
	StatusSet = HookStatusCustomizeFinal(CharacterStatus, StatusSet) -- @Hook
	return StatusSet
end

function GetValidStatusFromCharacterStatus(CharacterStatus)
	local StatusMap =
		{
			[STATUS_CHOCOBO] = STATUS_IDLE,
			[STATUS_ENGAGED] = STATUS_ENGAGED,
			[STATUS_IDLE] = STATUS_IDLE,
			[STATUS_MOUNT] = STATUS_IDLE,
			[STATUS_RESTING] = STATUS_RESTING
		}
	CharacterStatus = string.lower(CharacterStatus)
	CharacterStatus = StatusMap[CharacterStatus]
	return CharacterStatus
end

function GetStatusSetTerminate(CharacterStatus)
	local TerminateStatus = false
	local TerminateReason = ""

	local ValidStatuses =
		{
			[STATUS_ENGAGED] = true,
			[STATUS_IDLE] = true,
			[STATUS_RESTING] = true
		}

	-- This is a global boolean value that indicates if there is an action currently underway. True when precast has been confirmed and set to false when aftercast begins.
	if STATE_ACTION_IN_PROGRESS then
		TerminateStatus = true
		TerminateReason = "Character action currently in progress, status set will not be applied."
	end

	if not ValidStatuses[CharacterStatus] then
		TerminateStatus = true
		TerminateReason = "Gear may not be equipped while status ="
	end

	return TerminateStatus, TerminateReason
end

function HookStatusCustomizeOffense(CharacterStatus, StatusSet) -- @Hook
	return StatusSet
end

function HookStatusCustomizeDefense(CharacterStatus, StatusSet) -- @Hook
	return StatusSet
end

function HookStatusCustomizeFinal(CharacterStatus, StatusSet) -- @Hook
	return StatusSet
end