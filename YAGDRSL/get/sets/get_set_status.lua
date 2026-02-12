require "YAGDRSL/debug/chat.lua"

require "YAGDRSL/events/gearswap/terminations/YAG_terminations.lua"
require "YAGDRSL/get/sets/build_set.lua"
require "YAGDRSL/get/mods/get_mod_total.lua"
require "YAGDRSL/get/mods/get_mod_value.lua"
require "YAGDRSL/get/overrides/get_override.lua"

function GetStatusSet(CharacterStatus, Source)
	local OriginalStatus = CharacterStatus
	local CharacterStatus = GetValidStatusFromCharacterStatus(CharacterStatus)

	local TerminateStatus = false
	local TerminateReason = ""
	TerminateStatus, TerminateReason = GetStatusSetTerminate(CharacterStatus)
	if TerminateStatus then
		ChatWarning(Source .. " GetStatusSet Terminating: ", TerminateReason)
		WriteDevLog(Source .. " GetStatusSet Terminating: ", TerminateReason)
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
	ValidatedStatus = StatusMap[CharacterStatus]

	return ValidatedStatus or CharacterStatus
end

function GetStatusSetTerminate(CharacterStatus)
	ChatCheckpointLogged("GetStatusSetTerminate Start")
	local TerminateStatus = false
	local TerminateReason = ""

	local TerminationFunctions =
		{
			TerminateUpdateOnInvalidCharacterStatus,
		}

	if _G[YAG_SETTINGS]["AutomaticUpdateTermination"] == true then
		for _, TerminationCheck in ipairs(TerminationFunctions) do
			TerminateStatus, TerminateReason = TerminationCheck(CharacterStatus)
			if TerminateStatus then
				break
			end
		end
	end

	if not TerminateStatus then
		TerminateReason = nil
	end

	ChatCheckpointLogged("GetStatusSetTerminate End")
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