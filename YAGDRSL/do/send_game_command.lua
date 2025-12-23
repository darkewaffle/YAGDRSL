require "YAGDRSL/debug/chat.lua"

function SendGameCommand(CommandPrefix, CommandName, CommandTarget)
	
	local FinalCommand = '@input '

	if CommandPrefix and CommandPrefix ~= "" then
		FinalCommand = FinalCommand .. CommandPrefix .. ' '
	else
		ChatError("Terminating SendGameCommand", "Invalid Command Prefix")
		return
	end

	if CommandName and CommandName ~= "" then
		FinalCommand = FinalCommand .. '"' .. CommandName .. '" '
	else
		ChatError("Terminating SendGameCommand", "Invalid Command Name")
		return
	end

	if CommandTarget and CommandTarget ~= "" then
		FinalCommand = FinalCommand .. CommandTarget
	else
		ChatError("Terminating SendGameCommand", "Invalid Command Target")
		return
	end

	send_command(FinalCommand)
end

function SendGameJA(CommandName, CommandTarget)
	SendGameCommand(PREFIX_JA, CommandName, CommandTarget)
end

function SendGameMagic(CommandName, CommandTarget)
	SendGameCommand(PREFIX_MAGIC, CommandName, CommandTarget)
end

function SendGameWS(CommandName, CommandTarget)
	SendGameCommand(PREFIX_WS, CommandName, CommandTarget)
end

function SendGameItem(CommandName, CommandTarget)
	SendGameCommand(PREFIX_ITEM, CommandName, CommandTarget)
end