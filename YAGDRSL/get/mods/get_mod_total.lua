require "YAGDRSL/get/mods/get_mod_base.lua"

function GetPrecastModOffense(SpellAttributes)
	return GetPrecastModOffenseBase(SpellAttributes)
end

function GetPrecastModDefense(SpellAttributes)
	return GetPrecastModDefenseBase(SpellAttributes)
end

function GetMidcastModOffense(SpellAttributes)
	return GetMidcastModOffenseBase(SpellAttributes)
end

function GetMidcastModDefense(SpellAttributes)
	return GetMidcastModDefenseBase(SpellAttributes)
end

function GetStatusModOffense(CharacterStatus)
	return GetStatusModOffenseBase(CharacterStatus)
end

function GetStatusModDefense(CharacterStatus)
	return GetStatusModDefenseBase(CharacterStatus)
end