function FormatScriptName(ScriptName)
	if ScriptName and ScriptName ~= "" then
		-- If the last 4 characters of ScriptName are not ".txt" then append ".txt" to the end.
		if string.sub(ScriptName, -4, -1) ~= ".txt" then
			ScriptName = ScriptName .. ".txt"
		end
	end
	return ScriptName
end