require "YAGDRSL/events/gearswap/terminations/YAG_terminations.lua"

function midcast(spell)
	ChatBlankLine()
	ChatCheckpointLogged("Midcast Start")

	local SpellAttributes = GetSpellAttributes(spell)

	local TerminateStatus = false
	local TerminateReason = ""
	TerminateStatus, TerminateReason = MidcastTerminate(SpellAttributes)
	if TerminateStatus then
		ChatWarning("Midcast Terminating: ", TerminateReason)
		WriteDevLog("Midcast Terminating: ", TerminateReason)
		return
	end

	local MidcastSet = MidcastContainer(SpellAttributes)
	ChatGearSet(MidcastSet, EVENT_MIDCAST)
	EquipSafe(MidcastSet, EVENT_MIDCAST, SpellAttributes["IgnoreWeaponLock"])

	ChatCheckpointLogged("Midcast End")
end

-- Midcast logic wrapped in MidcastContainer that only requires SpellAttributes and does not call equip to support the demo command.
-- Also used for pet_midcast.
function MidcastContainer(SpellAttributes)
	local MidcastSet = {}
	local MidcastModOffense = {}
	local MidcastModDefense = {}
	local MidcastOverride = {}

	MidcastSet = GetMidcastSet(SpellAttributes)
	MidcastModOffense = GetMidcastModOffense(SpellAttributes)
	MidcastModDefense = GetMidcastModDefense(SpellAttributes)
	MidcastOverride = GetMidcastOverride(SpellAttributes)

	if GetModDefensePriority() then
		MidcastSet = set_combine(MidcastSet, MidcastModOffense)
		MidcastSet = HookMidcastCustomizeOffense(SpellAttributes, MidcastSet) -- @Hook

		MidcastSet = set_combine(MidcastSet, MidcastModDefense)
		MidcastSet = HookMidcastCustomizeDefense(SpellAttributes, MidcastSet) -- @Hook
	else
		MidcastSet = set_combine(MidcastSet, MidcastModDefense)
		MidcastSet = HookMidcastCustomizeDefense(SpellAttributes, MidcastSet) -- @Hook

		MidcastSet = set_combine(MidcastSet, MidcastModOffense)
		MidcastSet = HookMidcastCustomizeOffense(SpellAttributes, MidcastSet) -- @Hook
	end

	MidcastSet = set_combine(MidcastSet, MidcastOverride)
	MidcastSet = HookMidcastCustomizeFinal(SpellAttributes, MidcastSet) -- @Hook
	return MidcastSet
end

function MidcastTerminate(SpellAttributes)
	ChatCheckpointLogged("Midcast Termination Start")

	local TerminateMidcast = false
	local TerminateReason = ""
	local TerminateOnPetMidactionDefault = true

	local TerminationFunctions =
		{
			TerminateMidcastOnInvalidSpellCategory,
			TerminateSpellOnPetMidaction
		}

	for _, TerminationCheck in ipairs(TerminationFunctions) do
		TerminateMidcast, TerminateReason = TerminationCheck(SpellAttributes, EVENT_PRECAST, TerminateOnPetMidactionDefault)
		if TerminateMidcast then
			break
		end
	end

	ChatCheckpointLogged("Midcast Termination End")
	return TerminateMidcast, TerminateReason
end

function HookMidcastCustomizeOffense(SpellAttributes, MidcastSet) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It must return a gearset in order proceed properly.
	return MidcastSet
end

function HookMidcastCustomizeDefense(SpellAttributes, MidcastSet) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It must return a gearset in order proceed properly.
	return MidcastSet
end

function HookMidcastCustomizeFinal(SpellAttributes, MidcastSet) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It must return a gearset in order proceed properly.
	return MidcastSet
end