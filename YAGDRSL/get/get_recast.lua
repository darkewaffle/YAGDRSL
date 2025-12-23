function GetRecastJobAbility(RecastTimerID)
	local AbilityRecasts = windower.ffxi.get_ability_recasts()
	return AbilityRecasts[RecastTimerID] or 0
end

function GetRecastSpell(RecastTimerID)
	local SpellRecasts = windower.ffxi.get_spell_recasts()
	return SpellRecasts[RecastTimerID] or 0
end