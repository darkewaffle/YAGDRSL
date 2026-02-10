--[[
@User
This function can be used to conditionally include equipment when the magical damage element of an action is equal to the element of the weather.
When the element matches then the equipment in the WeatherItems table will be equipped. WeatherItems can be defined in the character or job files.
WeatherItems.universal represents gear that should be equipped when any weather is matched.
	
	-- These go in your user files.
	WeatherItems.universal = { }
	WeatherItems.fire =      { }
	WeatherItems.ice =       { }
	WeatherItems.wind =      { }
	WeatherItems.earth =     { }
	WeatherItems.lightning = { }
	WeatherItems.water =     { }
	WeatherItems.light =     { }
	WeatherItems.dark =      { }
]]


-- Do not change these.
WeatherItems = {}
WeatherItems.universal =          {}
WeatherItems[ELEMENT_FIRE] =      {}
WeatherItems[ELEMENT_ICE] =       {}
WeatherItems[ELEMENT_WIND] =      {}
WeatherItems[ELEMENT_EARTH] =     {}
WeatherItems[ELEMENT_LIGHTNING] = {}
WeatherItems[ELEMENT_WATER] =     {}
WeatherItems[ELEMENT_LIGHT] =     {}
WeatherItems[ELEMENT_DARK] =      {}

function CustomizeGearForWeatherElement(SpellAttributes, GearSet)

	if SpellAttributes["DamageType"] == MAP_DAMAGE_MAGICAL then

		if SpellAttributes["Element=Weather"] then

			local WeatherIntensity = GetWeatherIntensity()

			-- Equip if WeatherIntensity = 2
			-- Or if WeatherIntensity = 1 and element does not oppose the day (typical behavior for Hachirin-no-obi)
			if WeatherIntensity == 2 or (WeatherIntensity == 1 and not SpellAttributes["ElementOpposesDay"]) then
				GearSet = set_combine(GearSet, WeatherItems["universal"], WeatherItems[SpellAttributes["Element"]])
			end
		end
	end

	return GearSet
end