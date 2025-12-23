--@@require "YAGDRSL/debug/chat.lua"
--@@require "YAGDRSL/debug/chat_objects.lua"

--@@require "YAGDRSL/get/get_character.lua"
--@@require "YAGDRSL/get/sets/get_set_status.lua"
--@@require "YAGDRSL/do/equip_safe.lua"

function aftercast(spell)
	ChatBlankLine()
	ChatCheckpointLogged("Aftercast Start")

	AfterCastContainer(EVENT_AFTERCAST)

	local SpellAttributes = GetSpellAttributes(spell)
	HookOnAftercast(SpellAttributes) -- @Hook

	ChatCheckpointLogged("Aftercast End", spell.name)
end

-- Isolated into function so that it can be re-used in pet_aftercast.
function AfterCastContainer(EventName)
	-- This is a global boolean value that indicates if there is an action currently underway. True when precast has been confirmed and set to false when aftercast begins.
	STATE_ACTION_IN_PROGRESS = false

	local CharacterStatus = GetCharacterStatus()
	ChatDebug(EventName .. ", CharacterStatus =", CharacterStatus)
	local StatusSet = {}
	StatusSet = GetStatusSet(CharacterStatus)

	ChatGearSet(StatusSet, EventName)
	EquipSafe(StatusSet, EventName)

end

function HookOnAftercast(SpellAttributes) -- @Hook
	-- This is a function the user can override to implement custom logic.
end