function pet_midcast(spell)
	ChatBlankLine()
	ChatCheckpointLogged("pet_midcast Start", spell.name)

	local SpellAttributes = GetSpellAttributes(spell)

	local MidcastSet = MidcastContainer(SpellAttributes)
	ChatGearSet(MidcastSet, EVENT_MIDCAST_PET)
	EquipSafe(MidcastSet, EVENT_MIDCAST_PET, SpellAttributes["IgnoreWeaponLock"])

	HookOnPetMidcast(SpellAttributes)

	ChatCheckpointLogged("pet_midcast End")
end

function HookOnPetMidcast(SpellAttributes)
	-- This is a function the user can override to implement custom logic.
end