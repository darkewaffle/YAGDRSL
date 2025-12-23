--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/debug/chat_objects.lua"
--@@require "YAGDRSL/events/gearswap/aftercast.lua"

function pet_aftercast(spell)
	ChatBlankLine()
	ChatCheckpointLogged("pet_aftercast Start")

	AfterCastContainer(EVENT_AFTERCAST_PET)

	local SpellAttributes = GetSpellAttributes(spell)
	HookOnAftercast(SpellAttributes) -- @Hook

	ChatCheckpointLogged("pet_aftercast End", spell.name)
end

function HookOnPetAftercast(SpellAttributes) -- @Hook
	-- This is a function the user can override to implement custom logic.
end