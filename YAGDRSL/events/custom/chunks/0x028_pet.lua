function ParseActionPacketPet(ActionPacket)
	local ActionID = ActionPacket["Param"]
	local TargetID = ActionPacket["Target 1 ID"]

	if ActionPacket["Target 1 Action 1 Has Added Effect"] then
		local ActionMessage = ActionPacket["Target 1 Action 1 Added Effect Message"]
		local Skillchain = _G[MAP_SKILLCHAIN_MESSAGES][ActionMessage]

		if Skillchain then
			CreateMagicBurstTracking(TargetID)

			local SkillchainElements = _G[MAP_SKILLCHAIN_ELEMENTS][Skillchain]
			UpdateMagicBurstTracking(TargetID, SkillchainElements)
		end
	end
end