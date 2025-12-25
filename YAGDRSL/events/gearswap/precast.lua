--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/debug/chat_objects.lua"
--@@require "YAGDRSL/debug/performance.lua"

--@@require "YAGDRSL/do/auto_cancel.lua"
--@@require "YAGDRSL/get/mods/get_mod_total.lua"
--@@require "YAGDRSL/get/overrides/get_override.lua"
--@@require "YAGDRSL/get/get_recast.lua"
--@@require "YAGDRSL/get/get_spellattributes.lua"
--@@require "YAGDRSL/get/sets/get_set_event.lua"

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
		ChatWarning("Precast Terminating: " .. TerminateReason, SpellAttributes["Name"])
		cancel_spell()
		return
	end

	TerminateStatus, TerminateReason = HookPrecastTerminate(SpellAttributes) -- @Hook
	if TerminateStatus then
		TerminateReason = TerminateReason --or "TerminateReason Undefined"
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

	local PrecastSet = PrecastContainer(SpellAttributes)
	ChatGearSet(PrecastSet, EVENT_PRECAST)
	EquipSafe(PrecastSet, EVENT_PRECAST)

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

function PrecastTerminate(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""

	if _G[YAG_SETTINGS]["AutomaticPrecastTermination"] == true then

	--	if STATE_ACTION_IN_PROGRESS then
	--		TerminateSpell = true
	--		TerminateReason = "Another action is already in progress."
	--		return TerminateSpell, TerminateReason
	--	end

		TerminateSpell, TerminateReason = PrecastTerminateByStatus(SpellAttributes)

		if SpellAttributes["Category"] == CATEGORY_WS then
			TerminateSpell = TerminateSpell or GetCharacterTP() < 1000
			TerminateReason = "Insufficient TP to perform WS -"
		end

		if SpellAttributes["Category"] == CATEGORY_JA then
			TerminateSpell = TerminateSpell or GetRecastJobAbility(SpellAttributes["RecastID"]) > 0
			TerminateReason = "Job ability is still on recast -"
		end

		if SpellAttributes["Category"] == CATEGORY_MAGIC then
			TerminateSpell = TerminateSpell or GetRecastSpell(SpellAttributes["RecastID"]) > 0
			TerminateReason = "Spell is still on recast -"
		end
	end

	if not TerminateSpell then
		TerminateReason = nil
	end

	return TerminateSpell, TerminateReason
end

function PrecastTerminateByStatus(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""
	
	local AllActions = {[CATEGORY_ITEM]=true, [CATEGORY_JA]=true, [CATEGORY_MAGIC]=true, [CATEGORY_RA]=true, [CATEGORY_WS]=true}
	local Ailments = 
	{
		[6] = {[CATEGORY_MAGIC]=true},						-- Silence
		[7] = AllActions,									-- Petrify
		[10] = AllActions,									-- Stun
		[16] = {[CATEGORY_JA]=true, [CATEGORY_WS]=true},	-- Amnesia
		[28] = AllActions									-- Terror
	}

	local PlayerBuffs = GetCharacterBuffs()

	for _, BuffID in pairs(PlayerBuffs) do
		if Ailments[BuffID] and Ailments[BuffID][SpellAttributes["Category"]] then
			TerminateSpell = true
			TerminateReason = "Action cannot be completed due to status ailment " .. GetBuffName(BuffID)
			break
		end
	end

	return TerminateSpell, TerminateReason
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