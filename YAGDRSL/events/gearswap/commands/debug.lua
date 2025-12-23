--@@require "YAGDRSL/debug/chat.lua"

-- Toggles the display of debug messages on/off.

function SelfCommandDebug(CommandInputs)
	_G[YAG_SETTINGS]["ShowDebugMessages"] = not _G[YAG_SETTINGS]["ShowDebugMessages"]
	local Message = ""
	if _G[YAG_SETTINGS]["ShowDebugMessages"] then
		Message = "enabled"
	else
		Message = "disabled"
	end

	ChatDebugForced("Debug messages have been", Message)
end