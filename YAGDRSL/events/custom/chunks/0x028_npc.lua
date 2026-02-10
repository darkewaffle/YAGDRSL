function ParseActionPacketNPC(ActionPacket)
	local ActionID = ActionPacket["Param"]
	local TargetID = ActionPacket["Target 1 ID"]
	
	if GetNPCAbilityCanSkillchain(ActionID) then
		if ActionPacket["Target 1 Action 1 Has Added Effect"] then
			local ActionMessage = ActionPacket["Target 1 Action 1 Added Effect Message"]
			local Skillchain = _G[MAP_SKILLCHAIN_MESSAGES][ActionMessage]

			if Skillchain then
				CreateMagicBurstTracking(TargetID)

				local SkillchainElements = _G[MAP_SKILLCHAIN_ELEMENTS][Skillchain]
				UpdateMagicBurstTracking(TargetID, SkillchainElements)
			else
				-- WS created an Added Effect but not a skillchain, a magic burst cannot occur.
				DeleteMagicBurstTracking(TargetID)
			end
		else
			-- WS has SC properties and did not create an Added Effect (skillchain), a magic burst cannot occur.
			DeleteMagicBurstTracking(TargetID)
		end
	end
end