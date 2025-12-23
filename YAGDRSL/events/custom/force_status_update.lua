--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/debug/chat_objects.lua"

--@@require "YAGDRSL/get/get_character.lua"
--@@require "YAGDRSL/get/sets/get_set_status.lua"
--@@require "YAGDRSL/do/equip_safe.lua"

-- @User
-- Not a Gearswap event. Logic to manually trigger an update to equip the gear for the character's current status.
-- Called to force an update to the character's equipment based off the character's current status.

function ForceStatusUpdate()
	ChatCheckpoint("ForceStatusUpdate Start")

	local CharacterStatus = GetCharacterStatus()
	ChatDebug("CharacterStatus", CharacterStatus)
	local StatusSet = {}
	StatusSet = GetStatusSet(CharacterStatus)

	ChatGearSet(StatusSet, EVENT_FORCED_UPDATE)
	EquipSafe(StatusSet, EVENT_FORCED_UPDATE)

	ChatCheckpoint("ForceStatusUpdate End")
	ChatBlankLine()
end


-- Wrapper for ForceStatusUpdate that is only called by a cycle command update.
-- Sets STATE_CYCLE_UPDATE_PENDING to to false to indicate the update has been completed and is no longer pending.
function ForceStatusUpdateFromCycle()
	ForceStatusUpdateCommand()
	STATE_CYCLE_UPDATE_PENDING = false
end

function ForceStatusUpdateCommand()
	-- GearSwap's equip function will/may not respond if called through coroutine or a Windower event.
	-- Sending a self_command to update is an acceptable workaround.
	send_command('gs c update')
end