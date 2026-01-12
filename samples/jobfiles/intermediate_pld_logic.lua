	TickEnable = true
	TickInterval = 30
	TickEvaluateMovement = true

	CreateMod("Offense",         "F9    Offense", 1, "f9",    "Hybrid",    "DPS")
	CreateMod("BlockTP",         "ShF9  BlockTP", 2, "~f9",   "BlockTP")
	CreateMod("SIRD",            "F10   SIRD",    3, "f10",   "SIRD", "FullSIRD")
	CreateMod("PreserveHP",      "ShF10 HP",      4, "~f10",  "HPHi", "HPLo")
	CreateMod("MagicalDefense",  "F11   MDef",    5, "f11",   "MEva")
	CreateMod("Refresh",         "ShF11 Refresh", 6, "~f11",  "+Refresh")
	CreateMod("MagicBurst",      "CtF11 MBurst",  7, "^f11",  "MB")

	CreateMod("ShelteredRing", "n/a", 0, nil, "Shelter")
	SetModValue("ShelteredRing", "Shelter")

	SetModValue("SIRD", "SIRD")
	SetModValue("PreserveHP", "HPHi")


	ConfigureDefensePriority("End   DefPriority", true, "end")

	SetModOrderPrecastMagicDefense("PreserveHP")

	SetModOrderMidcastMagicOffense("MagicBurst")
	SetModOrderMidcastMagicDefense("PreserveHP", "SIRD", "ShelteredRing")

	SetModOrderPrecastWSOffense("Offense")
	SetModOrderPrecastWSDefense("PreserveHP")

	SetModOrderEngagedOffense ("Offense", "BlockTP")
	SetModOrderEngagedDefense ("MagicalDefense")

	SetModOrderIdleOffense    ("Refresh")
	SetModOrderIdleDefense    ("MagicalDefense")

	SetModOrderRestingOffense ("Refresh")
	SetModOrderRestingDefense ("MagicalDefense")