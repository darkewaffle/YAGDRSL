require "YAGDRSL/mappings/YAG_mappings.lua"
require "YAGDRSL/get/get_spellattributes.lua"

local FriendlyTurn = true

-- Used by the demo command to construct a SpellAttributes object from just a Category and Name without a gearswap created 'spell'.
function DemoConstructSpellAttributes(SpellCategory, SpellName)

	local SpellAttributes = {}

	SpellAttributes["Name"] = SpellName
	SpellAttributes["Category"] = SpellCategory
	SpellAttributes["ParentGroup"] = MapGetParentGroup(SpellAttributes["Category"], SpellAttributes["Name"])
	SpellAttributes["ChildGroup"] = ""
	
	if SpellCategory == CATEGORY_WS then
		SpellAttributes["WSRange"] = MapGetWSRange(SpellAttributes["Name"])
	else
		SpellAttributes["WSRange"] = ""
	end

	if SpellCategory == CATEGORY_MAGIC then
		SpellAttributes["Skill"] = DemoGetSpellSkill(SpellAttributes["Name"], SpellAttributes["Category"])
	end

	local SpellElementID = DemoGetSpellElementID(SpellAttributes["Name"], SpellAttributes["Category"])
	SpellAttributes["DamageType"] = GetSpellDamageType(SpellAttributes["Category"], SpellAttributes["Name"], SpellElementID)


	if FriendlyTurn then
		SpellAttributes["TargetPrimary"] = SPELL_TARGET_FRIEND
		SpellAttributes["TargetFriendEnemy"] = SPELL_TARGET_FRIEND
		FriendlyTurn = false
	else
		SpellAttributes["TargetPrimary"] = SPELL_TARGET_ENEMY
		SpellAttributes["TargetFriendEnemy"] = SPELL_TARGET_ENEMY
		FriendlyTurn = true
	end

	SpellAttributes = RefineSpellAttributes(SpellAttributes)

	--ChatSpellAttributes(SpellAttributes)
	return SpellAttributes
end

function DemoGetSpellSkill (SpellName, SpellCategory)
	local SkillID = ""

	if SpellCategory == CATEGORY_MAGIC then
		for _, SpellData in pairs(WINDOWER_RESOURCES.spells) do
			if SpellData["en"] == SpellName then
				SkillID = SpellData["skill"]
				break
			end
		end
	end

	local SkillName = MapGetSkillShortName(WINDOWER_RESOURCES.skills[SkillID]["en"])
	return SkillName
end

function DemoGetSpellElementID(SpellName, SpellCategory)
	local SpellElement = ""

	-- The return from this value is only submitted to GetSpellDamageType which only cares about the element ID for Magic.
	if SpellCategory == CATEGORY_MAGIC then
		for _, SpellData in pairs(WINDOWER_RESOURCES.spells) do
			if SpellData["en"] == SpellName then
				SpellElement = SpellData["element"]
				break
			end
		end
	end

	return SpellElement
end