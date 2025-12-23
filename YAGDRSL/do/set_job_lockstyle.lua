require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/get/get_jobcontrol.lua"

function SetJobLockStyle()
	local LockStyleIndex = tostring(GetMainJobLockStyle())
	ChatDebug("Set LockStyle", LockStyleIndex)
	send_command("input /lockstyleset " .. LockStyleIndex)
end