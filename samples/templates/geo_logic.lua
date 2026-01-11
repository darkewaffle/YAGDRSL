AssignModOptions("Offense", "MAcc", "MDmg")
CreateMod("Refresh",     "CtF12 Refresh", true, "^f12",  "+Refresh")
CreateMod("Magic Burst", "ShF9 MBurst",   true, "~f9",   "+MBurst")

AppendModOrderMidcastMagicOffense("Magic Burst")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackPetNameAsOffenseMod()