function pet_status_change(new, old)
	ChatBlankLine()
	ChatCheckpoint("pet_status_change start: NEW =", new)

	HookOnPetStatusChange(new, old) -- @Hook

	ChatCheckpoint("pet_status_change end")
end

function HookOnPetStatusChange(new, old) -- @Hook
	-- This is a function the user can override to implement custom logic.
end