require "YAGDRSL/declare/const/YAG_const.lua"
require "YAGDRSL/declare/settings/YAG_settings.lua"
require "YAGDRSL/declare/tables/YAG_tables.lua"
require "YAGDRSL/declare/library_objects.lua"

function DeclareYAGLibrary()
	DeclareAllLibraryTables()
	DeclareLibraryObjects()
	DeclareDefaultSettings()
end