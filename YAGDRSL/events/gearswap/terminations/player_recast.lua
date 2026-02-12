function TerminateSpellOnRecast(SpellAttributes)
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