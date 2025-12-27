local ChatBlue = 220
local ChatGreen = 204
local ChatGrey = 161
local ChatPurple = 209
local ChatRed = 39
local ChatWhite = 1
local ChatYellow = 36

function Chat(Prefix, Label, Message, Color)
	Prefix = tostring(Prefix)
	if Prefix ~= "nil" then
		Prefix = Prefix .. ": "
	else
		Prefix = ""
	end

	Label = tostring(Label)
	if Label ~= "nil" then
		Label = Label .. " "
	else
		Label = ""
	end

	Message = tostring(Message)
	if Message ~= "nil" then
		Message = Message
	else
		Message = ""
	end

	Color = Color or 1
	add_to_chat(Color, Prefix .. Label .. Message)
end

function ChatDebug(Label, Message)
	if _G[YAG_SETTINGS]["ShowDebugMessages"] or (not STATE_PLAYER_SETTINGS_LOADED and ShowDebugMessages) then
		Chat("DEBUG", Label, Message, ChatGrey)
	end
end

function ChatDebugForced(Label, Message)
	Chat("DEBUG", Label, Message, ChatGrey)
end

function ChatCheckpoint(Label, Message, CreateLog)
	if _G[YAG_SETTINGS]["ShowDebugMessages"] then
		Chat("CHECKPOINT", Label, Message, ChatPurple)
	end

	if CreateLog then
		AddPerformanceLogEntry(Label, Message)
	end
end

function ChatCheckpointLogged(Label, Message)
	ChatCheckpoint(Label, Message, true)
end


function ChatSet(Label, Message)
	if _G[YAG_SETTINGS]["ShowDebugMessages"] then
		Chat("SET", Label, Message, ChatGreen)
	end
end

function ChatBlankLine()
	if _G[YAG_SETTINGS]["ShowDebugMessages"] then
		add_to_chat(1, " ")
	end
end

function ChatBlankLineForced()
	add_to_chat(1, " ")
end

function ChatDashLine()
	local Line = string.rep(" -", 80)

	if _G[YAG_SETTINGS]["ShowDebugMessages"] then
		add_to_chat(1, Line)
	end
end

function ChatDashLineForced()
	local Line = string.rep(" -", 80)
	add_to_chat(1, Line)
end

function ChatWarning(Label, Message)
	if _G[YAG_SETTINGS]["ShowDebugMessages"] then
		Chat("WARNING", Label, Message, ChatYellow)
	end
end

function ChatError(Label, Message)
	Chat("ERROR", Label, Message, ChatRed)
	print("ERROR: " .. tostring(label) .. " - " .. tostring(Message))
end

function ChatNotice(Label, Message)
	Chat("Notice", Label, Message, ChatGreen)
end

function ChatMessage(Label, Message)
	Chat(nil, Label, Message, ChatBlue)
end