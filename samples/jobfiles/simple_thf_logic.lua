--
-- LIBRARY SETTINGS
--

	TickEnable = true
	TickInterval = 30
	TickEvaluateMovement = true

	CreateMod("Offense",         "F9    Offense", 1, "f9",    "Acc")
	CreateMod("PhysicalDefense", "F10   PDef",    2, "f10",   "PDT")
	CreateMod("TH",              "CtF12 TH",      3, "^f12",  "TH")

	ConfigureDefensePriority("End   DefPriority", 4, "end")

	SetAutoCancelBuff({"Spectral Jig"},	
					{"Sneak"})

	
	SetModOrderPrecastWSOffense("Offense")
	SetModOrderPrecastWSDefense("PhysicalDefense")

	SetModOrderEngagedOffense ("Offense", "TH")
	SetModOrderEngagedDefense ("PhysicalDefense")

	SetModOrderIdleDefense    ("PhysicalDefense")
	SetModOrderRestingDefense ("PhysicalDefense")

	TrackOffenseBuffs("Sneak Attack", "Trick Attack")
	TrackDefenseBuffs("Flee")