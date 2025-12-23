function GetJANameIsValid(JobAbilityName)
	if JobAbilityName then
		if _G[MAP_JA][JobAbilityName] then
			return true
		else
			return false
		end
	end
end