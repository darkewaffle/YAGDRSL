CreateMod("SIRD",     "ShF10 SIRD",    true, "~f10",   "CureSIRD", "FullSIRD")
CreateMod("Refresh",  "CtF12 Refresh", true, "^f12",  "+Refresh")

AppendModOrderMidcastMagicDefense("SIRD")
SetModValue("SIRD", "CureSIRD")

AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")