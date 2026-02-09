--[[
@User
This function can be used to conditionally include equipment when the target should have an open magic burst window and the element of the spell matches one of the elements that can be burst.
MagicBurstLikely will be evaluated at the start of Midcast but cannot account for the window closing during the cast nor other weapon skills closing the window during the cast.
MagicBurstEquipment should be a gearset table that you can pass directly to the function as seen below.

	MyMagicBurstItems =
	{
		head="Wizard Hat",
		body="Wizard Robe"
	}

	GearSet = CustomizeGearForMagicBurst(SpellAttributes, GearSet, MyMagicBurstItems)

]]

function CustomizeGearForMagicBurst(SpellAttributes, GearSet, MagicBurstEquipment)

	if SpellAttributes["Category"] == CATEGORY_MAGIC and SpellAttributes["MagicBurstLikely"] then
		GearSet = set_combine(GearSet, MagicBurstEquipment)
	end

	return GearSet
end