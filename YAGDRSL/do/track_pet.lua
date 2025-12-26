require "YAGDRSL/do/create_tracker.lua"
require "YAGDRSL/get/get_character.lua"

function TrackPetNameAsMod(ModClass)
	CreateTrackerQueued(TRACK_PET_NAME, ModClass)
	STATE_TRACK_PET = true
end

function UpdatePetNameTracker(NewPet)
	local CharacterJob = GetCharacterJobShort()
	local PetName = ""

	if CharacterJob == "BST" then
		PetName = NewPet

	elseif CharacterJob == "DRG" then
		PetName = TRACK_PET_WYVERN

	elseif CharacterJob == "PUP" then
		PetName = TRACK_PET_AUTOMATON

	elseif CharacterJob == "SMN" then
		PetName = NewPet
	
	else
		PetName = MOD_DEFAULT_OFF
	end

	SetTracker(TRACK_PET_NAME, PetName)
end

function ClearPetNameTracker()
	UnsetTracker(TRACK_PET_NAME)
end

-- @User

function TrackPetNameAsOffenseMod()
	TrackPetNameAsMod(MOD_CLASS_OFFENSE)
end

function TrackPetNameAsDefenseMod()
	TrackPetNameAsMod(MOD_CLASS_DEFENSE)
end