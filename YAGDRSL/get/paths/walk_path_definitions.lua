require "YAGDRSL/get/paths/walk_path.lua"

function WalkPathRA(RootName, EventSource, SpellAttributes)
	local SetPaths = {}
	local SetPathStrings = {}

	-- Example: sets.precast.ra
	SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"])
	return SetPaths, SetPathStrings
end

function WalkPathWS(RootName, EventSource, SpellAttributes)
	local SetPaths = {}
	local SetPathStrings = {}

	-- Example: sets.precast.ws.melee.physical, sets.precast.ws.distant.magical
	SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"], SpellAttributes["WSRange"], SpellAttributes["DamageType"])
	
	-- Example: sets.precast.ws["Evisceration"] and sets.precast.ws.melee.physical["Evisceration"]
	AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["Name"])
	return SetPaths, SetPathStrings
end

function WalkPathJA(RootName, EventSource, SpellAttributes)
	local SetPaths = {}
	local SetPathStrings = {}


	if SpellAttributes["ParentGroup"] == MAP_JA_BLOODPACT then

			-- Bloodpact Rage - the damage type is meaningful for these so include it in the WalkPath.
			if SpellAttributes["ChildGroup"] == MAP_JA_BLOODPACT_RAGE then

					-- Example: sets.midcast.ja.bloodpact.rage.magical
					SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"], SpellAttributes["ParentGroup"], SpellAttributes["ChildGroup"], SpellAttributes["DamageType"])
					
					-- Example: sets.midcast.ja.bloodpact["Grand Fall"]
					AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["Name"])

			-- Bloodpact Wards are split into two groups - buffs and debuffs. Conveniently that lines up with SpellAttributes["TargetFriendEnemy"] of SPELL_TARGET_FRIEND or SPELL_TARGET_ENEMY.
			elseif SpellAttributes["ChildGroup"] == MAP_JA_BLOODPACT_WARD then

					-- Example: sets.midcast.ja.bloodpact.ward.friend (for buffs) or sets.midcast.ja.bloodpact.ward.enemy (for debuffs)
					SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"], SpellAttributes["ParentGroup"], SpellAttributes["ChildGroup"], SpellAttributes["TargetFriendEnemy"])

					-- Example: sets.midcast.ja.bloodpact.ward.friend["Earthen Armor"] or sets.midcast.bloodpact["Nightmare"]
					AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["Name"])
			end


	-- The damage type is meaningful for Pet Ready abilities so include it in the WalkPath.
	elseif SpellAttributes["ParentGroup"] == MAP_JA_PET_READY then

			-- Example: sets.midcast.ja.ready.magical
			SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"], SpellAttributes["ParentGroup"], SpellAttributes["DamageType"])
			
			-- Example: sets.midcast.ja.ready["Sensilla Blades"]
			AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["Name"])


	-- All other Job Abilities
	-- Except for special cases ChildGroup will be nil.
	else
			-- Example: sets.precast.ja.samba or sets.precast.ja.waltz.cure
			SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"], SpellAttributes["ParentGroup"], SpellAttributes["ChildGroup"])
			
			-- Example: sets.precast.ja["Haste Samba"] and sets.precast.ja.waltz.heal["Healing Waltz"]
			AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["Name"])
	end


	return SetPaths, SetPathStrings
end

function WalkPathMagic(RootName, EventSource, SpellAttributes)
	local SetPaths = {}
	local SetPathStrings = {}

	if SpellAttributes["Skill"] == MAP_SKILL_SINGING then

		-- Example: sets.precast.magic.singing.friendly.ballad or sets.precast.magic.enemy.lullaby
		SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"], SpellAttributes["Skill"], SpellAttributes["TargetFriendEnemy"], SpellAttributes["ParentGroup"])

		-- Example: sets.precast.magic.singing.friendly.ballad["Mage's Ballad II"] or sets.precast.magic["Foe Lullaby"]
		AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["Name"])

	else

		-- Example: sets.precast.magic.healing.cure or sets.precast.magic.enfeebling.white.potency
		-- ChildGroup is usually nil and has no effect. However for Enhancing and Enfeebling spells ParentGroup = black/white and ChildGroup = potency/duration/dispel/etc.
		SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"], SpellAttributes["Skill"], SpellAttributes["ParentGroup"], SpellAttributes["ChildGroup"])

		-- Example: sets.precast.magic.enhancing["Phalanx II"], sets.precast.magic["Burn"] and sets.precast.magic.elemental.debuff["Burn"]
		AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["Name"])

		-- TargetPrimary will either be self, friend or enemy. Can be useful for cures and enhancing magic to equip 'effect received' gear when beneficial (and not when it is not).
		-- Example: sets.precast.magic.enhancing["Phalanx II"].self, sets.precast.["Phalanx II"].friend, sets.precast.magic.healing.cure.enemy
		AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["TargetPrimary"])

	end

	return SetPaths, SetPathStrings
end

function WalkPathItem(RootName, EventSource, SpellAttributes)
	local SetPaths = {}
	local SetPathStrings = {}

	SetPaths, SetPathStrings = WalkPath(RootName, EventSource, SpellAttributes["Category"])

	-- Example: sets.midcast.item["Holy Water"]
	AppendValidNamedPaths(SetPaths, SetPathStrings, SpellAttributes["Name"])

	return SetPaths, SetPathStrings
end

function WalkPathStatus(RootName, CharacterStatus, ZoneClass)
	local SetPaths = {}
	local SetPathStrings = {}

	-- Example: sets.idle.town
	SetPaths, SetPathStrings = WalkPath(RootName, CharacterStatus, ZoneClass)

	return SetPaths, SetPathStrings
end