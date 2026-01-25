--[[
@User
This function can be used to conditionally include equipment when the magical damage element of an action is equal to the element of the weather.
When the element matches then the equipment in the WeatherItems table will be equipped. WeatherItems can be defined in the character or job files.

	WeatherItems = {}
	WeatherItems.Fire =      { }
	WeatherItems.Ice =       { }
	WeatherItems.Wind =      { }
	WeatherItems.Earth =     { }
	WeatherItems.Lightning = { }
	WeatherItems.Water =     { }
	WeatherItems.Light =     { }
	WeatherItems.Dark =      { }
]]

function CustomizeGearForWeatherElement(SpellAttributes, GearSet)

	if SpellAttributes["DamageType"] == MAP_DAMAGE_MAGICAL then

		if SpellAttributes["Element=Weather"] then

			local WeatherIntensity = GetWeatherIntensity()

			-- Equip if WeatherIntensity = 2
			-- Or if WeatherIntensity = 1 and element does not oppose the day (typical behavior for Hachirin-no-obi)
			if WeatherIntensity == 2 or (WeatherIntensity == 1 and not SpellAttributes["ElementOpposesDay"]) then
				GearSet = set_combine(GearSet, WeatherItems[SpellAttributes["Element"]])
			end
		end
	end

	return GearSet
end