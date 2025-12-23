function GetActionNameIsValid(ActionName)
	if ActionName then
		if _G[MAP_SPELLS][ActionName] or _G[MAP_JA][ActionName] or _G[MAP_WS][ActionName] or ActionName == NAME_RA then
			return true
		else
			return false
		end
	end
end