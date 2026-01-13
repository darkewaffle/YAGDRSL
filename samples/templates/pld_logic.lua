CreateMod("BlockTP",  "ShF9  BlockTP", 1.1, "^f9",    "+BlockTP")
CreateMod("SIRD",     "ShF10 SIRD",    2.1, "~f10",   "CureSIRD", "FullSIRD")
CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")

AppendModOrderEngagedOffense("BlockTP")

AppendModOrderMidcastMagicDefense("SIRD")
SetModValue("SIRD", "CureSIRD")

AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")