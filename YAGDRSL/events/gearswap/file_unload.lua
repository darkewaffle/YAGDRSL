function file_unload(file_name)
	ChatBlankLine()
	ChatDebug("Unloading file_name = ", file_name)

	ClearTrackedKeyBinds()
	UnregisterWindowerEvents()
	HookOnFileUnload(file_name) -- @Hook

	ChatCheckpoint("file_unload end")
end

function HookOnFileUnload(file_name) -- @Hook
	-- This is a function the user can override to implement custom logic.
end