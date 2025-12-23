-- Creates a table of {["BuffName_en"]=BuffIndex, ["BuffName_enl"]=BuffIndex} useful for simple validation of BuffNames.
function CreateResourceBuffNamesAsKeys()
	for BuffIndex, BuffProperties in pairs(WINDOWER_RESOURCES.buffs) do
		_G[MAP_BUFF_NAMES][string.lower(BuffProperties.en)] = BuffIndex
		_G[MAP_BUFF_NAMES][string.lower(BuffProperties.enl)] = BuffIndex
	end
end

function CreateResourceBuffNames()
	if not MAP_BUFF_NAMES_POPULATED then
		CreateResourceBuffNamesAsKeys()
		MAP_BUFF_NAMES_POPULATED = true
	end
end