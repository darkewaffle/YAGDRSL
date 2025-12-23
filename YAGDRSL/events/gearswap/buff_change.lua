--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/display/display_modorders.lua"
--@@require "YAGDRSL/do/create_tracker.lua"
--@@require "YAGDRSL/do/set_buff_tracking.lua"


function buff_change(name,gain,buff_details)
	--ChatBlankLine()
	--ChatCheckpoint("buff_change start", name)

	local BuffName = name
	local BuffState = gain
	local BuffIsTracked = GetIsBuffTracked(BuffName)

	if BuffIsTracked then
		OnTrackedBuffChange(BuffName, BuffState)
	end

	HookOnBuffChange(BuffName, BuffState) -- @Hook

	--ChatCheckpoint("buff_change end")
end

function OnTrackedBuffChange(BuffName, BuffState)
	ChatCheckpoint("OnTrackedBuffChange entered")

	if BuffState then
		SetTracker(BuffName, BuffName)
	else
		UnsetTracker(BuffName)
	end

end

function HookOnBuffChange(BuffName, BuffState) -- @Hook
	-- This is a function the user can override to implement custom logic.
end