function TerminateMidcastOnInvalidSpellCategory(SpellAttributes)
	local TerminateMidcast = false
	local TerminateReason = ""

	local ValidMidcastCategories = {[CATEGORY_MAGIC]=true, [CATEGORY_RA]=true, [CATEGORY_ITEM]=true}

	if not ValidMidcastCategories[SpellAttributes["Category"]] then
		TerminateMidcast = true
		TerminateReason = "Midcast swap does not apply to " .. SpellAttributes["Category"] .. "."
	end

	return TerminateMidcast, TerminateReason
end