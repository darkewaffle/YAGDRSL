CreateMod("PetMode", "F9  PetMode", true, "f9", "FullPet", "FullMaster")

ConfigureWeaponLock("F10 WepLock", true, "f10")
SetWeaponLockAll()


SetAutoCancelBuff({"Spectral Jig"},	
				{"Sneak"})

SetModOrderEngagedOffense ("PetMode")
SetModOrderIdleOffense ("PetMode")

TrackPetNameAsOffenseMod()