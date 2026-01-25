--[[
@User
This function can be called in HookPrecastCustomizeOffense to conditionally replace the Moonshade Earring (assuming it has +250 TP Bonus). See below for an example of how to implement this.
PrecastSet and AlternateEarrings are both required parameters. AlternateEarrings is a table that should contain the names of two earrings that can be used to replace Moonshade.
If the first alternate earring is already equipped then the second earring will replace Moonshade instead.

	MoonshadeAlternates = {"Ishvara Earring", "Sherida Earring"}

	function HookPrecastCustomizeOffense(SpellAttributes, PrecastSet)

		if SpellAttributes["Category"] == CATEGORY_WS and GetCharacterTP() > 2850 then
			PrecastSet = ReplaceMoonshade(SpellAttributes, MoonshadeAlternates)
		end

		return PrecastSet
	end

This may be expanded in the future to support more dynamic selection of TP bonus gear via calculating missing TP, the type of weaponskill (scaling vs no scaling) and conditionally equipping 'tiers' of TP bonus gear to match needs.
For now there just isn't enough of it to bother - we just handle Moonshade.
]]

function ReplaceMoonshade(PrecastSet, AlternateEarrings)
	local AlternateEarrings = AlternateEarrings or {}
	local ReplacementEarring = ""
	local ReplacementSlot = ""
	local PrecastEar1 = PrecastSet["left_ear"]
	local PrecastEar2 = PrecastSet["right_ear"]

	if PrecastEar1 == "Moonshade Earring" then
		ReplacementSlot = "left_ear"
	elseif PrecastEar2 == "Moonshade Earring" then
		ReplacementSlot = "right_ear"
	else
		-- PrecastSet does not contain Moonshade, return the original PrecastSet.
		return PrecastSet
	end

	for _, AlternateName in ipairs(MoonshadeAlternates) do
		if PrecastEar1 ~= AlternateName and PrecastEar2 ~= AlternateName then
			ReplacementEarring = AlternateName
			break
		end
	end

	PrecastSet[ReplacementSlot] = ReplacementEarring
	return PrecastSet
end