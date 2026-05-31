--
-- LIBRARY SETTINGS
--

	AssignModOptions("Offense", "Acc", "Multi") --, "STP", "Subtle")
	AssignModOptions("PhysicalDefense", "PDT", "PDTHP") --, "Eva")
	AssignModOptions("MagicalDefense", "MEvaLo", "MEvaHi", "MEvaHP")
	AssignModOptions("TH", "+TH")

	AppendModOrderIdleOffense("TH")
	AppendModOrderPrecastWSOffense("TH")

	AssignWeaponLockOptions(MOD_LOCK_ALL)

	CreateMod("AutoDW", "ShF9  DW", 1.1, "~f9", "On")
	ConfigureOverride("CtF12 Override", 5, "^f12", "BossTank", "Vagary")

	SetAutoCancelBuff({"Curing Waltz", "Curing Waltz II", "Curing Waltz III", "Curing Waltz IV", "Curing Waltz V", "Divine Waltz", "Divine Waltz II", "Healing Waltz"},
					{"Saber Dance"})

	SetAutoCancelBuff({"Aspir Samba", "Aspir Samba II", "Drain Samba", "Drain Samba II", "Drain Samba III", "Haste Samba"},
					{"Fan Dance"})
	
	TrackOffenseBuffs("Striking Flourish", "Climactic Flourish")
	TrackDefenseBuffs("Fan Dance")

	HasteDefinitions =
		{
			HasteSpell = 30,
			March = 10,
			Embrava = 25,
			Samba = 10,
			GeoHaste = 20
		}

--
-- LIBRARY FUNCTION OVERRIDES
--

	function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet)

		local TPThreshold = 2800
		if player.equipment.main == "Aeneas" then
			TPThreshold = TPThreshold - 500
		end

		if player.equipment.sub == "Centovente" then
			TPThreshold = TPThreshold - 1000
		end

		if SpellAttributes["Category"] == CATEGORY_WS and GetCharacterTP() > TPThreshold then
			PrecastSet = ReplaceMoonshade(PrecastSet, MoonshadeAlternates)
		end

		if SpellAttributes["Category"] == "ws" then
			PrecastSet = CustomizeGearForDayElement(SpellAttributes, PrecastSet, true)
			PrecastSet = CustomizeGearForWeatherElement(SpellAttributes, PrecastSet, true)
		end

		return PrecastSet
	end

	function HookPrecastTerminateSpell(SpellAttributes)
		local TerminateSpell = false
		local TerminateReason = "Spell will not be terminated"

		if SpellAttributes["ParentGroup"] == MAP_JA_WALTZ then
			TerminateSpell, TerminateReason = ScaleWaltz(SpellAttributes, 1.5)
		end

		return TerminateSpell, TerminateReason
	end

	function HookStatusCustomizeOffense(CharacterStatus, StatusSet)

		if GetModValue("AutoDW") == "On" and CharacterStatus == STATUS_ENGAGED then

			local CurrentHaste = GetCharacterHaste(HasteDefinitions)
			local DualWieldToCap = GetDualWieldToCap(35, CurrentHaste)
			StatusSet = CustomizeDualWield(StatusSet, DualWieldToCap)

		end

		return StatusSet
	end