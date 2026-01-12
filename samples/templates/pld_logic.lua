CreateMod("BlockTP",  "ShF9  BlockTP", true, "^f9",    "+BlockTP")
CreateMod("SIRD",     "ShF10 SIRD",    true, "~f10",   "CureSIRD", "FullSIRD")
CreateMod("Refresh",  "CtF12 Refresh", true, "^f12",   "+Refresh")

AppendModOrderEngagedOffense("BlockTP")
AppendModOrderMidcastMagicDefense("SIRD")
SetModValue("SIRD", "CureSIRD")

AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")