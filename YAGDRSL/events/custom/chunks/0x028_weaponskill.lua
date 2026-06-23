function ParseActionPacketWeaponskill(ActionPacket)
	local ActionID = ActionPacket["Param"]
	local TargetID = ActionPacket["Target 1 ID"]
	
	local CanSkillchain = false

	-- <= 255 are normal weaponskills
	if ActionID <= 255 then
		CanSkillchain = GetWeaponskillCanSkillchain(ActionID)

	-- >= 257 do not exist in the WS resource. They are NPC/monster abilities found in monster_abilities.lua.
	-- Trust weaponskills are [sometimes?] received with a category of 3 (weaponskill finish) rather than 11 (NPC TP finish)
	-- However they will contain an action ID that corresponds to a monster ability rather than a normal weaponskill
	-- For example - Sylvie (UC) will use Nott which has an ID of 3502 in monster_abilities.lua
	elseif ActionID >= 257 then
		CanSkillchain = GetNPCAbilityCanSkillchain(ActionID)
	end

	if CanSkillchain then
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