require "YAGDRSL/mappings/YAG_mappings.lua"

function GetCharacterName()
	return player.name
end

function GetCharacterJobID()
	return player.main_job_id
end

function GetCharacterSubJobID()
	return player.sub_job_id
end

function GetCharacterJobShort()
	return WINDOWER_RESOURCES.jobs[GetCharacterJobID()].english_short
end

function GetCharacterSubJobShort()
	return WINDOWER_RESOURCES.jobs[GetCharacterSubJobID()].english_short
end

function GetCharacterStatus()
	return string.lower(player.status)
end

function GetCharacterZone()
	return world.zone
end

function GetCharacterZoneClass()
	return MapGetZoneClass(world.zone)
end

function GetCharacterMissingHP()
	return player.max_hp - player.hp
end

function GetCharacterTP()
	return player.tp
end

function GetCharacterJobLevel(JobShort)
	if JobShort == GetCharacterJobShort() then
		return player.main_job_level
	elseif JobShort == GetCharacterSubJobShort() then
		return player.sub_job_level
	else
		return 0
	end
end

function GetCharacterAsPlayer()
	return windower.ffxi.get_player()
end

function GetCharacterAsMob()
	local PlayerData = GetCharacterAsPlayer()

	if PlayerData then
		local PlayerMobData = windower.ffxi.get_mob_by_id(PlayerData.id)
		if PlayerMobData then
			return PlayerMobData
		end
	end

	return {}
end

function GetCharacterCoordinates()
	local PlayerMobData = GetCharacterAsMob()
	return PlayerMobData.x, PlayerMobData.y, PlayerMobData.z
end

function GetCharacterFacing()
	local PlayerMobData = GetCharacterAsMob()
	return PlayerMobData.facing
end

function GetCharacterHasTarget()
	if windower.ffxi.get_mob_by_target("t") then
		return true
	else
		return false
	end
end