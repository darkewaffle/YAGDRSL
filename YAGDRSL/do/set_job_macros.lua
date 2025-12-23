require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/get/get_jobcontrol.lua"

function SetJobMacroBook()
	local MacroBookIndex = tostring(GetMainJobMacroBook())
	ChatDebug("Set Macro Book", MacroBookIndex)
	send_command("input /macro book ".. MacroBookIndex)
end

function SetJobMacroSet()
	local MacroSetIndex = tostring(GetMainJobMacroSet())
	ChatDebug("Set Macro Set", MacroSetIndex)
	send_command("input /macro set " .. MacroSetIndex)
end