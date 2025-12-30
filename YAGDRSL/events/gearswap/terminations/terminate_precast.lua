require "YAGDRSL/get/get_character.lua"

function PrecastTerminateMidaction(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""
	
	-- midaction() is a Gearswap function that should be true throughout the duration of a midcast and false at all other times.
	-- When true midaction also returns the spell that is currently in progress.
	local PlayerMidactionState, PlayerActionInProgress = midaction()
	local PetMidactionState, PetActionInProgress = pet_midaction()


	-- If character is midaction then terminate starting a new action.
	if PlayerMidactionState then
		local NameInProgress = PlayerActionInProgress["name"]

		TerminateSpell = true
		TerminateReason = NameInProgress .. " is already in midcast. Terminating " .. SpellAttributes["Name"]
	end
	
--[[ @TODO This part will take some thought.

	-- If pet is midaction and character is SMN or BST then terminate action to preserve midcast set.
	elseif PetMidactionState 
	
		if _G[YAG_SETTINGS][""]
		and GetCharacterJobShort() == "SMN" or GetCharacterJobShort() == "BST" then
		local NameInProgress = PetActionInProgress["name"]

		TerminateSpell = true
		TerminateReason = NameInProgress .. " is already in midcast. Terminating "
	end
]]

	return TerminateSpell, TerminateReason
end

function PrecastTerminateAilments(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""
	
	local AllActions = {[CATEGORY_ITEM]=true, [CATEGORY_JA]=true, [CATEGORY_MAGIC]=true, [CATEGORY_RA]=true, [CATEGORY_WS]=true}
	local Ailments =
	{
		[0] = AllActions,									-- KO / dead
		[6] = {[CATEGORY_MAGIC]=true},						-- Silence
		[7] = AllActions,									-- Petrify
		[10] = AllActions,									-- Stun
		[14] = AllActions,									-- Charm
		[17] = AllActions,									-- Charm
		[16] = {[CATEGORY_JA]=true, [CATEGORY_WS]=true},	-- Amnesia
		[28] = AllActions									-- Terror
	}

	local PlayerBuffs = GetCharacterBuffs()

	for _, BuffID in pairs(PlayerBuffs) do
		if Ailments[BuffID] and Ailments[BuffID][SpellAttributes["Category"]] then
			TerminateSpell = true
			TerminateReason = "Action cannot be started due to status ailment '" .. GetBuffName(BuffID) .. "'. Terminating " .. SpellAttributes["Name"]
			break
		end
	end

	return TerminateSpell, TerminateReason
end

function PrecastTerminateRecasts(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""

	if SpellAttributes["Category"] == CATEGORY_JA then
		if GetRecastJobAbility(SpellAttributes["RecastID"]) > 0 then
			TerminateSpell = true
			TerminateReason = "Job ability is still on recast = " .. SpellAttributes["Name"]
		end

	elseif SpellAttributes["Category"] == CATEGORY_MAGIC then
		if GetRecastSpell(SpellAttributes["RecastID"]) > 0 then
			TerminateSpell = true 
			TerminateReason = "Spell is still on recast = " .. SpellAttributes["Name"]
		end

	end

	return TerminateSpell, TerminateReason
end

function PrecastTerminateTP(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""

	if SpellAttributes["Category"] == CATEGORY_WS then
		if GetCharacterTP() < 1000 then
			TerminateSpell = true
			TerminateReason = "Insufficient TP to perform WS = " .. SpellAttributes["Name"]
		end
	end

	return TerminateSpell, TerminateReason
end