require "YAGDRSL/do/load_file.lua"
require "YAGDRSL/get/get_jobcontrol.lua"

function SelfCommandLoadAllJobs()

	-- Iterate through JobControls
	for JobShortName, JobSettings in pairs(_G[YAG_SETTINGS]["JobControls"]) do

		-- Only proceed when the job is not the current job (since they have already been loaded)
		if JobShortName ~= GetCharacterJobShort() then

			-- Attempt to load the equipment and logic file for each job
			LoadJobEquipmentFile(JobShortName)
			LoadJobLogicFile(JobShortName)

		end
	end

	ChatNotice("LoadAllJobs will alter the contents of all tables and is only appropriate to test the validity of .lua files.")
	ChatNotice("You should 'gs reload' afterwards to return to normal operation.")

end