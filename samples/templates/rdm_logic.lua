CreateMod("Debuff",        "ShF9  Debuff",  true, "~f9",   "EnfAcc")
CreateMod("Magic Offense", "CtF9  MagOff",  true, "^f9",   "NukeAcc", "MDmg")
CreateMod("Refresh",       "CtF12 Refresh", true, "^f12",  "+Refresh")

AppendModOrderMidcastMagicOffense("Debuff")
AppendModOrderMidcastMagicOffense("Magic Offense")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Composure", "Saboteur", "Stymie")