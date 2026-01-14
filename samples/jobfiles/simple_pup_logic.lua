CreateMod("PetMode", "ShF9  PetMode", 1.1, "~f9", "PetDT")
ConfigureOverride("CtF12 Override", 5, "^f12", "PetSolo")

AppendModOrderEngagedOffense("PetMode")
SetModOrderIdleOffense("PetMode")
SetModOrderRestingOffense("PetMode")

TrackOffenseBuffs("Overdrive")
TrackPetNameAsOffenseMod()

SetWeaponLockAll()