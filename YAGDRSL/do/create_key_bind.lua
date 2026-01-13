-- @User

function BindKey(KeyCode, CommandText, AutomaticUnbind)
	if AutomaticUnbind == true then
		TrackKeyBind(KeyCode)
	end

	send_command('bind ' .. KeyCode .. " " .. CommandText)
end

function UnbindKey(KeyCode)
	send_command('unbind ' .. KeyCode)
end

-- Records the bound keys for mods so they can be unbound later during unload.
function TrackKeyBind(KeyCode, Source)
	table.insert(_G[TRACK_KEY_BINDS], {["KeyCode"]=KeyCode, ["Source"]=Source})
end

function ClearTrackedKeyBinds()
	for Index, BoundKey in ipairs(_G[TRACK_KEY_BINDS]) do
		UnbindKey(BoundKey)
	end
end