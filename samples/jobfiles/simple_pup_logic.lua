CreateMod("PetMode", "F9  PetMode", 1, "f9", "FullPet", "FullMaster")

ConfigureWeaponLock("F10 WepLock", 2, "f10")
SetWeaponLockAll()


SetAutoCancelBuff({"Spectral Jig"},	
				{"Sneak"})

SetModOrderEngagedOffense ("PetMode")
SetModOrderIdleOffense ("PetMode")

TrackPetNameAsOffenseMod()