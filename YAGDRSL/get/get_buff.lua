require "YAGDRSL/mappings/constructed/buffs.lua"

function GetBuffName(BuffID)
	return WINDOWER_RESOURCES.buffs[BuffID]["en"]
end

function GetBuffNameIsValid(BuffName)
	CreateResourceBuffNames()

	if BuffName then
		BuffName = string.lower(BuffName)
		if _G[MAP_BUFF_NAMES][BuffName] then
			return true
		else
			return false
		end
	end
end

function GetBuffID(BuffName)
	CreateResourceBuffNames()

	if BuffName then
		BuffName = string.lower(BuffName)
		return _G[MAP_BUFF_NAMES][BuffName]
	end
	return nil
end