TrackOffenseBuffs("Innin", "Sange", "Futae")
TrackDefenseBuffs("Yonin", "Migawari")

AssignModOptions("TH", "+TH", "THAoE")
AppendModOrderIdleOffense("TH")
AppendModOrderPrecastWSOffense("TH")


function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet)

	if SpellAttributes["Category"] == "ws" then
		PrecastSet = CustomizeGearForDayElement(SpellAttributes, PrecastSet, true)
		PrecastSet = CustomizeGearForWeatherElement(SpellAttributes, PrecastSet, true)
	end

	return PrecastSet
end

function HookMidcastCustomizeOffense(SpellAttributes, MidcastSet)

	if SpellAttributes["Category"] == "magic" and SpellAttributes["ParentGroup"] == MAP_SPELL_NINJUTSU_ELEMENTAL then
		MidcastSet = CustomizeGearForDayElement(SpellAttributes, MidcastSet, true)
		MidcastSet = CustomizeGearForWeatherElement(SpellAttributes, MidcastSet, true)
	end

	return MidcastSet
end