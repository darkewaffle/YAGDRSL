function GetModExists(ModName)
	local ModObject = _G[MOD_VALUES_ROOT_NAME][ModName]

	if ModObject then
		return true
	else
		ChatError("MOD: " .. ModName, "does not exist")
		return false
	end
end
