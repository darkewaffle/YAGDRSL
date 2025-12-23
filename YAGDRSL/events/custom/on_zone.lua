--@@require "YAGDRSL/events/custom/force_status_update.lua"
--@@require "YAGDRSL/do/reset_player_state.lua"

function RegisterOnZoneChange()
	windower.raw_register_event('zone change', OnZoneChange)
end

function OnZoneChange()
	ChatCheckpoint("OnZoneChange entered")

	-- Reset player state variables. Just in case they get buggered when zoning.
	ResetPlayerStateVariables()

	if _G[YAG_SETTINGS]["ForceUpdateAfterZone"] then
		coroutine.schedule(ForceStatusUpdateCommand, _G[YAG_SETTINGS]["ForceUpdateAfterZoneDelay"])
	end

end