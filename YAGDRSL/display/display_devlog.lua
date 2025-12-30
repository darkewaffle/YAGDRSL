require "texts"
require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/do/math_helpers.lua"

local DisplayDevLog = {}

function InitializeDisplayDevLog()
	local DisplayContents = GetDisplayDevLogContent()

	local DisplaySettings = GetControlPanelSettings()
	DisplaySettings.pos.x = 100
	DisplaySettings.pos.y = 100
	DisplaySettings.text.size = 10
	DisplaySettings.padding = 2

	DisplayDevLog = texts.new(DisplayContents, DisplaySettings)
	DisplayDevLog:visible(true)
end

function UpdateDisplayDevLog()
	local DevLogContent = GetDisplayDevLogContent()
	DisplayDevLog:text(DevLogContent)
end

function GetDisplayDevLogContent()
	local TotalLogs = #_G[DEVELOPER_LOG]
	local LogsToDisplay = 10
	local LogStart = Clamp(TotalLogs - LogsToDisplay, 0, TotalLogs)

	local DevLogContents = ""

	for i=LogStart, TotalLogs do
		ChatNotice(i)
		ChatError(LogStart, TotalLogs)
		if _G[DEVELOPER_LOG][i] then
			DevLogContents = DevLogContents .. _G[DEVELOPER_LOG][i] .. "\n"
		end
	end

	return DevLogContents
end

function DestroyDisplayDevLog()
	DisplayDevLog:visible(false)
	DisplayDevLog = {}
end

function WriteDevLog(Label, Message)
	Label = tostring(Label) or ""
	Message = tostring(Message) or ""
	table.insert(_G[DEVELOPER_LOG], Label .. ": " .. Message)

	if STATE_DISPLAY_DEV_LOG then
		UpdateDisplayDevLog()
	end
end