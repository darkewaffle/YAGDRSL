-- @User
-- This function can be used to conditionally include equipment when the magical damage element of an action is equal to the element of the day.
-- When the element matches then the equipment in the DayItems table will be equipped. DayItems can be defined in the character or job files.

-- DayItems = {}
-- DayItems.Fire =      { }
-- DayItems.Ice =       { }
-- DayItems.Wind =      { }
-- DayItems.Earth =     { }
-- DayItems.Lightning = { }
-- DayItems.Water =     { }
-- DayItems.Light =     { }
-- DayItems.Dark =      { }

function CustomizeGearForDayElement(SpellAttributes, GearSet)

	if SpellAttributes["DamageType"] == MAP_DAMAGE_MAGICAL then
		if SpellAttributes["Element=Day"] then
			GearSet = set_combine(GearSet, DayItems[SpellAttributes["Element"]])
		end
	end

	return GearSet
end