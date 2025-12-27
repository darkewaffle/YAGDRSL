function pretarget(spell)
	--ChatBlankLine()
	--ChatCheckpoint("pretarget start", spell.name)

	HookOnPreTarget(spell) -- @Hook

	--ChatCheckpoint("pretarget end")
	--ChatBlankLine()
end

function HookOnPreTarget(spell) -- @Hook
	-- This is a function the user can override to implement custom logic.
end