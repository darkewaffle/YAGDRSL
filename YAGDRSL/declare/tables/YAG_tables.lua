require "YAGDRSL/declare/tables/collections/declare_collections.lua"
require "YAGDRSL/declare/tables/gearsets_mods/declare_mods.lua"
require "YAGDRSL/declare/tables/gearsets_overrides/declare_overrides.lua"
require "YAGDRSL/declare/tables/gearsets_sets/declare_sets.lua"
require "YAGDRSL/declare/tables/mod_orders/declare_mod_orders.lua"
require "YAGDRSL/declare/tables/mod_values/declare_mod_values.lua"
require "YAGDRSL/declare/tables/validation/declare_validation.lua"

function DeclareLibraryGearSetTables()
	DeclareModTables()
	DeclareOverrideTables()
	DeclareSetTables()
end

function DeclareAllLibraryTables()
	DeclareLibraryGearSetTables()

	DeclareCollectionsTable()
	DeclareModOrderTables()
	DeclareModValueTables()
	DeclareValidationTables()
end