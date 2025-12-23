--@@require "YAGDRSL/debug/chat.lua"

function indi_change(indi_table, gain)
	ChatBlankLine()
	ChatCheckpoint("indi_change start", name)

	HookOnIndiChange(indi_table, gain) -- @Hook

	ChatCheckpoint("indi_change end")
end

function HookOnIndiChange(indi_table, gain) -- @Hook
	-- This is a function the user can override to implement custom logic.
end