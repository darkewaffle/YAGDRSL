--@@require "YAGDRSL/do/math_helpers.lua"
--@@require "YAGDRSL/get/get_character.lua"
--@@require "YAGDRSL/get/get_target.lua"

local LastPlayerState = STATE_PLAYER_FACING_OTHER

function GetPlayerFacingStateHasChanged()
	local PlayerState = GetPlayerFacingTargetAndTargetFacingPlayer()

	if PlayerState ~= LastPlayerState then
		--ChatDebug("Player facing target state has changed")
		LastPlayerState = PlayerState
		return true
	else
		--ChatNotice("Player facing target state has not changed")
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
			--ChatDebug("Player facing target face")
			SetTracker(TRACK_PLAYER_FACING, STATE_PLAYER_FACING_FRONT)
			return STATE_PLAYER_FACING_FRONT
		elseif FacingDifference <= 15 or Facing Difference >= 345
			--ChatDebug("Player facing target back")
			SetTracker(TRACK_PLAYER_FACING, STATE_PLAYER_FACING_BACK)
			return STATE_PLAYER_FACING_BACK
		else
			--ChatDebug("Player not facing face or back")
			UnsetTracker(TRACK_PLAYER_FACING)
			return STATE_PLAYER_FACING_OTHER
		end

	else
		--ChatDebug("Player has no target")
		UnsetTracker(TRACK_PLAYER_FACING)
		return STATE_PLAYER_FACING_OTHER
	end
end