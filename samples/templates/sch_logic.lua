AssignModOptions("Offense", "MAcc", "MDmg")
CreateMod("Magic Burst", "ShF9  MBurst",   true, "~f9",   "+MBurst")
CreateMod("Refresh",     "CtF12 Refresh", true, "^f12",  "+Refresh")

AppendModOrderMidcastMagicOffense("Magic Burst")
AppendModOrderIdleOffense("Refresh")
AppendModOrderRestingOffense("Refresh")

-- Light Arts Buffs
TrackOffenseBuffs("Light Arts", "Penury", "Rapture", "Perpetuance")

-- Dark Arts Buffs
TrackOffenseBuffs("Dark Arts", "Parsimony", "Ebullience", "Immanence")

-- General Buffs
TrackOffenseBuffs("Sublimation: Activated")

function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It must return a gearset in order proceed properly.

	if SpellAttributes["Category"] == "magic" and SpellAttributes["Element=Weather"] then

		if (buffactive["Celerity"] and SpellAttributes["Class"] == "white") or (buffactive["Alacrity"] and SpellAttributes["Class"] == "black") then
			PrecastSet = set_combine(PrecastSet, customize.relicboots)
		end

	end

	-- Precast customize for weather/day gear will only apply to weaponskills
	if SpellAttributes["Category"] == "ws" then
		PrecastSet = ApplyWeatherAndDayGear(SpellAttributes, PrecastSet)
	end

	return PrecastSet
end

function HookMidcastCustomizeOffense(SpellAttributes, MidcastSet) -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- It must return a gearset in order proceed properly.

	if SpellAttributes["Category"] == "magic" and SpellAttributes["Element=Weather"] then

		if (buffactive["Celerity"] and SpellAttributes["Class"] == "white") or (buffactive["Alacrity"] and SpellAttributes["Class"] == "black") then
			MidcastSet = set_combine(MidcastSet, customize.relicboots)
		elseif buffactive["Klimaform"] and (SpellAttributes["Skill"] == "elemental" or SpellAttributes["Skill"] == "dark") then
			MidcastSet = set_combine(MidcastSet, customize.empyreanboots)
		end

	end

	-- Midcast customize for weather/day gear will only apply to spells
	if SpellAttributes["Category"] == "magic" then
		MidcastSet = ApplyWeatherAndDayGear(SpellAttributes, MidcastSet)
	end

	return MidcastSet
end