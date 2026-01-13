CreateMod("Parry",   "ShF10 Parry",   2.1, "~f10",  "+Parry")
CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")

AppendModOrderEngagedDefense("Parry")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

TrackOffenseBuffs("Vallation", "Valiance", "Embolden", "Battuta")