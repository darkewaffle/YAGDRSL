--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/debug/chat_objects.lua"

--@@require "YAGDRSL/do/track_pet.lua"

function pet_change(pet, gain)
	ChatBlankLine()
	ChatCheckpoint("pet_change start: NEW = ", pet.name)

	if STATE_TRACK_PET then
		if gain then
			UpdatePetNameTracker(pet.name)
		else
			ClearPetNameTracker()
		end
	end

	HookOnPetChange(pet, gain) -- @Hook

	ChatCheckpoint("pet_change end")
end

function HookOnPetChange(pet, gain) -- @Hook
	-- This is a function the user can override to implement custom logic.
end