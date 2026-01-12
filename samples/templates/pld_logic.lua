CreateMod("BlockTP",  "ShF9  BlockTP", 1.1, "^f9",    "+BlockTP")
CreateMod("SIRD",     "ShF10 SIRD",    2.1, "~f10",   "CureSIRD", "FullSIRD")
CreateMod("Refresh",  "CtF12 Refresh", 4.1, "^f12",   "+Refresh")

AppendModOrderEngagedOffense("BlockTP")

AppendModOrderMidcastMagicDefense("SIRD")
SetModValue("SIRD", "CureSIRD")

AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")