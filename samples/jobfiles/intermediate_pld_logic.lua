	CreateMod("MainHand", "PgUp  MH", .9, "$%pageup", "Sak", "Naeg", "Malig")
	CreateMod("OffHand", "PgDn  OH", .91, "$%pagedown", "Aegis", "Duban", "Ochain")
	SetModValue("MainHand", "Sak")
	SetModValue("OffHand", "Ochain")

	AssignModOptions("Offense", "Hybrid", "DPS")
	CreateMod("BlockTP",         "ShF9  BlockTP", 1.1, "~f9",   "+BlockTP")

	DeleteMod("PhysicalDefense")
	CreateMod("SIRD",            "F10   SIRD",    2, "f10",   "SIRD", "FullSIRD")
	SetModValue("SIRD", "SIRD")
	CreateMod("PreserveHP",      "ShF10 HP",      2.1, "~f10",  "HPHi", "HPLo")
	SetModValue("PreserveHP", "HPHi")

	AssignModOptions("MagicalDefense", "MEva")
	CreateMod("Refresh", "ShF11 Refresh", 3.1, "~f11", "+Refresh")
	CreateMod("MagicBurst",      "CtF11 MBurst",  3.2, "^f11",  "+MBurst")

	DeleteMod("TH")

	CreateMod("ShelteredRing", "n/a", 0, nil, "Shelter")
	SetModValue("ShelteredRing", "Shelter")

	SetWeaponLockIgnoreSpells("Protect V")

	AssignWeaponLockOptions(MOD_LOCK_MAIN_SUB)
	SetWeaponLockMainSub()

	SetModOrderEngagedOffense ("MainHand", "OffHand", "Offense", "BlockTP")
	SetModOrderIdleOffense ("MainHand", "OffHand", "Refresh")

	SetModOrderPrecastMagicDefense("PreserveHP")

	SetModOrderMidcastMagicOffense("MagicBurst")
	SetModOrderMidcastMagicDefense("PreserveHP", "SIRD", "ShelteredRing")

	SetModOrderPrecastWSDefense("PreserveHP")

	SetModOrderRestingOffense ("Refresh")