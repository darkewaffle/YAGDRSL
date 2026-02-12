function ForceStatusUpdate(Source, IgnoreWeaponLock)
	ChatCheckpoint("ForceStatusUpdate Start")

	local UpdateSource = Source or EVENT_FORCED_UPDATE

	local CharacterStatus = GetCharacterStatus()
	ChatDebug("CharacterStatus", CharacterStatus)

	local StatusSet = {}

	local TerminateStatus = false
	local TerminateReason = ""
	TerminateStatus, TerminateReason = ForceStatusUpdateTerminate(UpdateSource)
	if TerminateStatus then
		ChatWarning("ForceStatusUpdate from " .. UpdateSource .. " Terminating: ", TerminateReason)
		WriteDevLog("ForceStatusUpdate from " .. UpdateSource .. " Terminating: ", TerminateReason)
		return
	else
		StatusSet = GetStatusSet(CharacterStatus, UpdateSource)
	end

	ChatGearSet(StatusSet, UpdateSource)
	EquipSafe(StatusSet, UpdateSource, IgnoreWeaponLock)

	ChatCheckpoint("ForceStatusUpdate End")
	ChatBlankLine()
end

function ForceStatusUpdateTerminate(UpdateSource)
	ChatCheckpointLogged("ForceStatusUpdate Termination Start")

	local TerminateUpdate = false
	local TerminateReason = ""

	local TerminationFunctions =
		{
			TerminateUpdateOnPlayerMidaction,
			TerminateUpdateOnPetMidaction
		}

	for _, TerminationCheck in ipairs(TerminationFunctions) do
		TerminateUpdate, TerminateReason = TerminationCheck(UpdateSource)
		if TerminateUpdate then
			break
		end
	end

	ChatCheckpointLogged("ForceStatusUpdate Termination End")
	return TerminateUpdate, TerminateReason
end


-- Wrapper for ForceStatusUpdate that is only called by a cycle command update.
-- Sets STATE_CYCLE_UPDATE_PENDING to to false to indicate the update has been completed and is no longer pending.
function ForceStatusUpdateFromCycle()
	ForceStatusUpdateCommand(EVENT_CYCLE_UPDATE, false)
	STATE_CYCLE_UPDATE_PENDING = false
end

function ForceStatusUpdateFromCycleNoLock()
	ForceStatusUpdateCommand(EVENT_CYCLE_UPDATE, true)
	STATE_CYCLE_UPDATE_PENDING = false
end

function ForceStatusUpdateCommand(Source, IgnoreLock)
	-- GearSwap's equip function will/may not respond if called through coroutine or a Windower event.
	-- Sending a self_command to update is an acceptable workaround.

	local Source = Source or "ForceStatusUpdateCommand"
	local IgnoreLock = IgnoreLock or "false"
	local UpdateCommand = "gs c update " .. Source .. " " .. tostring(IgnoreLock)

	send_command(UpdateCommand)
end



function ForceStatusUpdateTick()
	-- GearSwap's equip function will/may not respond if called through coroutine or a Windower event.
	-- Sending a self_command to update is an acceptable workaround.
	-- Split from ForceStatusUpdateCommand so that separate Source parameters are passed to GetStatusSet to improve logging.
	send_command('gs c updatetick')
end