--[[
@User
This function can be used to conditionally include equipment when the magical damage element of an action is equal to the element of the day.
When the element matches then the equipment in the DayItems table will be equipped. DayItems can be defined in the character or job files.
DayItems.universal represents gear that should be equipped when any day is matched.

	-- These go in your user files.
	DayItems.universal = { }
	DayItems.fire =      { }
	DayItems.ice =       { }
	DayItems.wind =      { }
	DayItems.earth =     { }
	DayItems.lightning = { }
	DayItems.water =     { }
	DayItems.light =     { }
	DayItems.dark =      { }
]]


-- Do not change these.
DayItems = {}
DayItems.universal =          {}
DayItems[ELEMENT_FIRE] =      {}
DayItems[ELEMENT_ICE] =       {}
DayItems[ELEMENT_WIND] =      {}
DayItems[ELEMENT_EARTH] =     {}
DayItems[ELEMENT_LIGHTNING] = {}
DayItems[ELEMENT_WATER] =     {}
DayItems[ELEMENT_LIGHT] =     {}
DayItems[ELEMENT_DARK] =      {}

function CustomizeGearForDayElement(SpellAttributes, GearSet)

	if SpellAttributes["DamageType"] == MAP_DAMAGE_MAGICAL then
		-- Day gear will only be equipped if element and day match and the element does not oppose the weather (typical behavior for Hachirin-no-obi)
		if SpellAttributes["Element=Day"] and not SpellAttributes["ElementOpposesWeather"] then
			GearSet = set_combine(GearSet, DayItems["universal"], DayItems[SpellAttributes["Element"]])
		end
	end

	return GearSet
end