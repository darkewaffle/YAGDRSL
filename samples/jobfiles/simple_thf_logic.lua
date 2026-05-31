AssignModOptions("PhysicalDefense", "PDT", "PDTHP", "Eva")
AssignModOptions("TH", "+TH", "THAoE")

AppendModOrderIdleOffense("TH")
AppendModOrderPrecastWSOffense("TH")

ConfigureOverride("CtF12 Override", 5, "^f12", "Spheres", "+CP")

TrackOffenseBuffs("Conspirator", "Feint", "Trick Attack", "Sneak Attack")
TrackDefenseBuffs("Flee", "Perfect Dodge")

function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet)

	if SpellAttributes["Category"] == "ws" then
		PrecastSet = CustomizeGearForDayElement(SpellAttributes, PrecastSet, true)
		PrecastSet = CustomizeGearForWeatherElement(SpellAttributes, PrecastSet, true)

		MoonshadeAlternates = {"Ishvara Earring", "Friomisi Earring"}
		if GetCharacterTP() > 2850 then
			PrecastSet = ReplaceMoonshade(PrecastSet, MoonshadeAlternates)
		end
	end

	return PrecastSet
end