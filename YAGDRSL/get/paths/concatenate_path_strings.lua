-- Formats string elements to look like a lua table definition.

function ConcatenatePathStrings(...)
	local InputStrings = {...}
	local Root = table.remove(InputStrings, 1)
	local Output = Root

	for key, value in ipairs(InputStrings) do
		Output = Output .. FormatPathElementAsString(value)
	end

	return Output
end

function FormatPathElementAsString(PathElement)
	local ContainsSpace =  string.match(PathElement, "%s")
	
	if ContainsSpace then
		PathElement = '["' .. PathElement .. '"]'
	else
		PathElement = "." .. PathElement
	end

	return PathElement
end