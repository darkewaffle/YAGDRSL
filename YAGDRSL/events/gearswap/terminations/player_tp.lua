function TerminateSpellOnTP(SpellAttributes)
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