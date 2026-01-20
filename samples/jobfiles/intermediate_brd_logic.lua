CreateMod("Debuff",   "ShF9  Debuff",  1.1, "~f9",   "MAcc",   "Duration")
CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")

AppendModOrderMidcastMagicOffense("Debuff")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Troubadour")

SetWeaponLockMainSub()