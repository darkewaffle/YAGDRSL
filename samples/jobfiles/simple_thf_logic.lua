--
-- LIBRARY SETTINGS
--

	TickEnable = true
	TickInterval = 30
	TickEvaluateMovement = true

	CreateMod("Offense",         "F9    Offense",true, "f9",    "Acc")
	CreateMod("PhysicalDefense", "F10   PDef",   true, "f10",   "PDT")
	CreateMod("TH",              "CtF12 TH",     true, "^f12",  "TH")

	ConfigureDefensePriority("End   DefPriority", true, "end")

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