function GetDayElement()
	if world.day_element then
		return world.day_element
	else
		return nil
	end
end

function GetDayMatchesSpell(SpellElement)
	local DayElement = GetDayElement()

	if DayElement and SpellElement and DayElement == SpellElement then
		return true
	else
		return false
	end
end