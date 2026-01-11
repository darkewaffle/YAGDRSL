CreateMod("Pet Mode", "ShF9  PetMode", true, "~f9", "PetDT", "PetSolo")

AppendModOrderEngagedOffense("Pet Mode")
SetModOrderIdleOffense("Pet Mode")
SetModOrderRestingOffense("Pet Mode")

TrackOffenseBuffs("Overdrive")
TrackPetNameAsOffenseMod()