--[[
@User
This function can be used to conditionally include equipment when the magical damage element of an action is equal to the element of the day.
When the element matches then the equipment in the DayItems table will be equipped. DayItems can be defined in the character or job files.
DayItems.Universal represents gear that should be equipped when any day is matched.

	DayItems = {}
	DayItems.Universal = { }
	DayItems.Fire =      { }
	DayItems.Ice =       { }
	DayItems.Wind =      { }
	DayItems.Earth =     { }
	DayItems.Lightning = { }
	DayItems.Water =     { }
	DayItems.Light =     { }
	DayItems.Dark =      { }
]]

function CustomizeGearForDayElement(SpellAttributes, GearSet)

	if SpellAttributes["DamageType"] == MAP_DAMAGE_MAGICAL then
		-- Day gear will only be equipped if element and day match and the element does not oppose the weather (typical behavior for Hachirin-no-obi)
		if SpellAttributes["Element=Day"] and not SpellAttributes["ElementOpposesWeather"] then
			GearSet = set_combine(GearSet, DayItems["Universal"], DayItems[SpellAttributes["Element"]])
		end
	end

	return GearSet
end