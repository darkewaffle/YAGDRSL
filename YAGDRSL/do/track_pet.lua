require "YAGDRSL/do/create_tracker.lua"
require "YAGDRSL/get/get_character.lua"

function TrackPetNameAsMod(ModClass)
	local CharacterJob = GetCharacterJobShort()

	local Priority = MOD_ORDER_PRIORITY_LOW
	if CharacterJob == "SMN" then
		Priority = MOD_ORDER_PRIORITY_HIGH
	end

	CreateTrackerQueued(TRACK_PET_NAME, ModClass, MOD_DEFAULT_OFF, Priority)
	STATE_TRACK_PET = true
end

function UpdatePetNameTracker(NewPet)
	local CharacterJob = GetCharacterJobShort()
	local PetName = ""

	if CharacterJob == "BST" then
		PetName = TRACK_PET_BEAST

	elseif CharacterJob == "DRG" then
		PetName = TRACK_PET_WYVERN

	elseif CharacterJob == "GEO" then
		PetName = TRACK_PET_LUOPAN

	elseif CharacterJob == "PUP" then
		PetName = TRACK_PET_AUTOMATON

	elseif CharacterJob == "SMN" then
		PetName = NewPet
--		SetPetTrackerParent("avatar")
	
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

--function SetPetTrackerParent(ParentName)
--	local PetTrackerName = FormatTrackerName(TRACK_PET_NAME)
--	SetModParent(PetTrackerName, ParentName)
--end

function ConstructAutomatonType()
	local PupData = windower.ffxi.get_mjob_data()
	local AutoHead = GetAutomatonAbbreviation(GetItemName(PupData["head"]))
	local AutoFrame = GetAutomatonAbbreviation(GetItemName(PupData["frame"]))

	return AutoHead .. "_" .. AutoFrame
end
