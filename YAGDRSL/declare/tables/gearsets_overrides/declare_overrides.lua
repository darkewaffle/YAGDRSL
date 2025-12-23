require "YAGDRSL/declare/tables/gearsets_overrides/midcast.lua"
require "YAGDRSL/declare/tables/gearsets_overrides/precast.lua"
require "YAGDRSL/declare/tables/gearsets_overrides/status.lua"

function DeclareOverrideTables()
	_G[OVERRIDE_SETS_ROOT_NAME] = {}
	DeclarePrecastOverrides()
	DeclareMidcastOverrides()
	DeclareStatusOverrides()
end