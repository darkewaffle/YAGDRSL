require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/do/modify_strings.lua"

function AddPerformanceLogEntry(Label, Message)
	Label = tostring(Label) or ""
	Message = tostring(Message) or ""

	local LogEntry = ""
	local LabelPresent = false

	if Label ~= "" and Label ~= "nil" then
		LogEntry = Label
		LabelPresent = true
	end

	if Message ~= "" and Message ~= "nil" then
		if LabelPresent then
			LogEntry = LogEntry .. " - " .. Message
		else
			LogEntry = Message
		end
	end

	table.insert(_G[PERFORMANCE_LOG], {["Description"]=LogEntry, ["Time"]=os.clock()})
end

function ResetPerformanceLog()
	_G[PERFORMANCE_LOG] = {}
end

function ChatPerformanceLog()
	local Delta = 0

	local Header = string.format("%s | %s | %s", SetStringWidth("Timestamp", 10), SetStringWidth("Delta", 10), "Description")
	ChatDebugForced(Header)

	for i=1, #_G[PERFORMANCE_LOG] do

		if i == 1 then
			Delta = 0
		else
			Delta = _G[PERFORMANCE_LOG][i]["Time"] - _G[PERFORMANCE_LOG][i-1]["Time"]
		end

		-- Convert to ms
		Delta = Delta * 1000
		Delta = FormatMilliseconds(Delta)

		local LogEntry = string.format("%.3f | %s | %s", _G[PERFORMANCE_LOG][i]["Time"], Delta, _G[PERFORMANCE_LOG][i]["Description"])	
		ChatDebugForced(LogEntry)

	end
end

function FormatMilliseconds(FloatingPoint)
	FloatingPoint = string.format("%.2f", FloatingPoint)
	local DecimalLocation = string.find(FloatingPoint, "%.")

	local FPLeft = string.sub(FloatingPoint, 1, DecimalLocation - 1)
	local FPLeft = SetStringWidth(FPLeft, 4, "0", true)
	local FPRight = string.sub(FloatingPoint, DecimalLocation + 1, #FloatingPoint) 

	return FPLeft .. "." .. FPRight .. "ms"
end