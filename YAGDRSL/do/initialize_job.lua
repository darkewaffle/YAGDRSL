require "YAGDRSL/do/set_job_keybinds.lua"
require "YAGDRSL/do/set_job_lockstyle.lua"
require "YAGDRSL/do/set_job_macros.lua"

function InitializeJob()
	SetJobBinds()

	-- Scheduled to limit how quickly commands are relayed to the game.
	-- Specifically sending a Macrobook and Macroset command too quickly can wipe in-game macros.

	coroutine.schedule(SetJobLockStyle, 2)
	coroutine.schedule(SetJobMacroBook, 3)
	coroutine.schedule(SetJobMacroSet,  4)
end