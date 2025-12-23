require "YAGDRSL/get/sets/build_set.lua"

function GetPrecastSet(SpellAttributes)
	return BuildEventSet(SpellAttributes, EVENT_PRECAST)
end

function GetMidcastSet(SpellAttributes)
	return BuildEventSet(SpellAttributes, EVENT_MIDCAST)
end