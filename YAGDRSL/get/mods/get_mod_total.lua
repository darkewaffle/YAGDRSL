require "YAGDRSL/get/mods/get_mod_base.lua"

function GetPrecastModOffense(SpellAttributes)
	local BaseMod = GetPrecastModOffenseBase(SpellAttributes)
	return set_combine(BaseMod, BuffMod)
end

function GetPrecastModDefense(SpellAttributes)
	local BaseMod = GetPrecastModDefenseBase(SpellAttributes)
	return set_combine(BaseMod, BuffMod)
end

function GetMidcastModOffense(SpellAttributes)
	local BaseMod = GetMidcastModOffenseBase(SpellAttributes)
	return set_combine(BaseMod, BuffMod)
end

function GetMidcastModDefense(SpellAttributes)
	local BaseMod = GetMidcastModDefenseBase(SpellAttributes)
	return set_combine(BaseMod, BuffMod)
end

function GetStatusModOffense(CharacterStatus)
	local BaseMod = GetStatusModOffenseBase(CharacterStatus)
	return set_combine(BaseMod, BuffMod)
end

function GetStatusModDefense(CharacterStatus)
	local BaseMod = GetStatusModDefenseBase(CharacterStatus)
	return set_combine(BaseMod, BuffMod)
end