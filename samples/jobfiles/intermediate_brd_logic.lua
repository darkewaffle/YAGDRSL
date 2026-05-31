CreateMod("MainHand", "PgUp  MH", .9, "$%pageup", "Naeg", "Dayb")
CreateMod("OffHand", "PgDn  OH", .91, "$%pagedown", "Dem", "TP", "Ammu")
CreateMod("AutoDW",  "ShF9  DW", 1.1, "~f9", "On")
CreateMod("Debuff",  "CtF9  Debuff",  1.2, "^f9",   "MAcc",   "Duration")
CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")
ConfigureOverride("CtF12 Override", 5, "^f12", "DynaNeck", "Odin")


SetModOrderEngagedOffense ("MainHand", "OffHand", "Offense")
SetModOrderIdleOffense ("MainHand", "OffHand", "Refresh")
AppendModOrderRestingOffense("Refresh")
AppendModOrderMidcastMagicOffense("Debuff")


TrackOffenseBuffs("Troubadour")


SetModValue("MainHand", "Naeg")
SetModValue("OffHand", "Dem")
AssignWeaponLockOptions(MOD_LOCK_MAIN_SUB)
SetWeaponLockMainSub()


HasteDefinitions =
	{
		HasteSpell = 30,
		March = 25,
		GeoHaste = 20
	}

function HookPrecastTerminateSpell(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = "Spell will not be terminated"

	if SpellAttributes["ParentGroup"] == MAP_SPELL_CURE then
		TerminateSpell, TerminateReason = ScaleCure(SpellAttributes, 1.5, 1, 1)
	end

	return TerminateSpell, TerminateReason
end

function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet)

	if SpellAttributes["Category"] == "ws" then
		PrecastSet = CustomizeGearForDayElement(SpellAttributes, PrecastSet, true)
		PrecastSet = CustomizeGearForWeatherElement(SpellAttributes, PrecastSet, true)
	end

	return PrecastSet
end


function HookStatusCustomizeOffense(CharacterStatus, StatusSet)

	if GetModValue("AutoDW") == "On" and CharacterStatus == STATUS_ENGAGED then

		local CurrentHaste = GetCharacterHaste(HasteDefinitions)
		local DualWieldToCap = GetDualWieldToCap(25, CurrentHaste)
		StatusSet = CustomizeDualWield(StatusSet, DualWieldToCap)

	end

	return StatusSet
end

function HookMidcastCustomizeOffense(SpellAttributes, MidcastSet)

	if SpellAttributes["Category"] == "magic" and (SpellAttributes["ParentGroup"] == MAP_SPELL_CURE or SpellAttributes["ParentGroup"] == MAP_SPELL_CURAGA) then
		MidcastSet = CustomizeGearForDayElement(SpellAttributes, MidcastSet, true)
		MidcastSet = CustomizeGearForWeatherElement(SpellAttributes, MidcastSet, true)
	end

	return MidcastSet
end