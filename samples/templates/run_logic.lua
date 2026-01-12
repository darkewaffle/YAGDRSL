CreateMod("Parry",   "ShF10 Parry",   2.1, "~f10",  "+Parry")
CreateMod("Refresh", "CtF12 Refresh", 4.1, "^f12",  "+Refresh")

AppendModOrderEngagedDefense("Parry")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Vallation", "Valiance", "Embolden", "Battuta")