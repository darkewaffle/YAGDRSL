require "YAGDRSL/declare/tables/gearsets_mods/midcast.lua"
require "YAGDRSL/declare/tables/gearsets_mods/precast.lua"
require "YAGDRSL/declare/tables/gearsets_mods/status.lua"

function DeclareModTables()
	_G[MOD_SETS_ROOT_NAME] = {}
	DeclarePrecastMods()
	DeclareMidcastMods()
	DeclareStatusMods()
end