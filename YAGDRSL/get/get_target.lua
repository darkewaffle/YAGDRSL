function GetTargetData()
	local TargetMobData = windower.ffxi.get_mob_by_target("t")
	if TargetMobData then
		return TargetMobData
	else
		return {}
	end
end

function GetTargetID()
	local TargetMobData = GetTargetData()
	if TargetMobData then
		return TargetMobData.id
	end
end

function GetTargetFacing()
	local TargetMobData = GetTargetData()
	return TargetMobData.facing
end