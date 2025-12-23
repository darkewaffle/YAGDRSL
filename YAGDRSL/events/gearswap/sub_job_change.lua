--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/do/initialize_job.lua"

function sub_job_change(new, old)
	ChatBlankLine()
	ChatCheckpoint("sub_job_change start: NEW = ", new)

	InitializeJob()

	HookOnSubJobChange(new, old) -- @Hook

	ChatCheckpoint("sub_job_change end")
end

function HookOnSubJobChange(new, old) -- @Hook
	-- This is a function the user can override to implement custom logic.
end