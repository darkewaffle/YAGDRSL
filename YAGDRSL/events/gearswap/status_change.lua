function status_change(new, old)
	ChatBlankLine()
	ChatCheckpointLogged("status_change start: NEW =", new)

	local NewStatus = new
	local OldStatus = old
	local StatusSet = {}
	StatusSet = GetStatusSet(NewStatus, EVENT_STATUS_CHANGE)
	
	ChatGearSet(StatusSet, EVENT_STATUS_CHANGE)
	EquipSafe(StatusSet, EVENT_STATUS_CHANGE)

	HookOnStatusChange(NewStatus, OldStatus) -- @Hook

	ChatCheckpointLogged("status_change end")
end

function HookOnStatusChange(NewStatus, OldStatus) -- @Hook
	-- This is a function the user can override to implement custom logic.
end