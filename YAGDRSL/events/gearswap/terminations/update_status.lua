function TerminateUpdateOnInvalidCharacterStatus(CharacterStatus)
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
		TerminateReason = "Gear may not be equipped while status = " .. CharacterStatus
	end

	return TerminateStatus, TerminateReason
end