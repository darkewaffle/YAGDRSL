--@@require "YAGDRSL/do/math_helpers.lua"
--@@require "YAGDRSL/get/get_character.lua"
--@@require "YAGDRSL/get/get_target.lua"

local LastPlayerState = STATE_PLAYER_NOT_FACING_TARGET_FACE

function GetPlayerFacingStateHasChanged()
	local PlayerState = GetPlayerFacingTargetAndTargetFacingPlayer()

	if PlayerState ~= LastPlayerState then
		--ChatDebug("Player facing target face state has changed")
		LastPlayerState = PlayerState
		return true
	else
		--ChatNotice("Player facing target face state has not changed")
		return false
	end
end

function GetPlayerFacingTargetAndTargetFacingPlayer()
	local PlayerFacing = RadiansToDegrees(GetCharacterFacing())
	local TargetFacing = RadiansToDegrees(GetTargetFacing())

	if TargetFacing then

		local FacingDifference = math.abs(PlayerFacing - TargetFacing)
		--ChatDebug("FacingDifference", FacingDifference)

		if FacingDifference >= 165 and FacingDifference <= 195 then
			--ChatDebug("Player and target facing each other")
			SetTracker(STATE_PLAYER_FACING_TARGET_FACE, STATE_PLAYER_FACING_TARGET_FACE)
			return STATE_PLAYER_FACING_TARGET_FACE
		else
			--ChatDebug("Player and target not facing each other")
			UnsetTracker(STATE_PLAYER_FACING_TARGET_FACE)
			return STATE_PLAYER_NOT_FACING_TARGET_FACE
		end

	else
		--ChatDebug("Player has no target")
		UnsetTracker(STATE_PLAYER_FACING_TARGET_FACE)
		return STATE_PLAYER_NOT_FACING_TARGET_FACE
	end
end