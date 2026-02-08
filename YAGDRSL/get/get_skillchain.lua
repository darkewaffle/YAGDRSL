function GetWeaponskillCanSkillchain(WeaponskillID)
	local FirstProperty = WINDOWER_RESOURCES.weapon_skills[WeaponskillID].skillchain_a
	if FirstProperty and FirstProperty ~= "" then
		return true
	else
		return false
	end
end

function GetJobAbilityCanSkillchain(JobAbilityID)
	local FirstProperty = WINDOWER_RESOURCES.job_abilities[JobAbilityID].skillchain_a
	if FirstProperty and FirstProperty ~= "" then
		return true
	else
		return false
	end
end

function GetNPCAbilityCanSkillchain(AbilityID)
	local FirstProperty = WINDOWER_RESOURCES.monster_abilities[AbilityID].skillchain_a
	if FirstProperty and FirstProperty ~= "" then
		return true
	else
		return false
	end
end