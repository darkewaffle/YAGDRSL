require "YAGDRSL/do/modify_strings.lua"
require "YAGDRSL/mappings/YAG_mappings.lua"

function GetSpellCategory(spell)

	if spell.prefix == PREFIX_ITEM then
		return CATEGORY_ITEM

	elseif spell.prefix == PREFIX_JA then
		return CATEGORY_JA

	elseif spell.prefix == PREFIX_MAGIC then
		return CATEGORY_MAGIC

	elseif spell.prefix == PREFIX_NINJUTSU then
		return CATEGORY_MAGIC

	elseif spell.prefix == PREFIX_PET then
		return CATEGORY_JA

	elseif spell.prefix == PREFIX_RA then
		return CATEGORY_RA

	elseif spell.prefix == PREFIX_SONG then
		return CATEGORY_MAGIC

	elseif spell.prefix == PREFIX_WS then
		return CATEGORY_WS

	else
		return spell.prefix
	end
end

function GetSpellDamageType(SpellCategory, SpellName, SpellElement)

	local ElementTypeMap =
	{
		[-1] = MAP_DAMAGE_PHYSICAL,
		[0] = MAP_DAMAGE_MAGICAL,
		[1] = MAP_DAMAGE_MAGICAL,
		[2] = MAP_DAMAGE_MAGICAL,
		[3] = MAP_DAMAGE_MAGICAL,
		[4] = MAP_DAMAGE_MAGICAL,
		[5] = MAP_DAMAGE_MAGICAL,
		[6] = MAP_DAMAGE_MAGICAL,
		[7] = MAP_DAMAGE_MAGICAL,
		[15] = MAP_DAMAGE_PHYSICAL
	}

	local ElementNameMap =
	{
		[ELEMENT_PHYSICAL] =  MAP_DAMAGE_PHYSICAL,
		[ELEMENT_FIRE] =      MAP_DAMAGE_MAGICAL,
		[ELEMENT_ICE] =       MAP_DAMAGE_MAGICAL,
		[ELEMENT_WIND] =      MAP_DAMAGE_MAGICAL,
		[ELEMENT_EARTH] =     MAP_DAMAGE_MAGICAL,
		[ELEMENT_LIGHTNING] = MAP_DAMAGE_MAGICAL,
		[ELEMENT_WATER] =     MAP_DAMAGE_MAGICAL,
		[ELEMENT_LIGHT] =     MAP_DAMAGE_MAGICAL,
		[ELEMENT_DARK] =      MAP_DAMAGE_MAGICAL,
		[ELEMENT_NONE] =      MAP_DAMAGE_PHYSICAL
	}

	if SpellCategory == CATEGORY_ITEM then
		return MAP_DAMAGE_NONE

	elseif SpellCategory == CATEGORY_JA then
		return MapGetJADamageType(SpellName)

	elseif SpellCategory == CATEGORY_MAGIC then
		return ElementNameMap[SpellElement]

	elseif SpellCategory == CATEGORY_RA then
		return MAP_DAMAGE_PHYSICAL

	elseif SpellCategory == CATEGORY_WS then
		return MapGetWSDamageType(SpellName)
	else
		return MAP_DAMAGE_NONE
	end
end

function GetSpellElementName(spell)
	return spell.element
end

function GetSpellElementID(spell)
	local ElementName = GetSpellElementName(spell)
	for Index, ElementData in pairs(WINDOWER_RESOURCES.elements) do
		if ElementData["en"] == ElementName then
			return Index
		end
	end
end

function GetSpellName(spell)
	return spell.name
end

function GetSpellSkill(spell)
	return spell.skill
end

function GetSpellTarget(spell, TargetClass)
	-- Consts in the library are all lower case however spell.targets are all proper cased (Self, Enemy, etc)
	TargetClass = CapitalizeFirstLetter(TargetClass)
	if spell.targets then
		if spell.targets[TargetClass] then
			return true
		end
	else
		return false
	end
end

function GetSpellTargetSelf(spell)
	if GetSpellTargetType(spell) == "SELF" then
		return true
	else
		return false
	end
end

function GetSpellTargetParty(spell)
	if spell.target["ispartymember"] then
		return true
	else
		return false
	end
end

function GetSpellTargetAlly(spell)
	if spell.target["isallymember"] then
		return true
	else
		return false
	end
end

function GetSpellTargetPlayer(spell)
	if GetSpellTargetType(spell) == "PLAYER" then
		return true
	else
		return false
	end
end

function GetSpellTargetNPC(spell)
	if GetSpellTargetType(spell) == "NPC" then
		return true
	else
		return false
	end
end

function GetSpellTargetEnemy(spell)
	if GetSpellTargetType(spell) == "MONSTER" then
		return true
	else
		return false
	end
end

function GetSpellTargetType(spell)
	return spell.target.type
end

function GetSpellTargetPrimary(spell)
	if GetSpellTargetType(spell) == "SELF" then
		return SPELL_TARGET_SELF
	elseif GetSpellTargetType(spell) == "PLAYER" or GetSpellTargetType(spell) == "NPC" then
		return SPELL_TARGET_FRIEND
	elseif GetSpellTargetType(spell) == "MONSTER" then
		return SPELL_TARGET_ENEMY
	else
		return nil
	end
end

function GetSpellTargetFriendEnemy(spell)
	if GetSpellTargetType(spell) == "SELF" or GetSpellTargetType(spell) == "PLAYER" or GetSpellTargetType(spell) == "NPC" then
		return SPELL_TARGET_FRIEND
	elseif GetSpellTargetType(spell) == "MONSTER" then
		return SPELL_TARGET_ENEMY
	else
		return nil
	end
end

function GetSpellTargetRaw(spell)
	return spell.target.raw
end

function GetSpellTargetID(spell)
	return spell.target.id
end

function GetSpellTargetHPDecimal(spell)
	if spell.target.hpp then
		return spell.target.hpp / 100
	else
		return 0
	end
end

function GetSpellType(spell)
	local SpellType = spell.type

	if SpellType == "BlackMagic" then
		SpellType = MAP_CLASS_BLACK_MAGIC
	elseif SpellType == "WhiteMagic" then
		SpellType = MAP_CLASS_WHITE_MAGIC
	else
		SpellType = string.lower(SpellType)
	end

	return SpellType
end

function GetSpellRecastID(spell)
	return spell.recast_id
end