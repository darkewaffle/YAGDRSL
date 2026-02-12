CreateMod("AutoDW",  "ShF9  DW", 1.1, "~f9", "On")
CreateMod("Debuff",  "CtF9  Debuff",  1.2, "^f9",   "MAcc",   "Duration")
CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")

ConfigureOverride("CtF12 Override", 5, "^f12", "DynaNeck", "Cat")

AppendModOrderMidcastMagicOffense("Debuff")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Troubadour")

AssignWeaponLockOptions(MOD_LOCK_ALL, MOD_LOCK_MAIN_SUB, MOD_LOCK_MAIN_SUB_AMMO)
SetWeaponLockMainSubAmmo()


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

function HookStatusCustomizeOffense(CharacterStatus, StatusSet)

	if GetModValue("AutoDW") == "On" and CharacterStatus == STATUS_ENGAGED then

		local CurrentHaste = GetCharacterHaste(HasteDefinitions)
		local DualWieldToCap = GetDualWieldToCap(25, CurrentHaste)
		StatusSet = CustomizeDualWield(StatusSet, DualWieldToCap)

	end

	return StatusSet
end