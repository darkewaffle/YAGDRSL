function TerminateSpellOnRecast(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""

	if SpellAttributes["Category"] == CATEGORY_JA then
		local JARecast = GetRecastJobAbility(SpellAttributes["RecastID"])

		-- 255 = ready, 233 = stratagems, 231 = stratagem abilities. Temporary fix until implementation of 'get charges' logic.
		if GetRecastJobAbility(SpellAttributes["RecastID"]) > 0 and SpellAttributes["RecastID"] ~= 255 and SpellAttributes["RecastID"] ~= 233 and SpellAttributes["RecastID"] ~= 231 then
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