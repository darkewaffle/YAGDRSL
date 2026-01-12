	CreateMod("Refresh",         "ShF11",        1, "~f11",  "+Refresh")

	ConfigureWeaponLock("Home  WeaponLock", true, "home")
	ConfigureDefensePriority("End   DefPriority", true, "end")

	SetModOrderPrecastMagicDefense()

	SetModOrderMidcastMagicOffense()
	SetModOrderMidcastMagicDefense()

	SetModOrderPrecastWSOffense()
	SetModOrderPrecastWSDefense()

	SetModOrderEngagedOffense ()
	SetModOrderEngagedDefense ()

	SetModOrderIdleOffense    ("Refresh")
	SetModOrderIdleDefense    ()

	SetModOrderRestingOffense ("Refresh")
	SetModOrderRestingDefense ()