CreateMod("Debuff",        "ShF9  Debuff",  1.1, "~f9",   "EnfAcc")
CreateMod("MagicOffense",  "CtF9  MagOff",  1.2, "^f9",   "NukeAcc", "MDmg")
CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")

AppendModOrderMidcastMagicOffense("Debuff")
AppendModOrderMidcastMagicOffense("MagicOffense")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Composure", "Saboteur", "Stymie")