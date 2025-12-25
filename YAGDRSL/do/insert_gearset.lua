-- @User
-- Allows inserts of a gearset into a parent table without destroying children tables.

-- eg: InsertGearSet(sets.precast.ws, {head="Onion Helm"}) will not affect sets.precast.ws.melee.
-- Whereas sets.precast.ws = {head="Onion Helm"} will destroy sets.precast.ws.melee and other child tables.

function InsertGearSet(InsertIntoTable, InsertFromTable)
	for Key, Value in pairs(InsertFromTable) do

		-- String value should just be a normal item entry.
		if type(Value) == "string" then
			InsertIntoTable[Key] = Value

		-- Table value could be a child set. Value["name"] should prove it is an item though.
		elseif type(Value) == "table" and Value["name"] then
			InsertIntoTable[Key] = Value
		end
	end
end