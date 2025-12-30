function ForceStatusUpdate(Source)
	ChatCheckpoint("ForceStatusUpdate Start")

	local UpdateSource = Source or EVENT_FORCED_UPDATE

	local CharacterStatus = GetCharacterStatus()
	ChatDebug("CharacterStatus", CharacterStatus)
	local StatusSet = {}
	StatusSet = GetStatusSet(CharacterStatus, UpdateSource)

	ChatGearSet(StatusSet, UpdateSource)
	EquipSafe(StatusSet, UpdateSource)

	ChatCheckpoint("ForceStatusUpdate End")
	ChatBlankLine()
end


-- Wrapper for ForceStatusUpdate that is only called by a cycle command update.
-- Sets STATE_CYCLE_UPDATE_PENDING to to false to indicate the update has been completed and is no longer pending.
function ForceStatusUpdateFromCycle()
	ForceStatusUpdateCommand(EVENT_CYCLE_UPDATE)
	STATE_CYCLE_UPDATE_PENDING = false
end

function ForceStatusUpdateCommand()
	-- GearSwap's equip function will/may not respond if called through coroutine or a Windower event.
	-- Sending a self_command to update is an acceptable workaround.
	send_command('gs c update')
end

function ForceStatusUpdateTick()
	-- GearSwap's equip function will/may not respond if called through coroutine or a Windower event.
	-- Sending a self_command to update is an acceptable workaround.
	-- Split from ForceStatusUpdateCommand so that separate Source parameters are passed to GetStatusSet to improve logging.
	send_command('gs c updatetick')
end