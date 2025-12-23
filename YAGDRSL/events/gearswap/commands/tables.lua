local AllTablesList = {}

function SelfCommandTables(CommandInputs)

	local FilePath = windower.addon_path .. "data/export/YAG_tables.txt"
	local AllTablesString = ""

	AssembleTablesForOutput(_G[SETS_ROOT_NAME][STATUS_ENGAGED], SETS_ROOT_NAME .. "." .. STATUS_ENGAGED)
	AssembleTablesForOutput(_G[SETS_ROOT_NAME][STATUS_IDLE],    SETS_ROOT_NAME .. "." .. STATUS_IDLE)
	AssembleTablesForOutput(_G[SETS_ROOT_NAME][STATUS_RESTING], SETS_ROOT_NAME .. "." .. STATUS_RESTING)
	
	table.sort(AllTablesList)
	for _, Value in ipairs(AllTablesList) do
		AllTablesString = AllTablesString .. Value .. "\n"
	end

	AllTablesList = {}
	AssembleTablesForOutput(_G[SETS_ROOT_NAME][EVENT_PRECAST], SETS_ROOT_NAME .. "." .. EVENT_PRECAST)

	table.sort(AllTablesList)
	for _, Value in ipairs(AllTablesList) do
		AllTablesString = AllTablesString .. Value .. "\n"
	end

	local TableOutput = io.open(FilePath, "w+")
	TableOutput:write(AllTablesString)
	TableOutput:close()

	AllTablesList = {}
end

function AssembleTablesForOutput(CoreTable, CurrentPath)
	if not CoreTable then
		return

	else
		-- Record the string path of the current table.
		table.insert(AllTablesList, CurrentPath)
	
		for Key, Value in pairs(CoreTable) do
			if type(Value) == "table" then

				-- Value is a non-empty table. Continue iterating into it.
				if next(Value) then
					local NextPath = CurrentPath .. "." .. Key
					AssembleTablesForOutput(Value, NextPath)

				-- Value is an empty table. Record the path and this 'branch' ends so to speak.
				else
					table.insert(AllTablesList, CurrentPath .. "." .. Key)
				end
			end
		end
	end
end