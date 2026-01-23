--[[

-- @User
-- This function can be used to calculate an estimate of the character's total haste. It accepts a HasteDefinitions table which can be used to define the expected value of haste related buffs.

HasteDefinitions =
	{
		-- Default 30
		HasteSpell = nil,

		-- Default 15
		LastResort = nil,

		-- Default 13
		March = nil,

		-- Default 21
		Embrava = nil,

		-- Default 10
		Hasso = nil,

		-- Default 5
		Samba = nil,

		-- Default 33
		GeoHaste = nil
	}

eg: local HasteDefinitions = {HasteSpell = 15, Samba = 10}
eg: local CurrentCharacterHaste = GetCharacterHaste(HasteDefinitions)

]]


function GetCharacterHaste(HasteDefinitions)

	HasteDefinitions = HasteDefinitions or {}
	local Haste_Gear = 25
	local Haste_Magic = 0
	local Haste_JA = 0
	local Haste_Total = 0

	HasteSpell =		HasteDefinitions.HasteSpell 			or 30			-- Defaults to Haste II
	LastResort =		HasteDefinitions.LastResort 			or 15			-- 15 base, only 25 if main DRK and merited
	March		 =		HasteDefinitions.March	 				or 13			-- 13 is the average of an unenhanced Advancing/Victory March
	Embrava =			HasteDefinitions.Embrava 				or 21			-- Assumes Light Arts + Max Skill but no meaningful +skill gear
	Hasso =				HasteDefinitions.Hasso 					or 10			-- Base 10, only enhanced by gear
	Samba =				HasteDefinitions.Samba 					or 5			-- Base 5, only 10 if main DNC and merited
	GeoHaste = 			HasteDefinitions.GeoHaste	 			or 33 			-- Rough estimate of not quite max skill + Dunna

	local HasteBuffs =
		{
			[33] =  {["amount"] = HasteSpell,		["category"] = CATEGORY_MAGIC},		-- Haste
			[64] =  {["amount"] = LastResort,		["category"] = CATEGORY_JA},		-- Last Resort
			[214] = {["amount"] = March,			["category"] = CATEGORY_MAGIC},		-- March
			[228] = {["amount"] = Embrava,			["category"] = CATEGORY_MAGIC},		-- Embrava
			[353] = {["amount"] = Hasso,			["category"] = CATEGORY_JA},		-- Hasso
			[370] = {["amount"] = Samba,			["category"] = CATEGORY_JA},		-- Haste Samba
			[580] = {["amount"] = GeoHaste, 		["category"] = CATEGORY_MAGIC},		-- Indi/Geo Haste
			[604] = {["amount"] = 15,				["category"] = CATEGORY_MAGIC},		-- Mighty Guard
		}

	local PlayerBuffs = windower.ffxi.get_player()["buffs"]

	for _, BuffID in pairs(PlayerBuffs) do
		if HasteBuffs[BuffID] then
			if HasteBuffs[BuffID]["category"] == CATEGORY_MAGIC then
				Haste_Magic = Haste_Magic + HasteBuffs[BuffID]["amount"]

			elseif HasteBuffs[BuffID]["category"] == CATEGORY_JA then
				Haste_JA = Haste_JA + HasteBuffs[BuffID]["amount"]

			end
		end
	end

	Haste_Magic = Clamp(Haste_Magic, 0, 43)
	Haste_JA = Clamp(Haste_JA, 0, 25)

	Haste_Total = Haste_Gear + Haste_Magic + Haste_JA
	Haste_Total = Clamp(Haste_Total, 0, 80)

	ChatDebug("Estimated total haste", Haste_Total .. "%")
	return Haste_Total

end