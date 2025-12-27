function filtered_action(spell)
	--ChatBlankLine()
	--ChatCheckpoint("filtered_action start", spell.name)

	local SpellAttributes = GetSpellAttributes(spell)
	HookOnFilteredAction(SpellAttributes) -- @Hook
	
	--ChatCheckpoint("filtered_action end")
end

function HookOnFilteredAction(SpellAttributes) -- @Hook
	-- This is a function the user can override to implement custom logic.
end