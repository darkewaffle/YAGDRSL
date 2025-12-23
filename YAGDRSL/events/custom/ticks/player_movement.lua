--@@require "YAGDRSL/debug/chat.lua"

local PreviousCoordinates = {["x"] = player.x, ["y"] = player.y}
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

end