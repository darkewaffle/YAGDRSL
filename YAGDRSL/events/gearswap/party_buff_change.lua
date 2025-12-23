--@@require "YAGDRSL/debug/chat.lua"

function party_buff_change(member_table, name, gain, buffid)
	--ChatBlankLine()
	--ChatCheckpoint("party_buff_change start")

	HookOnPartyBuffChange(member_table, name, gain, buffid) -- @Hook

	--ChatCheckpoint("party_buff_change end")
end

function HookOnPartyBuffChange(member_table, name, gain, buffid) -- @Hook
	-- This is a function the user can override to implement custom logic.
end