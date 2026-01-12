AssignModOptions("Offense", "MAcc", "MDmg")
CreateMod("Magic Burst", "ShF9  MBurst",   1.1, "~f9",   "+MBurst")
CreateMod("Refresh",     "CtF12 Refresh",  4.1, "^f12",  "+Refresh")

AppendModOrderMidcastMagicOffense("Magic Burst")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackDefenseBuffs("Mana Wall")