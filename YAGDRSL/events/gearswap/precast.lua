require "YAGDRSL/events/gearswap/terminations/terminate_precast.lua"

function precast(spell, position)
	-- Every precast-to-aftercast sequence is logged by entries made in each ChatCheckpointLogged call.
	-- Reset ensures that the log is empty at the start of each sequence.
	ResetPerformanceLog()
	ChatBlankLine()
	ChatCheckpointLogged("Precast Start", spell.name)

	local SpellAttributes = GetSpellAttributes(spell)

	local TerminateStatus = false
	local TerminateReason = ""
	TerminateStatus, TerminateReason = PrecastTerminate(SpellAttributes)
	if TerminateStatus then
		ChatWarning("Precast Terminating: ", TerminateReason)
		WriteDevLog("Precast Terminating: ", TerminateReason)
		cancel_spell()
		return
	end

	TerminateStatus, TerminateReason = HookPrecastTerminate(SpellAttributes) -- @Hook
	if TerminateStatus then
		TerminateReason = TerminateReason or "TerminateReason Undefined"
		ChatWarning("User defined precast termination: " .. TerminateReason, SpellAttributes["Name"])
		cancel_spell()
		return
	end

	local DelayAmount = 0
	DelayAmount = PrecastDelay(SpellAttributes)
	if DelayAmount > 0 then
		ChatCheckpointLogged("Cast Delayed By", tostring(DelayAmount))
		ChatWarning(SpellAttributes["Name"] .. " delayed by", tostring(DelayAmount))
		cast_delay(DelayAmount)
	end

	local PrecastSet = {}
	local TerminateSwap = false
	local TerminateSwapReason = ""

	-- Evaluate if the swap should take place
	TerminateSwap, TerminateSwapReason = PrecastTerminateSwap(SpellAttributes)
	if TerminateSwap then
		ChatWarning("Precast Swap Terminated: ", TerminateSwapReason)
		WriteDevLog("Precast Swap Terminated: ", TerminateReason)
	else
		PrecastSet = PrecastContainer(SpellAttributes)
	end

	ChatGearSet(PrecastSet, EVENT_PRECAST)
	EquipSafe(PrecastSet, EVENT_PRECAST, SpellAttributes["IgnoreWeaponLock"])

	ChatCheckpointLogged("Precast End")
end

-- Precast logic wrapped in PrecastContainer that only requires SpellAttributes and does not call equip to support the demo command.
function PrecastContainer(SpellAttributes, EventName)
	local PrecastSet = {}
	local PrecastModOffense = {}
	local PrecastModDefense = {}
	local PrecastOverride = {}

	PrecastSet = GetPrecastSet(SpellAttributes)
	PrecastModOffense = GetPrecastModOffense(SpellAttributes)
	PrecastModDefense = GetPrecastModDefense(SpellAttributes)
	PrecastOverride = GetPrecastOverride(SpellAttributes)

	if GetModDefensePriority() then
		PrecastSet = set_combine(PrecastSet, PrecastModOffense)
		PrecastSet = HookPrecastCustomizeOffense(SpellAttributes, PrecastSet) -- @Hook

		PrecastSet = set_combine(PrecastSet, PrecastModDefense)
		PrecastSet = HookPrecastCustomizeDefense(SpellAttributes, PrecastSet) -- @Hook
	else
		PrecastSet = set_combine(PrecastSet, PrecastModDefense)
		PrecastSet = HookPrecastCustomizeDefense(SpellAttributes, PrecastSet) -- @Hook

		PrecastSet = set_combine(PrecastSet, PrecastModOffense)
		PrecastSet = HookPrecastCustomizeOffense(SpellAttributes, PrecastSet) -- @Hook
	end

	PrecastSet = set_combine(PrecastSet, PrecastOverride)
	PrecastSet = HookPrecastCustomizeFinal(SpellAttributes, PrecastSet) -- @Hook
	return PrecastSet
end

function PrecastDelay(SpellAttributes)
	ChatCheckpointLogged("PrecastDelay Start")
	local DelayAmount = 0

	DelayAmount = AutomaticBuffCancel(SpellAttributes) or DelayAmount

	ChatCheckpointLogged("PrecastDelay End")
	return DelayAmount
end

function PrecastTerminateSpell(SpellAttributes)
	ChatCheckpointLogged("PrecastTerminateSpell Start")
	local TerminateSpell = false
	local TerminateReason = ""
	local TerminateOnPetMidactionDefault = true

	local TerminationFunctions =
		{
			TerminateSpellOnPlayerMidaction,
			TerminateSpellOnAilments,
			TerminateSpellOnRecast,
			TerminateSpellOnTP,
			TerminateSpellOnPetMidaction
		}

	if _G[YAG_SETTINGS]["AutomaticPrecastTermination"] == true then
		for _, TerminationCheck in ipairs(TerminationFunctions) do
			TerminateSpell, TerminateReason = TerminationCheck(SpellAttributes, EVENT_PRECAST, TerminateOnPetMidactionDefault)
			if TerminateSpell then
				break
			end
		end
	end

	if not TerminateSpell then
		TerminateReason = nil
	end

	ChatCheckpointLogged("PrecastTerminateSpell End")
	return TerminateSpell, TerminateReason
end

function PrecastTerminateSwap(SpellAttributes)
	ChatCheckpointLogged("PrecastTerminateSwap Start")
	local TerminateSwap = false
	local TerminateReason = ""

	local TerminationFunctions =
		{
			TerminateSpellOnPetMidaction
		}

	if _G[YAG_SETTINGS]["AutomaticPrecastTermination"] == true then
		for _, TerminationCheck in ipairs(TerminationFunctions) do
			TerminateSwap, TerminateReason = TerminationCheck(SpellAttributes, EVENT_PRECAST, true)
			if TerminateSwap then
				break
			end
		end
	end

	ChatCheckpointLogged("PrecastTerminateSwap End")
	return TerminateSwap, TerminateReason
end

function HookPrecastTerminate(SpellAttributes) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- If it returns true then the spell will be terminated and it will not be cast.
	return false, "Spell will not be terminated"
end

function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It must return a gearset in order proceed properly.
	return PrecastSet
end

function HookPrecastCustomizeDefense(SpellAttributes, PrecastSet) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It must return a gearset in order proceed properly.
	return PrecastSet
end

function HookPrecastCustomizeFinal(SpellAttributes, PrecastSet) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It must return a gearset in order proceed properly.
	return PrecastSet
end