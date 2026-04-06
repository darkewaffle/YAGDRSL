--[[
@User
This function can be used to conditionally equip the Councilor's Garb when in a zone that counts as Adoulin. See below for an implementation example.

function HookStatusCustomizeOffense(CharacterStatus, StatusSet)
	StatusSet = CustomizeGearInAdoulin(StatusSet)
	return StatusSet
end

]]

function CustomizeGearInAdoulin(GearSet)
	local CurrentZone = GetCharacterZone()
	local ZoneIsAdoulin = MapGetZoneIsAdoulin(CurrentZone)

	if ZoneIsAdoulin then
		GearSet = set_combine(GearSet, {body="Councilor's Garb"})
	end

	return GearSet
end