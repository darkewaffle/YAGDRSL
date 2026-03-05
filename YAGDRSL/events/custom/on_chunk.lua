require "YAGDRSL/do/windower_events.lua"
require "YAGDRSL/events/custom/chunks/0x028_npc.lua"
require "YAGDRSL/events/custom/chunks/0x028_pet.lua"
require "YAGDRSL/events/custom/chunks/0x028_spell.lua"
require "YAGDRSL/events/custom/chunks/0x028_weaponskill.lua"

function RegisterOnChunk()
	LIBRARY_PACKETS = require "packets"
	RegisterWindowerEvent("incoming chunk", OnChunk)
end

function OnChunk(id, original, modified, injected, blocked)
	-- Action packet that notifies the client of an actor doing something
	if id == 0x028 then

		if _G[YAG_SETTINGS]["MonitorMagicBurstState"] then
			local ActionPacket = LIBRARY_PACKETS.parse('incoming', original)
			local ActionCategory = ActionPacket["Category"]

			-- Weaponskill
			if ActionCategory == 3 then
				ParseActionPacketWeaponskill(ActionPacket)

			-- Spells - should only occur with Immanence
			elseif ActionCategory == 4 then
				ParseActionPacketSpell(ActionPacket)

			-- NPC TP - automatons and some trust actions
			elseif ActionCategory == 11 then
				ParseActionPacketNPC(ActionPacket)

			-- Pet TP Finish - only bloodpacts and ready? Ready SC properties not readily available in resources
			elseif ActionCategory == 13 then
				-- if bloodpact then treat as WS with known properties
				-- if ready/sic then check for SC message but do not reset _G[TRACK_MAGIC_BURST] if message is not present
				ParseActionPacketPet(ActionPacket)
			end
		end
	
	-- Action message packet that sends the client a message that is not necessarily associated with a specific action
	elseif id == 0x029 then

		local MessagePacket = LIBRARY_PACKETS.parse('incoming', original)
		local Message = MessagePacket["Message"]

		-- Collection of messages that indicate the character attempted to perform an action but was unable due to the 'global cooldown'
		local UnableToActionMessages =
		{
			[17] = true, 	-- Spell
			[18] = true, 	-- Spell
			[55] = true, 	-- Item
			[56] = true, 	-- Item
			[87] = true, 	-- JA
			[88] = true, 	-- JA
			[89] = true, 	-- WS
			[90] = true		-- WS
		}

		if UnableToActionMessages[Message] then
			WriteDevLog("Unable to perform action timestamp recorded: " .. os.clock())
			STATE_UNABLE_TO_CAST_TIMESTAMP = os.clock()
		end

	elseif id == 0x00E then
		if _G[YAG_SETTINGS]["MonitorMagicBurstState"] then

			local NPCUpdatePacket = LIBRARY_PACKETS.parse('incoming', original)
			local NPCStatus = NPCUpdatePacket["Status"]

			-- NPC status is dead
			if NPCStatus == 2 or NPCStatus == 3 then
				local NPCID = NPCUpdatePacket["NPC"]
				DeleteMagicBurstTracking(NPCID)
			end
		end
	end
end