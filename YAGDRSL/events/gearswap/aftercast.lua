function aftercast(spell)
	ChatBlankLine()
	ChatCheckpointLogged("Aftercast Start")

	local SpellAttributes = GetSpellAttributes(spell)

	AfterCastContainer(EVENT_AFTERCAST, SpellAttributes["IgnoreWeaponLock"])
	HookOnAftercast(SpellAttributes) -- @Hook

	ChatCheckpointLogged("Aftercast End", spell.name)
end

-- Isolated into function so that it can be re-used in pet_aftercast.
function AfterCastContainer(EventName, IgnoreWeaponLock)

	local CharacterStatus = GetCharacterStatus()
	ChatDebug(EventName .. ", CharacterStatus =", CharacterStatus)
	local StatusSet = {}
	StatusSet = GetStatusSet(CharacterStatus, EVENT_AFTERCAST)

	ChatGearSet(StatusSet, EventName)
	EquipSafe(StatusSet, EventName, IgnoreWeaponLock)

end

function HookOnAftercast(SpellAttributes) -- @Hook
	-- This is a function the user can override to implement custom logic.
end