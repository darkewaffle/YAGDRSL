function aftercast(spell)
	ChatBlankLine()
	ChatCheckpointLogged("Aftercast Start")

	local SpellAttributes = GetSpellAttributes(spell)

	TerminateStatus, TerminateReason = AftercastTerminate()
	if TerminateStatus then
		ChatWarning("aftercast Terminating:", TerminateReason)
		WriteDevLog("aftercast Terminating:", TerminateReason)
		return
	else
		AfterCastContainer(EVENT_AFTERCAST, SpellAttributes["IgnoreWeaponLock"])
	end

	HookOnAftercast(SpellAttributes) -- @Hook

	ChatCheckpointLogged("Aftercast End", spell.name)
end

-- Isolated into function so that it can be re-used in pet_aftercast.
function AfterCastContainer(EventName, IgnoreWeaponLock)

	local CharacterStatus = GetCharacterStatus()
	ChatDebug(EventName .. ", CharacterStatus =", CharacterStatus)
	local StatusSet = {}
	StatusSet = GetStatusSet(CharacterStatus, EventName)

	ChatGearSet(StatusSet, EventName)
	EquipSafe(StatusSet, EventName, IgnoreWeaponLock)

end

function AftercastTerminate()
	ChatCheckpointLogged("aftercast Termination Start")

	local TerminateAftercast = false
	local TerminateReason = ""

	local TerminationFunctions =
		{
			TerminateUpdateOnPetMidaction
		}

	for _, TerminationCheck in ipairs(TerminationFunctions) do
		TerminateAftercast, TerminateReason = TerminationCheck(EVENT_AFTERCAST)
		if TerminateAftercast then
			break
		end
	end

	ChatCheckpointLogged("aftercast Termination End")
	return TerminateAftercast, TerminateReason
end

function HookOnAftercast(SpellAttributes) -- @Hook
	-- This is a function the user can override to implement custom logic.
end