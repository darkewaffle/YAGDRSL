function TerminateSpellOnAilments(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""
	
	local AllActions = {[CATEGORY_ITEM]=true, [CATEGORY_JA]=true, [CATEGORY_MAGIC]=true, [CATEGORY_RA]=true, [CATEGORY_WS]=true}
	local Ailments =
	{
		[0] = AllActions,									-- KO / dead
		[2] = AllActions,									-- Sleep
		[6] = {[CATEGORY_MAGIC]=true},						-- Silence
		[7] = AllActions,									-- Petrify
		[10] = AllActions,									-- Stun
		[14] = AllActions,									-- Charm
		[16] = {[CATEGORY_JA]=true, [CATEGORY_WS]=true},	-- Amnesia
		[17] = AllActions,									-- Charm
		[19] = AllActions,									-- Sleep
		[28] = AllActions,									-- Terror
		[29] = {[CATEGORY_MAGIC]=true},						-- Mute
		[193] = AllActions,									-- Lullaby
		[261] = {[CATEGORY_JA]=true, [CATEGORY_WS]=true},	-- Impairment (Nyzul)
		[262] = {[CATEGORY_MAGIC]=true},					-- Omerta (Nyzul)
		[633] = AllActions									-- Animated (Berserk'd)
	}

	local PlayerBuffs = GetCharacterBuffs()

	for _, BuffID in pairs(PlayerBuffs) do
		if Ailments[BuffID] and Ailments[BuffID][SpellAttributes["Category"]] then
			TerminateSpell = true
			TerminateReason = "Action cannot be started due to status ailment '" .. GetBuffName(BuffID) .. "'. Terminating " .. SpellAttributes["Name"] .. "."
			break
		end
	end

	return TerminateSpell, TerminateReason
end