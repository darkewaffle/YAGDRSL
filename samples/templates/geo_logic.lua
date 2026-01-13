AssignModOptions("Offense", "MAcc", "MDmg")
CreateMod("MagicBurst", "ShF9 MBurst",   1.1, "~f9",   "+MBurst")
CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")

AppendModOrderMidcastMagicOffense("MagicBurst")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackPetNameAsOffenseMod()