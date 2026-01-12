	TickEnable = true
	TickInterval = 30
	TickEvaluateMovement = true

	CreateMod("Offense",         "F9    Offense", true, "f9",    "Hybrid",    "DPS")
	CreateMod("BlockTP",         "ShF9  BlockTP", true, "~f9",   "BlockTP")
	CreateMod("SIRD",            "F10   SIRD",    true, "f10",   "SIRD", "FullSIRD")
	CreateMod("PreserveHP",      "ShF10 HP",      true, "~f10",  "HPHi", "HPLo")
	CreateMod("MagicalDefense",  "F11   MDef",    true, "f11",   "MEva")
	CreateMod("Refresh",         "ShF11 Refresh", true, "~f11",  "+Refresh")
	CreateMod("MagicBurst",      "CtF11 MBurst",  true, "^f11",  "MB")

	CreateMod("ShelteredRing", "n/a", false, nil, "Shelter")
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