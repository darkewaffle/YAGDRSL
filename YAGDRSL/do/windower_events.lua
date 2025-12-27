require "YAGDRSL/debug/chat.lua"

function RegisterWindowerEvent(EventName, FunctionName)
	local RegisteredID = windower.raw_register_event(EventName, FunctionName)

	if RegisteredID then
		table.insert(_G[TRACK_REGISTERED_EVENTS], RegisteredID)
	else
		ChatError("Attempt to register event returned invalid ID.")
	end
end

function UnregisterWindowerEvents()
	for _, RegisteredID in ipairs(_G[TRACK_REGISTERED_EVENTS]) do
		windower.unregister_event(RegisteredID)
	end

	_G[TRACK_REGISTERED_EVENTS] = {}
end