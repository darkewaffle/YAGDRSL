-- Loops through elements of a table and sets all of them to nil.
-- Used in validate command to wipe tables when setting them to {} seemed too slow or required garbage collection before the tables were empty again.

function NullifyTable(TableObject)
	for Key, _ in pairs(TableObject) do
		TableObject[Key] = nil
	end
end

function NullifySets()
	NullifyTable(_G[SETS_ROOT_NAME])
end

function NullifyModSets()
	NullifyTable(_G[MOD_SETS_ROOT_NAME])
end

function NullifyOverrideSets()
	NullifyTable(_G[OVERRIDE_SETS_ROOT_NAME])
end

function NullifyLibraryGearSetTables()
	NullifyModSets()
	NullifyOverrideSets()
	NullifySets()
end