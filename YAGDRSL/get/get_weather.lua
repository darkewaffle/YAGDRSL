function GetWeatherElement()
	if world.weather_element then
		return world.weather_element
	else
		return nil
	end
end

function GetWeatherMatchesSpell(SpellElement)
	local WeatherElement = GetWeatherElement()

	if WeatherElement and SpellElement and WeatherElement == SpellElement then
		return true
	else
		return false
	end
end