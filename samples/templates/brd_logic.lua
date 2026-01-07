CreateMod("Debuff",   "ShF9  Debuff",  true, "~f9",   "MAcc",   "Duration")
CreateMod("Refresh",  "CtF12 Refresh", true, "^f12",  "+Refresh")

AppendModOrderMidcastMagicOffense("Debuff")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Troubadour")