--
-- LIBRARY SETTINGS
--

	TickEnable = true
	TickInterval = 30
	TickEvaluateMovement = true

	CreateMod("Offense",         "F9    Offense",true, "f9",    "Acc",    "STP",    "Multi", "Subtle")
	CreateMod("PhysicalDefense", "F10   PDef",   true, "f10",   "PDT",    "PDTHP",  "Eva")
	CreateMod("MagicalDefense",  "F11   MDef",   true, "f11",   "MEvaLo", "MEvaHi", "MEvaHP")
	CreateMod("TH",              "CtF12 TH",     true, "^f12",  "TH4",    "TH2")
	CreateMod("AutoDW",          "ShF12 DW",     true, "~f12",  "On")

	ConfigureDefensePriority("End   DefPriority", true, "end")
	ConfigureOverride("ShEnd Override", true, "~end", "BossTank", "Vagary")


	SetAutoCancelBuff({"Curing Waltz", "Curing Waltz II", "Curing Waltz III", "Curing Waltz IV", "Curing Waltz V", "Divine Waltz", "Divine Waltz II", "Healing Waltz"},
					{"Saber Dance"})

	SetAutoCancelBuff({"Aspir Samba", "Aspir Samba II", "Drain Samba", "Drain Samba II", "Drain Samba III", "Haste Samba"},
					{"Fan Dance"})

	SetAutoCancelBuff({"Spectral Jig"},	
					{"Sneak"})

	
	SetModOrderPrecastWSOffense("Offense")
	SetModOrderPrecastWSDefense("PhysicalDefense", "MagicalDefense")

	SetModOrderEngagedOffense ("Offense", "TH")
	SetModOrderEngagedDefense ("PhysicalDefense", "MagicalDefense")

	SetModOrderIdleDefense    ("PhysicalDefense", "MagicalDefense")
	SetModOrderRestingDefense ("PhysicalDefense", "MagicalDefense")

	TrackOffenseBuffs("Striking Flourish", "Climactic Flourish")
	TrackDefenseBuffs("Fan Dance")

--
-- LIBRARY FUNCTION OVERRIDES
--

	function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet)
		PrecastSet = ReplaceMoonshade(SpellAttributes, PrecastSet)
		return PrecastSet
	end

	function HookPrecastTerminate(SpellAttributes)
		local TerminateSpell = false
		local TerminateReason = "Spell will not be terminated"

		if SpellAttributes["ParentGroup"] == MAP_JA_WALTZ then
			TerminateSpell, TerminateReason = InterceptWaltz(SpellAttributes, 1.5)
		end

		return TerminateSpell, TerminateReason
	end

	function HookStatusCustomizeOffense(CharacterStatus, StatusSet)

		if GetModValue("AutoDW", false) == "On" and CharacterStatus == STATUS_ENGAGED then
			StatusSet = AutoDualWield(StatusSet)
		end

		return StatusSet
	end

--
-- CUSTOM PLAYER FUNCTIONS
--

	function AutoDualWield(GearSet)
		local DualWieldToCap = GetDualWieldToCap(35, EstimateCharacterTotalHaste())
		local DualWieldThresholds = {25, 14, 9, 4}
		local Threshold = 0

		for _, DualWieldAmount in ipairs(DualWieldThresholds) do
			if DualWieldToCap >= DualWieldAmount then
				Threshold = DualWieldThresholds[i]
				break
			end
		end

		GearSet = set_combine(GearSet, templates.dualwield[Threshold])
		return GearSet
	end

	function ReplaceMoonshade(SpellAttributes, PrecastSet)
		local MoonshadeAlternates = {"Ishvara Earring", "Sherida Earring"}
		local ReplacementEarring = ""
		local ReplacementSlot = ""
		local PrecastEar1 = PrecastSet["left_ear"]
		local PrecastEar2 = PrecastSet["right_ear"]

		if SpellAttributes["Category"] == CATEGORY_WS and GetCharacterTP() > 2800 then

			if PrecastEar1 == "Moonshade Earring" then
				ReplacementSlot = "left_ear"
			elseif PrecastEar2 == "Moonshade Earring" then
				ReplacementSlot = "right_ear"
			else
				ReplacementSlot = nil
			end

			if ReplacementSlot then
				for _, AlternateName in ipairs(MoonshadeAlternates) do
					if PrecastEar1 ~= AlternateName and PrecastEar2 ~= AlternateName then
						ReplacementEarring = AlternateName
						break
					end
				end

				PrecastSet[ReplacementSlot] = ReplacementEarring
			end
		end

		return PrecastSet
	end

	function InterceptWaltz(SpellAttributes, WaltzPotency)
		local CancelCurrentSpell = false
		local IgnoreSpells = S{"Divine Waltz", "Divine Waltz II", "Healing Waltz"}
		local OriginalSpell = SpellAttributes["Name"]
		local NewSpell = "Curing Waltz"
		local SpellTargetSymbol = SpellAttributes["TargetSymbol"]

		local PlayerDancerLevel = GetCharacterJobLevel("DNC")
		local PlayerTP = GetCharacterTP()

		local EstimatePlayerCHR = 150
		local EstimatePlayerMaxHP = 2200
		local EstimateTargetVIT = 150
		local JobGiftBonus = 0
		local MMultiplier = 0
		local TargetMissingHP = 0
		local WaltzPotency = WaltzPotency or 1

		local WaltzProperties =
			{
				{name = "Curing Waltz V",   level = 80, cost = 800, m = 1.25, b = 600},
				{name = "Curing Waltz IV",  level = 70, cost = 650, m = 1.0,  b = 450},
				{name = "Curing Waltz III", level = 45, cost = 500, m = .75,  b = 270},
				{name = "Curing Waltz II",  level = 30, cost = 350, m = .50,  b = 130},
				{name = "Curing Waltz",     level = 15, cost = 200, m = .25,  b = 60}
			}

		if buffactive["Trance"] then
			PlayerTP = 3000
		end

		if PlayerTP < 200 then
			CancelCurrentSpell = true
			return CancelCurrentSpell, "Insufficient TP for Waltz"
		end

		if IgnoreSpells:contains(OriginalSpell) then
			CancelCurrentSpell = false
			return CancelCurrentSpell, "Healing Waltz and Divine Waltz are ignored by InterceptWaltz"
		end

		if GetCharacterJobShort() == "DNC" then
			MMultiplier = 1.0
			JobGiftBonus = 40
		elseif GetCharacterSubJobShort() == "DNC" then
			MMultiplier = .5
			JobGiftBonus = 0
		end

		if SpellAttributes["TargetSelf"] then
			TargetMissingHP = GetCharacterMissingHP()
			if TargetMissingHP < 100 then
				CancelCurrentSpell = true
				return CancelCurrentSpell, "Target is not missing enough HP to Waltz"
			end
		elseif SpellAttributes["TargetParty"] or SpellAttributes["TargetAlly"] or SpellAttributes["TargetPlayer"] then
			TargetMissingHP = math.floor(EstimatePlayerMaxHP - (EstimatePlayerMaxHP*SpellAttributes["TargetHPDecimal"]))
		end

		for Index, Waltz in ipairs(WaltzProperties) do
			local CureAmount = math.floor(WaltzPotency * math.floor(Waltz["m"]*MMultiplier*(EstimatePlayerCHR + EstimateTargetVIT) + Waltz["b"] + JobGiftBonus))
			if PlayerDancerLevel >= Waltz["level"] and PlayerTP >= Waltz["cost"] and CureAmount <= TargetMissingHP then
				NewSpell = Waltz["name"]
				break
			end
		end

		if OriginalSpell ~= NewSpell then
			CancelCurrentSpell = true
			SendGameJA(NewSpell, SpellTargetSymbol)
			return CancelCurrentSpell, "Waltz selection has been changed"
		end

		return CancelCurrentSpell, "No change made to Waltz"
	end