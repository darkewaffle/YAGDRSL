require "YAGDRSL/do/windower_events.lua"
require "YAGDRSL/events/custom/chunks/0x028_npc.lua"
require "YAGDRSL/events/custom/chunks/0x028_pet.lua"
require "YAGDRSL/events/custom/chunks/0x028_spell.lua"
require "YAGDRSL/events/custom/chunks/0x028_weaponskill.lua"

function RegisterOnChunk()
	if _G[YAG_SETTINGS]["MonitorMagicBurstState"] then
		LIBRARY_PACKETS = require "packets"
		RegisterWindowerEvent("incoming chunk", OnChunk)
	end
end

function OnChunk(id, original, modified, injected, blocked)
	-- Action packet that notifies the client of an actor doing something
	if id == 0x028 then

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
end