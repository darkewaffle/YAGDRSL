--[[
@User
This function can be called in HookPrecastTerminate to adjust which Cure is cast based on [estimated] missing HP of target and the [estimated] amount cured by each Cure 1-6.
If it determines that a cure different from the original is more appropriate it will return CancelCurrentSpell = true, a string containing the reason and send a command to cast the new cure instead.
The SpellAttributes parameter is required, the CurePotency, CureReceived and DayWeatherMultipliers are optional and default to 1.
It is recommended that you simply implement this function in the HookPrecastTerminate definition in your job logic file(s) and call it with cure potency values appropriate for your equipment.
See below for an implementation example as used by a job with +50% cure potency and no additional cure received or weather/day multiplier.

	function HookPrecastTerminate(SpellAttributes)
		local TerminateSpell = false
		local TerminateReason = "Spell will not be terminated"

		if SpellAttributes["ParentGroup"] == MAP_SPELL_CURE then
			TerminateSpell, TerminateReason = ScaleCure(SpellAttributes, 1.5, 1, 1)
		end

		return TerminateSpell, TerminateReason
	end

]]

function ScaleCure(SpellAttributes, CurePotency, CureReceived, DayWeatherMultiplier)
	local CancelCurrentSpell = false
	local IgnoreSpells = S{"Full Cure"}
	local OriginalSpell = SpellAttributes["Name"]
	local NewSpell = OriginalSpell
	local SpellTargetSymbol = SpellAttributes["TargetSymbol"]

	local CurePotency = CurePotency or 1
	local CureReceived = CureReceived or 1
	local DayWeatherMultiplier = DayWeatherMultiplier or 1

	local PlayerMP = GetCharacterMP()
	local TargetMissingHP = 0
	local KnownSpells = windower.ffxi.get_spells()
	local MaxCureAvailable = GetMaxCureAvailable()

	-- Buncha messy stuff needed to calculate the amount of HP that will be cured by each spell
	local MainJobLevel = GetCharacterJobLevel(GetCharacterJobShort())
	local EstimatedCasterMND = math.floor(MainJobLevel * 1.5)
	local EstimatedCasterVIT = math.floor(MainJobLevel * 1.5)
	local HealingSkill = windower.ffxi.get_player()["skills"]["healing_magic"]
	local CurePower = math.floor(EstimatedCasterMND/2) + math.floor(EstimatedCasterVIT/4) + HealingSkill
	local CureBases = GetCureBases(CurePower)

	local CureProperties =
		{
			{name = "Cure",     cost =   8, id = 1, amount = 0},
			{name = "Cure II",  cost =  24, id = 2, amount = 0},
			{name = "Cure III", cost =  46, id = 3, amount = 0},
			{name = "Cure IV",  cost =  88, id = 4, amount = 0},
			{name = "Cure V",   cost = 135, id = 5, amount = 0},
			{name = "Cure VI",  cost = 227, id = 6, amount = 0}
		}

	if SpellAttributes["TargetFriendEnemy"] == SPELL_TARGET_ENEMY then
		CancelCurrentSpell = false
		return CancelCurrentSpell, "ScaleCure does not apply when targeting an enemy"
	end

	if PlayerMP < 8 then
		CancelCurrentSpell = true
		return CancelCurrentSpell, "Insufficient MP for any Cure"
	end

	if IgnoreSpells:contains(OriginalSpell) then
		CancelCurrentSpell = false
		return CancelCurrentSpell, "Full Cure is ignored by ScaleCure"
	end

	-- Iterate through CureProperties and remove entries for Cures that are not available to the player's current jobs
	for i = 6, MaxCureAvailable + 1, -1 do
		table.remove(CureProperties, i)
		table.remove(CureBases, i)
	end

	-- Calculate the estimated amount cured by each Cure from 1 to MaxCureAvailable and assign it to amount in CureProperties
	for i = 1, MaxCureAvailable do
		local CureAmount = math.floor(CureBases[i] * CurePotency * CureReceived * DayWeatherMultiplier)

		if buffactive["Divine Seal"] then
			CureAmount = CureAmount * 2
		end

		if buffactive["Rapture"] then
			CureAmount = CureAmount * 1.5
		end

		CureProperties[i]["amount"] = CureAmount
	end

	-- Calculate / estimate the amount of HP the target of the spell is missing
	if SpellAttributes["TargetSelf"] then
		TargetMissingHP = GetCharacterMissingHP()
		if TargetMissingHP < 100 then
			CancelCurrentSpell = true
			return CancelCurrentSpell, "Target is not missing enough HP for"
		end

	elseif SpellAttributes["TargetParty"] or SpellAttributes["TargetAlly"] then
		TargetMissingHP = GetPartyMemberMissingHP(SpellAttributes["TargetID"])

	else
		TargetMissingHP = math.floor(EstimatePlayerMaxHP - (EstimatePlayerMaxHP*SpellAttributes["TargetHPDecimal"]))
	end

	-- Iterate through each possible Cure and check if it can be cast and and does not overcure. The highest level cure that meets this criteria (and the player can use) will be recorded as NewSpell.
	for i = #CureProperties, 1, -1 do
		if KnownSpells[CureProperties[i]["id"]] and PlayerMP >= CureProperties[i]["cost"] and CureProperties[i]["amount"] <= TargetMissingHP then
			NewSpell = CureProperties[i]["name"]
			break
		end
	end

	-- NewSpell is set to OriginalSpell at function start. If NewSpell is chenged to a value different from OriginalSpell then cancel OriginalSpell and resubmit a command to cast NewSpell.
	if OriginalSpell ~= NewSpell then
		CancelCurrentSpell = true
		SendGameMagic(NewSpell, SpellTargetSymbol)
		return CancelCurrentSpell, "Cure selection has been changed"
	end

	return CancelCurrentSpell, "No change made to Waltz"
end

-- Returns a number 1-6 corresponding to the highest level cure that the player's current jobs can cast
-- This does not indicate if the player has learned the spell or not
function GetMaxCureAvailable()
	local CureJobs =
		{
			["WHM"] = true,
			["RDM"] = true,
			["PLD"] = true,
			["SCH"] = true
		}

	local CureRequiredLevel =
		{
			[1] = {["WHM"] = 1,  ["RDM"] = 3,  ["PLD"] = 5,  ["SCH"] = 5},
			[2] = {["WHM"] = 11, ["RDM"] = 14, ["PLD"] = 17, ["SCH"] = 17},
			[3] = {["WHM"] = 21, ["RDM"] = 26, ["PLD"] = 30, ["SCH"] = 30},
			[4] = {["WHM"] = 41, ["RDM"] = 48, ["PLD"] = 55, ["SCH"] = 55},
			[5] = {["WHM"] = 61},
			[6] = {["WHM"] = 81}
		}

	local MainJob = GetCharacterJobShort()
	local SubJob = GetCharacterSubJobShort()
	local MainJobLevel = 0
	local SubJobLevel = 0
	local MaxCureAvailable = 0

	if CureJobs[MainJob] then
		MainJobLevel = GetCharacterJobLevel(MainJob)

		for CureLevel, RequiredLevels in ipairs(CureRequiredLevel) do
			if RequiredLevels[MainJob] and RequiredLevels[MainJob] <= MainJobLevel then
				MaxCureAvailable = math.max(MaxCureAvailable, CureLevel)
			end
		end
	end

	if CureJobs[SubJob] then
		SubJobLevel = GetCharacterJobLevel(SubJob)

		for CureLevel, RequiredLevels in ipairs(CureRequiredLevel) do
			if RequiredLevels[SubJob] and RequiredLevels[SubJob] <= SubJobLevel then
				MaxCureAvailable = math.max(MaxCureAvailable, CureLevel)
			end
		end
	end

	return MaxCureAvailable
end

-- Calculate the 'Base' term of the Cure calculation for each cure based off the player's 'Cure Power'
-- Returns a table with keys 1-6 and values equal to the calculated base for each cure spell
function GetCureBases(CurePower)

	local CureBaseScaling =
		{
			[1] =
				{
					[1] = {powerfloor =   0, rate = 4.00, hpfloor = 10},
					[2] = {powerfloor =  20, rate = 1.33, hpfloor = 15},
					[3] = {powerfloor =  40, rate = 8.50, hpfloor = 30},
					[4] = {powerfloor = 125, rate = 15.0, hpfloor = 40},
					[5] = {powerfloor = 200, rate = 20.0, hpfloor = 45},
					[6] = {powerfloor = 600, rate = 1.00, hpfloor = 65}
				},

			[2] =
				{
					[1] = {powerfloor =   0, rate = 1.00, hpfloor =  30},
					[2] = {powerfloor =  40, rate = 1.00, hpfloor =  60},
					[3] = {powerfloor =  70, rate = 5.50, hpfloor =  90},
					[4] = {powerfloor = 125, rate = 7.50, hpfloor = 100},
					[5] = {powerfloor = 200, rate = 10.0, hpfloor = 110},
					[6] = {powerfloor = 400, rate = 20.0, hpfloor = 130},
					[7] = {powerfloor = 700, rate = 1.00, hpfloor = 145}
				},

			[3] =
				{
					[1] = {powerfloor =   0, rate = 1.00, hpfloor = 100},
					[2] = {powerfloor =  70, rate = 2.20, hpfloor = 130},
					[3] = {powerfloor = 125, rate = 1.15, hpfloor = 155},
					[4] = {powerfloor = 200, rate = 2.50, hpfloor = 220},
					[5] = {powerfloor = 300, rate = 5.00, hpfloor = 260},
					[6] = {powerfloor = 700, rate = 1.00, hpfloor = 340}
				},

			[4] =
				{
					[1] = {powerfloor =   0, rate = 1.00, hpfloor = 150},
					[2] = {powerfloor =  70, rate = 1.00, hpfloor = 270},
					[3] = {powerfloor = 200, rate = 2.00, hpfloor = 400},
					[4] = {powerfloor = 300, rate = 1.43, hpfloor = 450},
					[5] = {powerfloor = 400, rate = 2.50, hpfloor = 520},
					[6] = {powerfloor = 700, rate = 1.00, hpfloor = 640}
				},

			[5] =
				{
					[1] = {powerfloor =   0, rate = 1.00, hpfloor = 350},
					[2] = {powerfloor =  80, rate = 0.70, hpfloor = 450},
					[3] = {powerfloor = 150, rate = 1.25, hpfloor = 550},
					[4] = {powerfloor = 190, rate = 1.84, hpfloor = 582},
					[5] = {powerfloor = 260, rate = 2.00, hpfloor = 620},
					[6] = {powerfloor = 300, rate = 2.50, hpfloor = 640},
					[7] = {powerfloor = 500, rate = 3.33, hpfloor = 720},
					[8] = {powerfloor = 700, rate = 1.00, hpfloor = 780}
				},

			[6] =
				{
					[1] = {powerfloor =   0, rate = 1.00, hpfloor =  400},
					[2] = {powerfloor =  90, rate = 1.50, hpfloor =  600},
					[3] = {powerfloor = 210, rate = 0.90, hpfloor =  680},
					[4] = {powerfloor = 300, rate = 1.43, hpfloor =  780},
					[5] = {powerfloor = 400, rate = 2.50, hpfloor =  850},
					[6] = {powerfloor = 500, rate = 1.67, hpfloor =  890},
					[7] = {powerfloor = 700, rate = 1.00, hpfloor = 1010}
				}
		}

	local CureBases = {}

	for CureLevel, CureDetails in ipairs(CureBaseScaling) do

		if CurePower >= CureDetails[#CureDetails]["powerfloor"] then
			table.insert(CureBases, CureDetails[#CureDetails]["hpfloor"])
		else

			for i=1, #CureDetails do
				if CurePower < CureDetails[i]["powerfloor"] then
					local CalculatedBase = math.floor((CurePower - CureDetails[i-1]["powerfloor"]) / CureDetails[i-1]["rate"]) + CureDetails[i-1]["hpfloor"]
					table.insert(CureBases, CalculatedBase)
					break
				end
			end

		end
	end

	return CureBases
end