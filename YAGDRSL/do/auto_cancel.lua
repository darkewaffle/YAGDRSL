require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/do/send_cancel.lua"

function AutomaticBuffCancel(SpellAttributes)
	local DelayAmount = 0
	local SpellsTriggeringAutoCancel = _G[TRACK_AUTO_CANCEL_SPELLS]

	-- Spells in _G[TRACK_AUTO_CANCEL_SPELLS] will be populated by user calls to SetAutoCancelBuff.
	for SpellName, Buffs in pairs(SpellsTriggeringAutoCancel) do

		-- If the name of the spell being cast matches a name in the trigger list and the spell is being cast on self, then proceed.
		-- There may be a future case for cancel on targeting other than self but this is sufficient for now.
		if SpellName == SpellAttributes["Name"] and SpellAttributes["TargetSelf"] then
			ChatDebug("Automatic buff cancel triggered by", SpellName)

			for Index, BuffName in ipairs(Buffs) do
				if buffactive[BuffName] then
					ChatDebug("Cancelable buff found", BuffName)
					SendCancel(BuffName)

					-- Since a cancelable buff was found and the cancel command was sent, set a delay amount to return for cast_delay.
					DelayAmount = _G[YAG_SETTINGS]["AutoCancelDelayAmount"]
				end
			end

			break
		end
	end

	-- This function should be called in Precast and return a DelayAmount that will be given to cast_delay in order to provide time for buff cancellation to apply.
	-- If no buff was found then it should return 0 and have no effect.
	return DelayAmount
end