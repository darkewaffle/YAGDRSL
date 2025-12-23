--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/debug/chat_objects.lua"

--@@require "YAGDRSL/get/sets/get_set_event.lua"
--@@require "YAGDRSL/get/mods/get_mod_total.lua"
--@@require "YAGDRSL/get/mods/get_mod_value.lua"
--@@require "YAGDRSL/get/overrides/get_override.lua"
--@@require "YAGDRSL/get/get_spellattributes.lua"

function midcast(spell)
	ChatBlankLine()
	ChatCheckpointLogged("Midcast Start")

	local SpellAttributes = GetSpellAttributes(spell)

	local TerminateStatus = false
	local TerminateReason = ""
	TerminateStatus, TerminateReason = MidcastTerminate(SpellAttributes)
	if TerminateStatus then
		ChatWarning("Midcast Terminating: " .. TerminateReason, SpellAttributes["Name"])
		return
	end

	local MidcastSet = MidcastContainer(SpellAttributes)
	ChatGearSet(MidcastSet, EVENT_MIDCAST)
	EquipSafe(MidcastSet, EVENT_MIDCAST)

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

	local ValidMidcastCategories = {[CATEGORY_MAGIC]=true, [CATEGORY_RA]=true, [CATEGORY_ITEM]=true}

	if not ValidMidcastCategories[SpellAttributes["Category"]] then
		TerminateMidcast = true
		TerminateReason = "Midcast is not valid for " .. SpellAttributes["Category"]
	end

	if not TerminateMidcast then
		TerminateReason = nil
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