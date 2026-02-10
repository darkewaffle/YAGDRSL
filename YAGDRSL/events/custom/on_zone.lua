require "YAGDRSL/do/windower_events.lua"

function RegisterOnZoneChange()
	RegisterWindowerEvent("zone change", OnZoneChange)
end

function OnZoneChange()
	ChatCheckpoint("OnZoneChange entered")

	-- Reset player state variables. Just in case they get buggered when zoning.
	ResetPlayerStateVariables()

	if _G[YAG_SETTINGS]["ForceUpdateAfterZone"] then
		coroutine.schedule(ForceStatusUpdateCommand, _G[YAG_SETTINGS]["ForceUpdateAfterZoneDelay"])
	end

	if _G[YAG_SETTINGS]["MonitorMagicBurstState"] then
		ResetMagicBurstTracking()
	end

end