CreateMod("RangedOffense", "ShF9  Ranged", 1.1, "~f9", "RAcc")
SetModOrderMidcastRAOffense("RangedOffense", "TH")

ConfigureOverride("CtF12 Override", 5, "^f12", "+CP")

AssignModOptions("TH", "+TH", "THAoE")
AppendModOrderIdleOffense("TH")
AppendModOrderPrecastWSOffense("TH")

SetModValue("TH", "THAoE")

AssignWeaponLockOptions(MOD_LOCK_MAIN_SUB_RANGE)
SetWeaponLockMainSubRange()

TrackOffenseBuffs("Triple Shot")


function HookOnAftercast(SpellAttributes) -- @Hook
	if SpellAttributes.Name == "Aeolian Edge" then
		if GetModValue("TH", true) == "Off" then
			SetModValue("TH", "THAoE")
		else
			SetModValue("TH", "Off")
		end
	end
end