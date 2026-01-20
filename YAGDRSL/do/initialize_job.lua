require "YAGDRSL/do/set_job_keybinds.lua"
require "YAGDRSL/do/set_job_lockstyle.lua"
require "YAGDRSL/do/set_job_macros.lua"

function InitializeJob()
	SetJobBinds()

	-- Scheduled to limit how quickly commands are relayed to the game.
	-- Specifically sending a Macrobook and Macroset command too quickly can wipe in-game macros.

	coroutine.schedule(SetJobMacroBook, 1)
	coroutine.schedule(SetJobMacroSet,  2)

	-- Since lockstyle update has a short cooldown in-game it can be annoying to quickly change job and then subjob only to have the job change set lockstyle, the subjob change undo it and have to wait and manually reapply.
	-- If there is no lockstyle update pending then schedule the update and set STATE_SET_LOCKSTYLE_PENDING to true.
	-- When SetJobLockStyle runs it will set STATE_SET_LOCKSTYLE_PENDING back to false.
	if not STATE_SET_LOCKSTYLE_PENDING then
		_G[SET_LOCKSTYLE_COROUTINE] = coroutine.schedule(SetJobLockStyle, 3)
		STATE_SET_LOCKSTYLE_PENDING = true
	
	-- If there is a lockstyle update pending then close the scheduled coroutine containing the update and reschedule a new one.
	else
		coroutine.close(_G[SET_LOCKSTYLE_COROUTINE])
		_G[SET_LOCKSTYLE_COROUTINE] = coroutine.schedule(SetJobLockStyle, 3)
	end

end