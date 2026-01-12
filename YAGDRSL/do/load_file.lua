require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/get/get_jobcontrol.lua"

function LoadPlayerFile(FileName)
	ChatDebugForced("Attempting to load", FileName)
	require(FileName)
end

function LoadPlayerFileProtected(FileName, FileDescription)

	local FileLoaded = false
	local Error = ""

	if FileName == nil or FileName == "" then
		ChatError(FileDescription .. " filename is invalid. Load aborted.")
		return FileLoaded
	end

	FileLoaded, Error = pcall(LoadPlayerFile, FileName)

	if FileLoaded then
		ChatDebugForced(FileDescription .. " loaded successfully -", FileName)
	else
		ChatError(FileDescription .. " failed to load -", FileName)
		ChatError(Error)
	end

	return FileLoaded
end

function LoadMainJobEquipmentFile()
	local MainJobEquipmentFileName = GetMainJobFileEquipment()
	return LoadPlayerFileProtected(MainJobEquipmentFileName, "Main job equipment")
end

function LoadMainJobLogicFile()
	local MainJobLogicFileName = GetMainJobFileLogic()
	return LoadPlayerFileProtected(MainJobLogicFileName, "Main job logic")
end

function LoadMainJobFiles()
	STATE_JOB_EQUIPMENT_LOADED = LoadMainJobEquipmentFile()
	STATE_JOB_LOGIC_LOADED = LoadMainJobLogicFile()
end

function LoadJobEquipmentFile(JobShortName)
	local JobEquipmentFileName = GetJobFileEquipment(JobShortName)
	return LoadPlayerFileProtected(JobEquipmentFileName, JobShortName .. " job equipment")
end

function LoadJobLogicFile(JobShortName)
	local JobLogicFileName = GetJobFileLogic(JobShortName)
	return LoadPlayerFileProtected(JobLogicFileName, JobShortName .. " job logic")
end