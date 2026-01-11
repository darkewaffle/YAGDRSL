CreateMod("Parry",   "ShF10 Parry",   true, "~f10",  "+Parry")
CreateMod("Refresh", "CtF12 Refresh", true, "^f12",  "+Refresh")

AppendModOrderEngagedDefense("Parry")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Vallation", "Valiance", "Embolden", "Battuta")