function UpdateTerminateMidaction(CharacterStatus)
	local TerminateUpdate = false
	local TerminateReason = ""
	
	-- midaction() is a Gearswap function that should be true throughout the duration of a midcast and false at all other times.
	-- When true midaction also returns the spell that is currently in progress.
	local PlayerMidactionState, PlayerActionInProgress = midaction()
	local PetMidactionState, PetActionInProgress = pet_midaction()


	-- If character is midaction then terminate status update.
	if PlayerMidactionState then
		local NameInProgress = PlayerActionInProgress["name"]

		TerminateUpdate = true
		TerminateReason = NameInProgress .. " is already in midcast. Terminating status update to preserve midcast set."
	end
	
--[[ @TODO This part will take some thought.

	-- If pet is midaction and character is SMN or BST then terminate action to preserve midcast set.
	elseif PetMidactionState 
	
		if _G[YAG_SETTINGS][""]
		and GetCharacterJobShort() == "SMN" or GetCharacterJobShort() == "BST" then
		local NameInProgress = PetActionInProgress["name"]

		TerminateUpdate = true
		TerminateReason = NameInProgress .. " is already in midcast. Terminating status update."
	end
]]

	return TerminateUpdate, TerminateReason
end

function UpdateTerminateStatus(CharacterStatus)
	local TerminateStatus = false
	local TerminateReason = ""

	local ValidStatuses =
		{
			[STATUS_ENGAGED] = true,
			[STATUS_IDLE] = true,
			[STATUS_RESTING] = true
		}

	if not ValidStatuses[CharacterStatus] then
		TerminateStatus = true
		TerminateReason = "Gear may not be equipped while status =" .. CharacterStatus
	end

	return TerminateStatus, TerminateReason
end