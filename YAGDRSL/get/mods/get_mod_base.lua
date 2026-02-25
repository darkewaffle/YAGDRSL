require "YAGDRSL/get/sets/build_set.lua"
require "YAGDRSL/get/mods/get_mod_order.lua"
require "YAGDRSL/get/mods/get_mod_value.lua"

function GetEventModBase(SpellAttributes, EventSource, ModClass)
	local EventMod = {}

	-- Returns the ModOrder list corresponding to the EventSource and ModClass.
	local ModOrder = GetEventModOrder(SpellAttributes, EventSource, ModClass)

	if ModOrder then

		-- Iterates through each mod contained in ModOrder.
		for Index, ModName in ipairs(ModOrder) do

			-- Retrieves the value of the mod and, if it exists, calls BuildEventMod to find mods containing that ModifierValue.
			-- Each set found for each mod value is combined into the final returned EventMod.
			local ModifierValue = GetModValue(ModName, false)
			if ModifierValue then
				--EventMod = set_combine(EventMod, BuildEventModv1(SpellAttributes, EventSource, ModifierValue))
				EventMod = set_combine(EventMod, BuildEventMod(SpellAttributes, EventSource, ModName))
			end
		end
	end

	ChatGearSet(EventMod, EventSource .. " " .. ModClass)
	return EventMod
end

-- Logically the same as GetEventModBase.
function GetStatusModBase(CharacterStatus, ModClass)
	local StatusMod = {}
	local ModOrder = GetStatusModOrder(CharacterStatus, ModClass)

	if ModOrder then
		for Index, ModName in ipairs(ModOrder) do
			local ModifierValue = GetModValue(ModName, false)
			if ModifierValue then
				--StatusMod = set_combine(StatusMod, BuildStatusModv1(CharacterStatus, ModifierValue))
				StatusMod = set_combine(StatusMod, BuildStatusMod(CharacterStatus, ModName))
			end
		end
	end

	ChatGearSet(StatusMod, CharacterStatus .. " " .. ModClass)

	return StatusMod
end

function GetPrecastModOffenseBase(SpellAttributes)
	return GetEventModBase(SpellAttributes, EVENT_PRECAST, MOD_CLASS_OFFENSE)
end

function GetPrecastModDefenseBase(SpellAttributes)
	return GetEventModBase(SpellAttributes, EVENT_PRECAST, MOD_CLASS_DEFENSE)
end

function GetMidcastModOffenseBase(SpellAttributes)
	return GetEventModBase(SpellAttributes, EVENT_MIDCAST, MOD_CLASS_OFFENSE)
end

function GetMidcastModDefenseBase(SpellAttributes)
	return GetEventModBase(SpellAttributes, EVENT_MIDCAST, MOD_CLASS_DEFENSE)
end

function GetStatusModOffenseBase(CharacterStatus)
	return GetStatusModBase(CharacterStatus, MOD_CLASS_OFFENSE)
end

function GetStatusModDefenseBase(CharacterStatus)
	return GetStatusModBase(CharacterStatus, MOD_CLASS_DEFENSE)
end