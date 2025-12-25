	TickEnable = true
	TickInterval = 30
	TickEvaluateMovement = true

	CreateMod("Offense",         "F9    Offense",true, "f9",    "Hybrid",    "DPS")
	CreateMod("BlockTP",         "ShF9  BlockTP",true, "~f9",   "BlockTP")
	CreateMod("SIRD",            "F10   SIRD",   true, "f10",   "SIRD", "FullSIRD")
	CreateMod("Preserve HP",     "ShF10 HP",     true, "~f10",  "HPHi", "HPLo")
	CreateMod("MagicalDefense",  "F11   MDef",   true, "f11",   "MEva")
	CreateMod("Refresh",         "ShF11",        true, "~f11",  "+Refresh")
	CreateMod("MagicBurst",      "CtF11",        true, "^f11",  "MB")

	CreateMod("ShelteredRing", "n/a", false, nil, "Shelter")
	SetModValue("ShelteredRing", "Shelter")

	SetModValue("SIRD", "SIRD")
	SetModValue("Preserve HP", "HPHi")


	ConfigureDefensePriority("End   DefPriority", true, "end")

	SetModOrderPrecastMagicDefense("Preserve HP")

	SetModOrderMidcastMagicOffense("MagicBurst")
	SetModOrderMidcastMagicDefense("Preserve HP", "SIRD", "ShelteredRing")

	SetModOrderPrecastWSOffense("Offense")
	SetModOrderPrecastWSDefense("Preserve HP")

	SetModOrderEngagedOffense ("Offense", "BlockTP")
	SetModOrderEngagedDefense ("MagicalDefense")

	SetModOrderIdleOffense    ("Refresh")
	SetModOrderIdleDefense    ("MagicalDefense")

	SetModOrderRestingOffense ("Refresh")
	SetModOrderRestingDefense ("MagicalDefense")