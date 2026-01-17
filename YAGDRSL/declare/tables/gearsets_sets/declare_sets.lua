require "YAGDRSL/declare/tables/gearsets_sets/midcast.lua"
require "YAGDRSL/declare/tables/gearsets_sets/precast.lua"
require "YAGDRSL/declare/tables/gearsets_sets/status.lua"

function DeclareSetTables()
	-- Turns out this was a bad idea. Redeclaring sets causes Gearswap's reference to it to be invalid which breaks 'gs equip' commands.
	--_G[SETS_ROOT_NAME] = {}

	-- Recreates GearSwap's expectation of sets.naked found in GearSwap\refresh.lua
	-- 'empty' definition in GearSwap\statics.lua
	-- empty = {name="empty"}

	--[[
	_G[SETS_ROOT_NAME]["naked"] =
		{
			main=  empty,
			sub=   empty,
			range= empty,
			ammo=  empty,
			head=  empty,
			neck=  empty,
			ear1=  empty,
			ear2=  empty,
			body=  empty,
			hands= empty,
			ring1= empty,
			ring2= empty,
			back=  empty,
			waist= empty,
			legs=  empty,
			feet=  empty
		}
	]]

	DeclarePrecastSets()
	DeclareMidcastSets()
	DeclareStatusSets()
end