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

function GetDayOpposesSpell(SpellElement)
	local DayElement = GetDayElement()
	local SpellOppositeElement = MapGetOppositeElement(SpellElement)

	if DayElement and SpellOppositeElement and DayElement == SpellOppositeElement then
		return true
	else
		return false
	end
end