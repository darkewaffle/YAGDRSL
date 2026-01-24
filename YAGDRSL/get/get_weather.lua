function GetWeatherElement()
	if world.weather_element then
		return world.weather_element
	else
		return nil
	end
end

function GetWeatherIntensity()
	if world.weather_intensity then
		return world.weather_intensity
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

function GetWeatherOpposesSpell(SpellElement)
	local WeatherElement = GetWeatherElement()
	local SpellOppositeElement = MapGetOppositeElement(SpellElement)

	if WeatherElement and SpellOppositeElement and WeatherElement == SpellOppositeElement then
		return true
	else
		return false
	end
end