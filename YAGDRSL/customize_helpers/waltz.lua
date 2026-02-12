--[[
@User
This function can be called in HookPrecastTerminateSpell to adjust which Waltz is cast based on [estimated] missing HP of target and the [estimated] amount cured by waltz.
If it determines that a waltz different from the original is more appropriate it will return CancelCurrentSpell = true, a string containing the reason and send a command to cast the new waltz instead.
The SpellAttributes parameter is required, the WaltzPotency attribute is optional and will default to 1 if not provided.
It is recommended that you simply implement this function in the HookPrecastTerminateSpell definition in your job logic file(s) and call it with a waltz potency value appopriate for the job's equipment.
See below for an implementation example as used by a main Dancer with +50% waltz potency.


	function HookPrecastTerminateSpell(SpellAttributes)
		local TerminateSpell = false
		local TerminateReason = "Spell will not be terminated"

		if SpellAttributes["ParentGroup"] == MAP_JA_WALTZ then
			TerminateSpell, TerminateReason = ScaleWaltz(SpellAttributes, 1.5)
		end

		return TerminateSpell, TerminateReason
	end

]]


function ScaleWaltz(SpellAttributes, WaltzPotency)
	local CancelCurrentSpell = false
	local IgnoreSpells = S{"Healing Waltz"}
	local OriginalSpell = SpellAttributes["Name"]
	local NewSpell = OriginalSpell
	local SpellTargetSymbol = SpellAttributes["TargetSymbol"]

	local PlayerDancerLevel = GetCharacterJobLevel("DNC")
	local PlayerTP = GetCharacterTP()

	local EstimateSelfCHR = 125
	local EstimatePlayerMaxHP = 2000
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
		return CancelCurrentSpell, "Insufficient TP for any Waltz"
	end

	if IgnoreSpells:contains(OriginalSpell) then
		CancelCurrentSpell = false
		return CancelCurrentSpell, "Healing Waltz is ignored by ScaleWaltz"
	end


	if OriginalSpell == "Divine Waltz" or OriginalSpell == "Divine Waltz II" then

		-- Check if sufficient TP for any Divine Waltz
		if PlayerTP < 400 then
			CancelCurrentSpell = true
			return CancelCurrentSpell, "Insufficient TP for Divine Waltz"

		-- If Divine Waltz II is being cast but TP is between 400 and 799 then alter spell to cast Divine Waltz instead
		elseif PlayerTP >= 400 and PlayerTP < 800 and OriginalSpell == "Divine Waltz II" then
			NewSpell = "Divine Waltz"
		end

	else
		-- Adjust Waltz calculation inputs depending on Main or Sub DNC
		if GetCharacterJobShort() == "DNC" then
			MMultiplier = 1.0
			JobGiftBonus = 40
			EstimateSelfCHR = 200
		elseif GetCharacterSubJobShort() == "DNC" then
			MMultiplier = .5
			JobGiftBonus = 0
		end

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

		-- Iterate through each possible Waltz and check if it can be cast and and does not overcure. The highest level waltz that meets this criteria (and the player can use) will be recorded as NewSpell.
		for Index, Waltz in ipairs(WaltzProperties) do
			local CureAmount = math.floor(WaltzPotency * math.floor(Waltz["m"]*MMultiplier*(EstimateSelfCHR + EstimateTargetVIT) + Waltz["b"] + JobGiftBonus))
			if PlayerDancerLevel >= Waltz["level"] and PlayerTP >= Waltz["cost"] and CureAmount <= TargetMissingHP then
				NewSpell = Waltz["name"]
				break
			end
		end
	end

	-- NewSpell is set to OriginalSpell at function start. If NewSpell is chenged to a value different from OriginalSpell then cancel OriginalSpell and resubmit a command to cast NewSpell.
	if OriginalSpell ~= NewSpell then
		CancelCurrentSpell = true
		SendGameJA(NewSpell, SpellTargetSymbol)
		return CancelCurrentSpell, "Waltz selection has been changed"
	end

	return CancelCurrentSpell, "No change made to Waltz"
end