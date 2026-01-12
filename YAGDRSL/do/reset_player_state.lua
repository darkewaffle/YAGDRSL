function ResetPlayerStateVariables()
	STATE_CYCLE_UPDATE_PENDING = false

	if STATE_TRACK_PET then
		ClearPetNameTracker()
	end

end