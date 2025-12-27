function buff_refresh(name, gain, buff_details)
	--ChatBlankLine()
	--ChatCheckpoint("buff_refresh start", name)

	local BuffName = name
	local BuffState = gain
	local BuffIsTracked = GetIsBuffTracked(BuffName)

	if BuffIsTracked then
		OnTrackedBuffRefresh(BuffName, BuffState)
	end

	HookOnBuffRefresh(BuffName, BuffState) -- @Hook

	--ChatCheckpoint("buff_refresh end")
end

function OnTrackedBuffRefresh(BuffName, BuffState)
	ChatCheckpoint("OnTrackedBuffRefresh entered")
	ChatCheckpoint("Tracked buff refreshed:", BuffName)
end

function HookOnBuffRefresh(BuffName, BuffState) -- @Hook
	-- This is a function the user can override to implement custom logic.
end