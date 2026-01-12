AssignModOptions("Offense", "MAcc", "MDmg")
CreateMod("Magic Burst", "ShF9  MBurst",   true, "~f9",   "+MBurst")
CreateMod("Refresh",     "CtF12 Refresh", true, "^f12",  "+Refresh")


AppendModOrderMidcastMagicOffense("Magic Burst")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackDefenseBuffs("Mana Wall")