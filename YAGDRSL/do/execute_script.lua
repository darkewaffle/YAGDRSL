require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/do/format_script_name.lua"

function ExecuteScript(FileName, Description)
	FileName = FormatScriptName(FileName)

	if FileName and FileName ~= "" then
		ChatDebug("SCRIPT: Executing " .. Description, FileName)
		send_command("exec " .. FileName)
	else
		ChatDebug("SCRIPT: Not executing " .. Description, FileName)
	end
end