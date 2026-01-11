require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/get/get_spell.lua"
require "YAGDRSL/mappings/YAG_mappings.lua"

function GetSpellAttributes(spell)

	local SpellAttributes = {}
	
	-- Creates a copy of the original spell that can be accessed via SpellAttributes.spell if any user logic relies on it.
	SpellAttributes["spell"] = spell

	SpellAttributes["Name"] = GetSpellName(spell)
	SpellAttributes["Category"] = GetSpellCategory(spell)

	-- None of this applies to an item. But it's important for everything else.
	if SpellAttributes["Category"] ~= CATEGORY_ITEM then

		-- Label assigned to menu option in game. WhiteMagic, Ninjutsu, BardSong
		SpellAttributes["Class"] = GetSpellType(spell)
		-- Skill associated with spell.
		SpellAttributes["Skill"] = MapGetSkillShortName(GetSpellSkill(spell))
		-- Custom group determined by mapping.
		SpellAttributes["ParentGroup"] = MapGetParentGroup(SpellAttributes["Category"], SpellAttributes["Name"])
		-- Just a reminder this exists. See RefineSpellAttributes below.
		SpellAttributes["ChildGroup"] = ""
		
		SpellAttributes["TargetSymbol"] = GetSpellTargetRaw(spell)
		SpellAttributes["TargetPrimary"] = GetSpellTargetPrimary(spell)
		SpellAttributes["TargetFriendEnemy"] =GetSpellTargetFriendEnemy(spell)
		SpellAttributes["TargetHPDecimal"] = GetSpellTargetHPDecimal(spell)
		SpellAttributes["TargetSelf"] = GetSpellTargetSelf(spell)
		SpellAttributes["TargetParty"] = GetSpellTargetParty(spell)
		SpellAttributes["TargetAlly"] = GetSpellTargetAlly(spell)
		SpellAttributes["TargetPlayer"] = GetSpellTargetPlayer(spell)
		SpellAttributes["TargetEnemy"] = GetSpellTargetEnemy(spell)

		-- WS designation for melee/distant.
		if SpellAttributes["Category"] == CATEGORY_WS then
			SpellAttributes["WSRange"] = MapGetWSRange(SpellAttributes["Name"])
		else
			SpellAttributes["WSRange"] = ""
		end

		SpellAttributes["Element"] = GetSpellElementName(spell)
		SpellAttributes["DamageType"] = GetSpellDamageType(SpellAttributes["Category"], SpellAttributes["Name"], SpellAttributes["Element"])
		SpellAttributes["RecastID"] = GetSpellRecastID(spell)

		SpellAttributes = RefineSpellAttributes(SpellAttributes)
	end

	--ChatSpellAttributes(SpellAttributes)
	return SpellAttributes
end


-- Allows for a special handling to create more intuitive mappings for edge cases without requiring extensive re-authoring of the mappings/static/ files.
-- Eg: Splitting waltzes into waltz.cure and waltz.heal
-- Or splitting bp_ward and bp_rage into bloodpact.ward and bloodpact.rage respectively
-- Or unifying Blue Magic DamageType and ParentGroup into a single grouping

function RefineSpellAttributes(SpellAttributes)

	local RefinedSpellAttributes = SpellAttributes

	local OriginalSpellAttributes = SpellAttributes
	local OriginalName =        OriginalSpellAttributes["Name"]
	local OriginalParentGroup = OriginalSpellAttributes["ParentGroup"]
	local OriginalChildGroup =  OriginalSpellAttributes["ChildGroup"]
	local OriginalSkill =       OriginalSpellAttributes["Skill"]
	local OriginalDamageType =  OriginalSpellAttributes["DamageType"]

	if OriginalParentGroup == MAP_JA_BLOODPACT_RAGE then
		RefinedSpellAttributes["ParentGroup"] = MAP_JA_BLOODPACT
		RefinedSpellAttributes["ChildGroup"] = MAP_JA_BLOODPACT_RAGE


	elseif OriginalParentGroup == MAP_JA_BLOODPACT_WARD then
		RefinedSpellAttributes["ParentGroup"] = MAP_JA_BLOODPACT
		RefinedSpellAttributes["ChildGroup"] = MAP_JA_BLOODPACT_WARD


	elseif OriginalParentGroup == MAP_JA_WALTZ then
		if OriginalName == "Healing Waltz" then
			RefinedSpellAttributes["ParentGroup"] = MAP_JA_WALTZ
			RefinedSpellAttributes["ChildGroup"] = MAP_JA_WALTZ_HEAL
		else
			RefinedSpellAttributes["ParentGroup"] = MAP_JA_WALTZ
			RefinedSpellAttributes["ChildGroup"] = MAP_JA_WALTZ_CURE
		end


	-- Blue Magic requires special handling since it all falls under the same skill and encompasses cures, enfeebles, buffs, physical damage, magical damage, etc.
	-- This allows for sets.midcast.magic.blue.cure, sets.midcast.magic.blue.enfeebling and sets.midcast.magic.blue.physical to all be valid. And hopefully intuitive.
	elseif OriginalSkill == MAP_SKILL_BLUE and OriginalParentGroup == MAP_SPELL_DEFAULT then
		RefinedSpellAttributes["ParentGroup"] = OriginalDamageType
		RefinedSpellAttributes["ChildGroup"] = nil

	-- Splits enhancing and enfeebling spells into parent = black/white and child = group to better support Grimoires and provide more granularity
	-- This allows for sets.midcast.magic.enfeebling.black and sets.midcast.enfeebling.white.paralyze, etc.
	elseif OriginalSkill == MAP_SKILL_ENHANCING or OriginalSkill == MAP_SKILL_ENFEEBLING then
		RefinedSpellAttributes["ParentGroup"] = RefinedSpellAttributes["Class"]
		RefinedSpellAttributes["ChildGroup"] = OriginalParentGroup

	else
		RefinedSpellAttributes["ChildGroup"] = nil
	end

	return RefinedSpellAttributes
end