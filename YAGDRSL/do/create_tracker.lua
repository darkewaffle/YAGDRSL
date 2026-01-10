require "YAGDRSL/do/insert_mod_order.lua"

-- A tracker is intended to be read like a normal mod however it is not intended to be manipulated like one by the user or commands.
-- A tracker will hold a single value that should be updated conditionally during events.
-- The intent is for trackers to be added to ModOrder lists to behave like a mod that automatically updates its value.
-- This ought to be useful for applying mods for tracked buffs or for the existence of specific pets.


function FormatTrackerName(TrackerNameBase)
	if TrackerNameBase then
		return "Tracking_" .. TrackerNameBase
	end
end

function CreateTracker(TrackerName, ModClass, DefaultValue)
	local TrackerName = FormatTrackerName(TrackerName)
	_G[MOD_VALUES_ROOT_NAME][TrackerName] = {}
	_G[MOD_VALUES_ROOT_NAME][TrackerName]["value"] = DefaultValue
	_G[MOD_VALUES_ROOT_NAME][TrackerName]["default"] = DefaultValue

	if ModClass then
		AppendModOrderClass(ModClass, TrackerName)
	end
end

function CreateTrackerOffense(TrackerName, DefaultValue)
	local DefaultValue = DefaultValue or MOD_DEFAULT_OFF
	CreateTracker(TrackerName, MOD_CLASS_DEFENSE)
end

function CreateTrackerDefense(TrackerName, DefaultValue)
	local DefaultValue = DefaultValue or MOD_DEFAULT_OFF
	CreateTracker(TrackerName, MOD_CLASS_OFFENSE)
end

function SetTracker(TrackerName, NewValue)
	local TrackerName = FormatTrackerName(TrackerName)
	_G[MOD_VALUES_ROOT_NAME][TrackerName]["value"] = NewValue

	if STATE_DISPLAY_ORDER_DEBUG then
		UpdateDisplayModOrders()
	end
end

function UnsetTracker(TrackerName)
	local TrackerName = FormatTrackerName(TrackerName)
	_G[MOD_VALUES_ROOT_NAME][TrackerName]["value"] = _G[MOD_VALUES_ROOT_NAME][TrackerName]["default"]


	if STATE_DISPLAY_ORDER_DEBUG then
		UpdateDisplayModOrders()
	end
end


-- CreateTrackerQueued is used to handle the calls from SetBuffTracking in user files.
-- By queueing Mod Order insertion instead of creating them as they are called (which could be before or after Mod Order definitions) we can ensure the trackers are placed
-- at the end of the Mod Order list (giving them high priority).
function CreateTrackerQueued(TrackerName, ModClass, DefaultValue, Priority)
	local TrackerName = FormatTrackerName(TrackerName)
	local DefaultValue = DefaultValue or MOD_DEFAULT_OFF
	local Priority = Priority or MOD_ORDER_PRIORITY_HIGH

	_G[MOD_VALUES_ROOT_NAME][TrackerName] = {}
	_G[MOD_VALUES_ROOT_NAME][TrackerName]["value"] = DefaultValue
	_G[MOD_VALUES_ROOT_NAME][TrackerName]["default"] = DefaultValue

	if ModClass then
		QueueTrackerForModOrders(TrackerName, ModClass, Priority)
	end
end

function QueueTrackerForModOrders(TrackerName, ModClass, Priority)
	table.insert(_G[TRACKER_INTO_ORDERS_QUEUE], {["TrackerName"]=TrackerName, ["DestinationClass"]=ModClass, ["ModPriority"]=Priority})
end

function ProcessQueuedTrackers()
	for Index, Tracker in ipairs(_G[TRACKER_INTO_ORDERS_QUEUE]) do
		AppendModOrderClass(Tracker["DestinationClass"], Tracker["TrackerName"], Tracker["ModPriority"])
	end
	_G[TRACKER_INTO_ORDERS_QUEUE] = {}
end