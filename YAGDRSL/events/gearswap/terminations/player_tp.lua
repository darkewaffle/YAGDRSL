function TerminateSpellOnTP(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = ""

	if SpellAttributes["Category"] == CATEGORY_WS then
		if GetCharacterTP() < 1000 then
			TerminateSpell = true
			TerminateReason = "Insufficient TP to perform WS = " .. SpellAttributes["Name"]
		end
	elseif SpellAttributes["Category"] == CATEGORY_JA and SpellAttributes["ParentGroup"] == MAP_JA_STEP then
		if GetCharacterTP() < 100 then
			TerminateSpell = true
			TerminateReason = "Insufficient TP to perform Step = " .. SpellAttributes["Name"]
		end
	end

	return TerminateSpell, TerminateReason
end