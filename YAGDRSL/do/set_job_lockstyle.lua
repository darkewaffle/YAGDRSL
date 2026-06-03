require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/get/get_jobcontrol.lua"

function SetJobLockStyle()
	local LockStyleIndex = GetMainJobLockStyle()

	if LockStyleIndex ~= 0 then
		LockStyleIndex = tostring(LockStyleIndex)
		ChatDebug("Set LockStyle", LockStyleIndex)
		send_command("input /lockstyleset " .. LockStyleIndex)
	end

	STATE_SET_LOCKSTYLE_PENDING = false
end