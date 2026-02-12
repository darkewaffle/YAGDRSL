function TerminateSpellOnPetMidaction(SpellAttributes, Source, DefaultResult)
	local TerminateSpell = false
	local TerminateReason = ""

	--local WhiteList = GetPetMidactionWhitelist()
	--local BlackList = GetPetMidActionBlacklist()

	local WhiteList = {}
	local BlackList = {}

	if DefaultResult ~= false then
		DefaultResult = true
	end

	-- pet_midaction() is a Gearswap function that should be true throughout the duration of a pet action and false at all other times.
	-- When true midaction also returns the spell that is currently in progress.
	local PetMidactionState, PetActionInProgress = pet_midaction()
	local MainJob = GetCharacterJobShort()

	-- If character is midaction then terminate starting a new action.
	if PetMidactionState and (MainJob == "BST" or MainJob == "SMN") then

		if WhiteList and WhiteList[SpellAttributes["SpellName"]] then
			TerminateSpell = false
			TerminateReason = "TSOPetMA Pet: " .. PetActionInProgress["name"] .. " is in progress. Permitting whitelisted " .. SpellAttributes["Name"] .. " " .. Source .. "."

		elseif BlackList and BlackList[SpellAttributes["Spellname"]] then
			TerminateSpell = true
			TerminateReason = "TSOPetMA Pet: " .. PetActionInProgress["name"] .. " is in progress. Terminating blacklisted" .. SpellAttributes["Name"] .. " " .. Source .. "."
		
		else
			TerminateSpell = DefaultResult
			TerminateReason = "TSOPetMA Pet: " .. PetActionInProgress["name"] .. " is in progress. Termination of " .. SpellAttributes["Name"] .. " = " .. tostring(DefaultResult) .. " from " .. Source .. "."
		end

	end

	return TerminateSpell, TerminateReason
end

function TerminateUpdateOnPetMidaction(Source)
	local TerminateUpdate = false
	local TerminateReason = ""

	-- pet_midaction() is a Gearswap function that should be true throughout the duration of a pet action and false at all other times.
	-- When true midaction also returns the spell that is currently in progress.
	local PetMidactionState, PetActionInProgress = pet_midaction()
	local MainJob = GetCharacterJobShort()

	-- If character is midaction then terminate a status set update.
	if PetMidactionState and (MainJob == "BST" or MainJob == "SMN") then
		TerminateUpdate = true
		TerminateReason = "TUOPetMA Pet: " .. PetActionInProgress["name"] .. " is in progress. Terminating set update from " .. Source .. "."
	end

	return TerminateUpdate, TerminateReason
end