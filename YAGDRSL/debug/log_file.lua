require "YAGDRSL/do/modify_strings.lua"

local LOG_FILE_PATH = windower.addon_path .. "data/export/YAG_log.txt"
local LogSequence = 1

function AddToLogFile(Reason, Message)
	local SequenceLabel = tostring(LogSequence) .. " "
	local LogStart = SequenceLabel .. "START = " .. os.date("%c") .. " @" .. os.clock() .. "\n"
	local LogReason = SequenceLabel .. "REASON = " .. tostring(Reason) .. "\n"
	local LogMessage = ""

	if type(Message) == "table" then
		for Key, Value in pairs(Message) do
			local KeyString = SetStringWidth(Key, 25)
			local ValueString = tostring(Value)
			LogMessage = LogMessage .. SequenceLabel .. "KEY=" .. KeyString .. "   " .. "VALUE=" .. ValueString .. "\n"
		end
	else
		LogMessage = SequenceLabel .. tostring(Message) .. "\n"
	end

	local LogFile = io.open(LOG_FILE_PATH, "a+")
	LogFile:write(LogStart)
	LogFile:write(LogReason)
	LogFile:write(LogMessage)

	local LogEnd = SequenceLabel .. "END = " .. os.date("%c") .. " @" .. os.clock() .. "\n\n"
	LogFile:write(LogEnd)
	LogFile:close()

	LogSequence = LogSequence + 1
end