--
-- LIBRARY SETTINGS
--

	--CreateMod(ModName, ModDescription, ControlPanelDisplay, CycleKeyBind, ...)
	CreateMod("PetMode", "F9    PetMode", true, "f9", "FullPet", "FullMaster")
	ConfigureDefensePriority("End   DefPriority", true, "end")
	
	SetAutoCancelBuff({"Spectral Jig"},	
					{"Sneak"})

	SetModOrderEngagedOffense ("PetMode")
	SetModOrderIdleOffense ("PetMode")