CreateMod("PetMode", "ShF9  PetMode", 1.1, "~f9", "PetDT", "PetSolo")

AppendModOrderEngagedOffense("PetMode")
SetModOrderIdleOffense("PetMode")
SetModOrderRestingOffense("PetMode")

TrackOffenseBuffs("Overdrive")
TrackPetNameAsOffenseMod()