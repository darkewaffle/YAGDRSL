require "YAGDRSL/get/get_character.lua"

local PlaceholderInt = 1
local PlaceholderString = "JobControl Not Found"

function GetJobControl(JobShortName, ControlName)
	local ControlValue = _G[YAG_SETTINGS]["JobControls"][JobShortName][ControlName]
	if ControlValue then
		return ControlValue
	else
		return nil
	end
end

function GetMainJobControl(ControlName)
	return GetJobControl(GetCharacterJobShort(), ControlName)
end

function GetSubJobControl(ControlName)
	return GetJobControl(GetCharacterSubJobShort(), ControlName)
end

function GetMainJobMacroBook()
	return GetMainJobControl(JOB_CONTROL_MACRO_BOOK) or PlaceholderInt
end

function GetMainJobMacroSet()
	return GetMainJobControl(JOB_CONTROL_MACRO_SET) or PlaceholderInt
end

function GetMainJobLockStyle()
	return GetMainJobControl(JOB_CONTROL_LOCK_STYLE) or PlaceholderInt
end

function GetMainJobFileEquipment()
	return GetMainJobControl(JOB_CONTROL_FILE_EQUIPMENT) or PlaceholderString
end

function GetMainJobFileLogic()
	return GetMainJobControl(JOB_CONTROL_FILE_LOGIC) or PlaceholderString
end

function GetMainJobBindScript()
	return GetMainJobControl(JOB_CONTROL_SCRIPT_BIND_MAIN) or PlaceholderString
end

function GetSubJobBindScript()
	return GetSubJobControl(JOB_CONTROL_SCRIPT_BIND_SUB) or PlaceholderString
end

function GetJobFileEquipment(JobShortName)
	return GetJobControl(JobShortName, JOB_CONTROL_FILE_EQUIPMENT) or PlaceholderString
end

function GetJobFileLogic(JobShortName)
	return GetJobControl(JobShortName, JOB_CONTROL_FILE_LOGIC) or PlaceholderString
end