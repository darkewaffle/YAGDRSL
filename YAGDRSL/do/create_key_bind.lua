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
	for Index, KeyDetails in ipairs(_G[TRACK_KEY_BINDS]) do
		UnbindKey(KeyDetails["KeyCode"])
	end
end

function ClearTrackedKeyFromSource(Source)
	for Index, KeyDetails in ipairs(_G[TRACK_KEY_BINDS]) do
		if KeyDetails["Source"] == Source then
			UnbindKey(KeyDetails["KeyCode"])
			table.remove(_G[TRACK_KEY_BINDS], Index)
			break
		end
	end
end