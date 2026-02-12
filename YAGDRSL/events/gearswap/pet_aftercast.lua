require "YAGDRSL/events/gearswap/terminations/YAG_terminations.lua"

function pet_aftercast(spell)
	ChatBlankLine()
	ChatCheckpointLogged("pet_aftercast Start")

	local TerminateStatus = false
	local TerminateReason = ""

	TerminateStatus, TerminateReason = PetAftercastTerminate()
	if TerminateStatus then
		ChatWarning("pet_aftercast Terminating: ", TerminateReason)
		WriteDevLog("pet_aftercast Terminating: ", TerminateReason)
		return
	else
		AfterCastContainer(EVENT_AFTERCAST_PET)
	end

	local SpellAttributes = GetSpellAttributes(spell)
	HookOnPetAftercast(SpellAttributes) -- @Hook

	ChatCheckpointLogged("pet_aftercast End", spell.name)
end

function PetAftercastTerminate()
	ChatCheckpointLogged("pet_aftercast Termination Start")

	local TerminatePetAftercast = false
	local TerminateReason = ""

	local TerminationFunctions =
		{
			TerminateUpdateOnPlayerMidaction
		}

	for _, TerminationCheck in ipairs(TerminationFunctions) do
		TerminatePetAftercast, TerminateReason = TerminationCheck(EVENT_AFTERCAST_PET)
		if TerminatePetAftercast then
			break
		end
	end

	ChatCheckpointLogged("pet_aftercast Termination End")
	return TerminatePetAftercast, TerminateReason
end

function HookOnPetAftercast(SpellAttributes) -- @Hook
	-- This is a function the user can override to implement custom logic.
end