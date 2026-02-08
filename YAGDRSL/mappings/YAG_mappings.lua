require "YAGDRSL/mappings/constructed/items.lua"
require "YAGDRSL/mappings/constructed/buffs.lua"

require "YAGDRSL/mappings/static/action_messages.lua"
require "YAGDRSL/mappings/static/element_opposites.lua"
require "YAGDRSL/mappings/static/ja.lua"
require "YAGDRSL/mappings/static/skillchain_elements.lua"
require "YAGDRSL/mappings/static/skills.lua"
require "YAGDRSL/mappings/static/spells.lua"
require "YAGDRSL/mappings/static/ws.lua"
require "YAGDRSL/mappings/static/zones.lua"

function MapGetWSParentGroup(WSName)
	return _G[MAP_WS][WSName]["ParentGroup"] or ""
end

function MapGetSpellParentGroup(SpellName)
	return _G[MAP_SPELLS][SpellName]["ParentGroup"] or ""
end

function MapGetJAParentGroup(JAName)
	return _G[MAP_JA][JAName]["ParentGroup"] or ""
end

function MapGetParentGroup(SpellCategory, SpellName)

	if SpellCategory == CATEGORY_JA then
		return MapGetJAParentGroup(SpellName)

	elseif SpellCategory == CATEGORY_MAGIC then
		return MapGetSpellParentGroup(SpellName)

	elseif SpellCategory == CATEGORY_RA then
		return ""

	elseif SpellCategory == CATEGORY_WS then
		return ""

	else
		return ""
	end

end

function MapGetWSRange(WSName)
	return _G[MAP_WS][WSName]["Range"] or ""
end

function MapGetWSDamageType(WSName)
	return _G[MAP_WS][WSName]["DamageType"]
end

function MapGetJADamageType(JAName)
	return _G[MAP_JA][JAName]["DamageType"]
end

function MapGetZoneIsTown(ZoneName)
	if _G[MAP_ZONES] and ZoneName then
		return _G[MAP_ZONES][ZoneName]["IsTown"] or false
	else
		return false
	end
end

function MapGetZoneIsAdoulin(ZoneName)
	return _G[MAP_ZONES][ZoneName]["IsAdoulin"] or false
end

function MapGetZoneClass(ZoneName)
	if MapGetZoneIsTown(ZoneName) then
		return ZONE_TOWN
	else
		return ZONE_FIELD
	end
end

function MapGetSkillShortName(SkillName)
	if SkillName and SkillName ~= "" then
		return _G[MAP_SKILLS][SkillName]["shortname"] or ""
	end
end

function MapGetOppositeElement(ElementName)
	if ElementName then
		return _G[MAP_ELEMENT_OPPOSITES][ElementName]
	end
end