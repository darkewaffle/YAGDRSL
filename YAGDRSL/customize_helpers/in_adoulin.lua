--[[

@Deprecated 6/7/2026
This function isn't really necessary any longer as the pathing for status sets will now include the zone name.
Instead of using CustomizeGearInAdoulin you should probably instead just define a set corresponding the zone(s). See example below.
	sets.status.idle.town["Eastern Adoulin"] = {body="Councilor's Garb"}

- - - - -

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