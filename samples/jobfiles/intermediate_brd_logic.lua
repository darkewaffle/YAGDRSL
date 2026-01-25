CreateMod("Debuff",   "ShF9  Debuff",  1.1, "~f9",   "MAcc",   "Duration")
CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")

AppendModOrderMidcastMagicOffense("Debuff")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Troubadour")

AssignWeaponLockOptions(MOD_LOCK_ALL, MOD_LOCK_MAIN_SUB, MOD_LOCK_MAIN_SUB_AMMO)
SetWeaponLockMainSubAmmo()


function HookPrecastTerminate(SpellAttributes)
	local TerminateSpell = false
	local TerminateReason = "Spell will not be terminated"

	if SpellAttributes["ParentGroup"] == MAP_SPELL_CURE then
		TerminateSpell, TerminateReason = ScaleCure(SpellAttributes, 1.5, 1, 1)
	end

	return TerminateSpell, TerminateReason
end