-- @User
-- This function will calculate how much dualwield is needed to reach the delay cap based on an input of the amount of dual wield provided by traits and the character's current haste.
-- Recommended to make use of GetCharacterHaste to dynamically determine haste.

-- eg: local CurrentCharacterHaste = GetCharacterHaste(HasteDefinitions)
-- eg: local DualWieldNeeded = GetDualWieldToCap(30, CurrentCharacterHaste)

function GetDualWieldToCap(JobDualWield, PlayerHaste)

	local FractionalHaste = math.floor(PlayerHaste/100 * 1024)
	local DualWieldToCap = (1 - (.2/((1024-FractionalHaste)/1024))) * 100
	DualWieldToCap = math.ceil(DualWieldToCap) - JobDualWield

	-- When additional dual wield is needed to reach delay cap then add 1 to lazily account for inaccuracy of using integer percentages rather than exact x/1024 haste values
	if DualWieldToCap > 0 then
		DualWieldToCap = DualWieldToCap + 1
	end

	DualWieldToCap = Clamp(DualWieldToCap, 0, 100)

	ChatDebug("Estimated dualwield to cap", DualWieldToCap .. "%")
	return DualWieldToCap
end