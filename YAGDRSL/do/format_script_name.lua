function FormatScriptName(ScriptName)
	if ScriptName and ScriptName ~= "" then
		-- If the last 4 characters of ScriptName are not ".lua" then append ".lua" to the end.
		if string.sub(ScriptName, -4, -1) ~= ".lua" then
			ScriptName = ScriptName .. ".lua"
		end
	end
	return ScriptName
end