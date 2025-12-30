local PreviousCoordinates = {["x"] = player.x or 0, ["y"] = player.y or 0}
local LastPlayerState = STATE_STATIONARY

function GetPlayerMovementStateHasChanged()
	local PlayerState = GetPlayerMovementState()

	if PlayerState ~= LastPlayerState then
		--ChatDebug("Movement state changed")
		LastPlayerState = PlayerState
		return true
	else
		--ChatDebug("Movement state did not change")
		return false
	end
end

function GetPlayerMovementState()

	local CurrentCoordinates = {}
	CurrentCoordinates.x, CurrentCoordinates.y = GetCharacterCoordinates()

	if TickEvaluateMovementMinimumDistance == 0 then

		if CurrentCoordinates.x ~= PreviousCoordinates.x or CurrentCoordinates.y ~= PreviousCoordinates.y then
			PreviousCoordinates.x = CurrentCoordinates.x
			PreviousCoordinates.y = CurrentCoordinates.y
			--ChatDebug("Player is", STATE_MOVING)
			SetTracker(STATE_MOVING, STATE_MOVING)
			return STATE_MOVING
		else
			--ChatDebug("Player is", STATE_STATIONARY)
			UnsetTracker(STATE_MOVING)
			return STATE_STATIONARY
		end

	elseif TickEvaluateMovementMinimumDistance > 0 then

		local DeltaX = (CurrentCoordinates.x - PreviousCoordinates.x)^2
		local DeltaY = (CurrentCoordinates.y - PreviousCoordinates.y)^2
		local DistanceSquared = DeltaX + DeltaY
		local Distance = math.sqrt(DistanceSquared)

		PreviousCoordinates.x = CurrentCoordinates.x
		PreviousCoordinates.y = CurrentCoordinates.y

		if Distance >= TickEvaluateMovementMinimumDistance then
			--ChatDebug("Player is", STATE_MOVING)
			SetTracker(STATE_MOVING, STATE_MOVING)
			return STATE_MOVING
		else
			--ChatDebug("Player is", STATE_STATIONARY)
			UnsetTracker(STATE_MOVING)
			return STATE_STATIONARY
		end

	end

end