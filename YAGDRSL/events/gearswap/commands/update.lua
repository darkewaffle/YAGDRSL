function SelfCommandUpdate(CommandInputs)
	local MapStringToBoolean =
	{
		["true"] = true,
		["false"] = false
	}

	local UpdateSource = CommandInputs[1] or EVENT_SELF_COMMAND_UPDATE
	local IgnoreLock = MapStringToBoolean[CommandInputs[2]] or false

	ForceStatusUpdate(UpdateSource, IgnoreLock)
end