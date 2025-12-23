require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/do/create_tracker.lua"
require "YAGDRSL/get/get_buff.lua"

-- @User
-- Defines which buffs will be tracked for the purposes of applying mod sets.
-- BuffClass (offense/defense) determines whether the mod corresponding to the buff is applied during offense or defense mod creation.
-- Using it should look like the below example
--
-- TrackOffenseBuffs("Climactic Flourish", "Striking Flourish")
--
-- When this is done sets (rather, tables) in the mods table with those names will be picked up when the gearset is assembled.
-- For instance if "Climactic Flourish" is tracked then the mod might look like below. It would then be applied to any physical, melee weaponskill when Climactic Flourish is active.
--
--	mods.precast.ws.melee.physical["Climactic Flourish"] =
--		{
--			ammo="Charis Feather",
--			head="Maculele Tiara +3",
--			neck="Etoile Gorget +1"
--		}

function SetBuffTracking(ModClass, BuffList)
	local TrackedBuffs = _G[TRACK_BUFFS]

	for _, BuffName in ipairs(BuffList) do
		if GetBuffNameIsValid(BuffName) then
			table.insert(TrackedBuffs, BuffName)
			CreateTrackerQueued(BuffName, ModClass)
			ChatDebug("Buff tracked =", BuffName)
		else
			ChatError("Buff not tracked =", BuffName)
		end
	end
end

function TrackOffenseBuffs(...)
	local Buffs = {...}
	SetBuffTracking(MOD_CLASS_OFFENSE, Buffs)
end

function TrackDefenseBuffs(...)
	local Buffs = {...}
	SetBuffTracking(MOD_CLASS_DEFENSE, Buffs)
end

function GetIsBuffTracked(BuffName)
	TrackedBuffs = _G[TRACK_BUFFS]
	local BuffIsTracked = false

	for _, TrackedBuff in ipairs(TrackedBuffs) do
		if BuffName == TrackedBuff then
			BuffIsTracked = true
			break
		end
	end

	return BuffIsTracked
end