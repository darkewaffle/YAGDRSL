require "YAGDRSL/get/get_buff.lua"

function SendCancel(BuffToCancel)
	if BuffToCancel and GetBuffNameIsValid(BuffToCancel) then

		local BuffID = GetBuffID(BuffToCancel)
		if BuffID and buffactive[BuffID] then
			ChatDebug("Canceling ", BuffToCancel)
			BuffCancel(BuffID)
		else
			ChatError("BuffID not found for", BuffToCancel)
		end

	else
		ChatError("Cancel not submitted for invalid buff - ", BuffToCancel)
	end
end

-- @YAG Copied from https://github.com/Windower/Lua/blob/live/addons/cancel/cancel.lua as of 12/13/2025
-- @YAG No changes have been made except for the function name.
function BuffCancel(id)
	windower.packets.inject_outgoing(0xF1,string.char(0xF1,0x04,0,0,id%256,math.floor(id/256),0,0)) -- Inject the cancel packet
end