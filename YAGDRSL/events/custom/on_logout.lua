require "YAGDRSL/do/windower_events.lua"

function RegisterOnLogOut()
	RegisterWindowerEvent("logout", OnLogOut)
end

function OnLogOut()
	ChatCheckpoint("OnLogOut entered")

	UnregisterWindowerEvents()
end