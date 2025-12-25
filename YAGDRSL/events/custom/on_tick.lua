--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/do/create_tracker.lua"
--@@require "YAGDRSL/get/get_character.lua"

--@@require "YAGDRSL/events/custom/force_status_update.lua"
require "YAGDRSL/events/custom/ticks/player_facing.lua"
require "YAGDRSL/events/custom/ticks/player_movement.lua"

local TickCounter = 1
local LastTickUpdate = 0

function RegisterOnTick()
	if _G[YAG_SETTINGS]["TickEnable"] == true then
		windower.raw_register_event('prerender', OnTick)
		RegisterOnTickTrackers()
	end
end

function RegisterOnTickTrackers()
	if _G[YAG_SETTINGS]["TickEvaluateMovement"] then
		CreateTrackerQueued(STATE_MOVING, MOD_CLASS_DEFENSE)
	end

	if _G[YAG_SETTINGS]["TickEvaluateFacing"] then
		CreateTrackerQueued(TRACK_PLAYER_FACING, MOD_CLASS_OFFENSE)
	end
end

function OnTick()

	local UpdateStatus = false

	if TickCounter <= _G[YAG_SETTINGS]["TickInterval"] then
		TickCounter = TickCounter + 1
		return
	else
		TickCounter = 1

		if _G[YAG_SETTINGS]["TickEvaluateMovement"] then
			UpdateStatus = UpdateStatus or GetPlayerMovementStateHasChanged()
		end

		if _G[YAG_SETTINGS]["TickEvaluateFacing"] then
			if GetCharacterStatus() == STATUS_ENGAGED and GetCharacterHasTarget() then
				UpdateStatus = UpdateStatus or GetPlayerFacingStateHasChanged()
			end
		end

		if _G[YAG_SETTINGS]["TickEvaluateHook"] then
			UpdateStatus = UpdateStatus or HookOnTick() -- @Hook
		end

	end

	local SecondsSinceLastTickUpdate = os.time() - LastTickUpdate
	if UpdateStatus and SecondsSinceLastTickUpdate >= TickForceUpdateCooldown then
		LastTickUpdate = os.time()

		--ForceStatusUpdate leads to an equip call which will not work if called outside of a GearSwap event.
		--OnTick is not a gearswap event, therefore we need to call update from a command instead.
		ForceStatusUpdateCommand()
	end

end

function HookOnTick() -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It will only be called if the setting TickEvaluateHook = true
	-- Be careful with tick. If run with a low TickInterval value (<30) or if you do an extensive amount of work in a tick event then it can degrade performance.
end