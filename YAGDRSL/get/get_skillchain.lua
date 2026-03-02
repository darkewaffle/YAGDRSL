function GetWeaponskillCanSkillchain(WeaponskillID)
	if WeaponskillID and WINDOWER_RESOURCES.weapon_skills[WeaponskillID] then
		local FirstProperty = WINDOWER_RESOURCES.weapon_skills[WeaponskillID].skillchain_a
		if FirstProperty and FirstProperty ~= "" then
			return true
		else
			return false
		end
	else
		ChatError("Unknown WeaponskillID", WeaponskillID)
		AddToLogFile("Unknown WeaponskillID", WeaponskillID)
		return false
	end
end

function GetJobAbilityCanSkillchain(JobAbilityID)
	if JobAbilityID and WINDOWER_RESOURCES.job_abilities[JobAbilityID] then
		local FirstProperty = WINDOWER_RESOURCES.job_abilities[JobAbilityID].skillchain_a
		if FirstProperty and FirstProperty ~= "" then
			return true
		else
			return false
		end
	else
		ChatError("Unknown JobAbilityID", JobAbilityID)
		AddToLogFile("Unknown JobAbilityID", JobAbilityID)
		return false
	end
end

function GetNPCAbilityCanSkillchain(AbilityID)
	if AbilityID and WINDOWER_RESOURCES.monster_abilities[AbilityID] then
		local FirstProperty = WINDOWER_RESOURCES.monster_abilities[AbilityID].skillchain_a
		if FirstProperty and FirstProperty ~= "" then
			return true
		else
			return false
		end
	else
		ChatError("Unknown NPC AbilityID", AbilityID)
		AddToLogFile("Unknown NPC AbilityID", AbilityID)
		return false
	end
end