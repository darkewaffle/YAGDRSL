CreateMod("Debuff",   "ShF9  Debuff",  1.1, "~f9",   "MAcc",   "Duration")
CreateMod("Refresh",  "CtF12 Refresh", 4.1, "^f12",  "+Refresh")

AppendModOrderMidcastMagicOffense("Debuff")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Troubadour")