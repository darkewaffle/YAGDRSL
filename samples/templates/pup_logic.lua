CreateMod("Pet Mode", "ShF9  PetMode", 1.1, "~f9", "PetDT", "PetSolo")

AppendModOrderEngagedOffense("Pet Mode")
SetModOrderIdleOffense("Pet Mode")
SetModOrderRestingOffense("Pet Mode")

TrackOffenseBuffs("Overdrive")
TrackPetNameAsOffenseMod()