require "YAGDRSL/events/gearswap/commands/YAG_commands.lua"

function self_command(CommandInputs)
	local CommandInputs = CommandInputs
	if type(CommandInputs) == 'string' then
		CommandInputs = T(CommandInputs:split(' '))
		if #CommandInputs == 0 then
			return
		end
	end

	local PrimaryCommand = CommandInputs[1]

	if CommandMap[PrimaryCommand] then
		table.remove(CommandInputs, 1)
		CommandMap[PrimaryCommand](CommandInputs)
	else
		ChatDebug("Command not recognized. Sending to HookUserSelfCommand.")
		HookUserSelfCommand(CommandInputs) -- @Hook
	end
end

function HookUserSelfCommand(CommandInputs) -- @Hook
	-- Do nothing. User can override this in order to process their own commands.
end

CommandMap =
{
	["cycle"]       = SelfCommandCycle,
	["debug"]       = SelfCommandDebug,
	["demo"]        = SelfCommandDemo,
	["devlog"]      = SelfCommandDevLog,
	["equip"]       = SelfCommandEquipPath,
	["equippath"]   = SelfCommandEquipPath,
	["loadalljobs"] = SelfCommandLoadAllJobs,
	["orders"]      = SelfCommandOrders,
	["ring"]        = SelfCommandRing,
	["showlog"]     = SelfCommandShowLog,
	["tables"]      = SelfCommandTables,
	["test1"]       = SelfCommandTest1,
	["test2"]       = SelfCommandTest2,
	["update"]      = SelfCommandUpdate,
	["updatetick"]  = SelfCommandUpdateTick,
	["validate"]    = SelfCommandValidate
}