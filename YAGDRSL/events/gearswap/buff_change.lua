function buff_change(name,gain,buff_details)
	--ChatBlankLine()
	--ChatCheckpoint("buff_change start", name)

	local BuffName = name
	local BuffState = gain
	local BuffIsTracked = GetIsBuffTracked(BuffName)

	if BuffIsTracked then
		OnTrackedBuffChange(BuffName, BuffState)
		ForceStatusUpdate(EVENT_BUFF_CHANGE)
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