require "YAGDRSL/do/insert_mod_order.lua"

-- @User
-- These functions will accept the names of mods and store them in the Mod Order tables to configure the order in which mods are applied.
-- They apply left to right with left being lowest priority and right being highest. Or rather they are combined into the set left to right.
-- This means gear in founds in mods to the right will overwrite gear in mods to the left.
--
-- eg: SetModOrderEngagedDefense("PhysDefense", "MagicDefense") 
-- The above would cause gear found in a MagicDefense mod to overwrite gear in a PhysDefense mod if they occupy the same slot.


-- Precast Mod Order
function SetModOrderPrecastJAOffense(...)
	SetModOrder(MOD_ORDER_PRECAST_JA_OFFENSE, ...)
end
function SetModOrderPrecastJADefense(...)
	SetModOrder(MOD_ORDER_PRECAST_JA_DEFENSE, ...)
end

function SetModOrderPrecastMagicOffense(...)
	SetModOrder(MOD_ORDER_PRECAST_MAGIC_OFFENSE, ...)
end
function SetModOrderPrecastMagicDefense(...)
	SetModOrder(MOD_ORDER_PRECAST_MAGIC_DEFENSE, ...)
end

function SetModOrderPrecastRAOffense(...)
	SetModOrder(MOD_ORDER_PRECAST_RA_OFFENSE, ...)
end
function SetModOrderPrecastRADefense(...)
	SetModOrder(MOD_ORDER_PRECAST_RA_DEFENSE, ...)
end

function SetModOrderPrecastWSOffense(...)
	SetModOrder(MOD_ORDER_PRECAST_WS_OFFENSE, ...)
end
function SetModOrderPrecastWSDefense(...)
	SetModOrder(MOD_ORDER_PRECAST_WS_DEFENSE, ...)
end


-- Midcast Mod Order
function SetModOrderMidcastJAOffense(...)
	SetModOrder(MOD_ORDER_MIDCAST_JA_OFFENSE, ...)
end
function SetModOrderMidcastJADefense(...)
	SetModOrder(MOD_ORDER_MIDCAST_JA_DEFENSE, ...)
end

function SetModOrderMidcastMagicOffense(...)
	SetModOrder(MOD_ORDER_MIDCAST_MAGIC_OFFENSE, ...)
end
function SetModOrderMidcastMagicDefense(...)
	SetModOrder(MOD_ORDER_MIDCAST_MAGIC_DEFENSE, ...)
end

function SetModOrderMidcastRAOffense(...)
	SetModOrder(MOD_ORDER_MIDCAST_RA_OFFENSE, ...)
end
function SetModOrderMidcastRADefense(...)
	SetModOrder(MOD_ORDER_MIDCAST_RA_DEFENSE, ...)
end

function SetModOrderMidcastWSOffense(...)
	SetModOrder(MOD_ORDER_MIDCAST_WS_OFFENSE, ...)
end
function SetModOrderMidcastWSDefense(...)
	SetModOrder(MOD_ORDER_MIDCAST_WS_DEFENSE, ...)
end


-- Status Mod Order
function SetModOrderEngagedOffense(...)
	SetModOrder(MOD_ORDER_STATUS_ENGAGED_OFFENSE, ...)
end
function SetModOrderEngagedDefense(...)
	SetModOrder(MOD_ORDER_STATUS_ENGAGED_DEFENSE, ...)
end

function SetModOrderIdleOffense(...)
	SetModOrder(MOD_ORDER_STATUS_IDLE_OFFENSE, ...)
end
function SetModOrderIdleDefense(...)
	SetModOrder(MOD_ORDER_STATUS_IDLE_DEFENSE, ...)
end

function SetModOrderRestingOffense(...)
	SetModOrder(MOD_ORDER_STATUS_RESTING_OFFENSE, ...)
end
function SetModOrderRestingDefense(...)
	SetModOrder(MOD_ORDER_STATUS_RESTING_DEFENSE, ...)
end


-- @User
-- These functions will accept the names of mods and store them in the Mod Order tables to configure the order in which mods are applied.
-- AppendModOrder will simply add the mods to the end of the existing mod order, all of the mods already added to it will remain.

-- Precast Mod Order
function AppendModOrderPrecastJAOffense(...)
	AppendModOrder(MOD_ORDER_PRECAST_JA_OFFENSE, ...)
end
function AppendModOrderPrecastJADefense(...)
	AppendModOrder(MOD_ORDER_PRECAST_JA_DEFENSE, ...)
end

function AppendModOrderPrecastMagicOffense(...)
	AppendModOrder(MOD_ORDER_PRECAST_MAGIC_OFFENSE, ...)
end
function AppendModOrderPrecastMagicDefense(...)
	AppendModOrder(MOD_ORDER_PRECAST_MAGIC_DEFENSE, ...)
end

function AppendModOrderPrecastRAOffense(...)
	AppendModOrder(MOD_ORDER_PRECAST_RA_OFFENSE, ...)
end
function AppendModOrderPrecastRADefense(...)
	AppendModOrder(MOD_ORDER_PRECAST_RA_DEFENSE, ...)
end

function AppendModOrderPrecastWSOffense(...)
	AppendModOrder(MOD_ORDER_PRECAST_WS_OFFENSE, ...)
end
function AppendModOrderPrecastWSDefense(...)
	AppendModOrder(MOD_ORDER_PRECAST_WS_DEFENSE, ...)
end


-- Midcast Mod Order
function AppendModOrderMidcastJAOffense(...)
	AppendModOrder(MOD_ORDER_MIDCAST_JA_OFFENSE, ...)
end
function AppendModOrderMidcastJADefense(...)
	AppendModOrder(MOD_ORDER_MIDCAST_JA_DEFENSE, ...)
end

function AppendModOrderMidcastMagicOffense(...)
	AppendModOrder(MOD_ORDER_MIDCAST_MAGIC_OFFENSE, ...)
end
function AppendModOrderMidcastMagicDefense(...)
	AppendModOrder(MOD_ORDER_MIDCAST_MAGIC_DEFENSE, ...)
end

function AppendModOrderMidcastRAOffense(...)
	AppendModOrder(MOD_ORDER_MIDCAST_RA_OFFENSE, ...)
end
function AppendModOrderMidcastRADefense(...)
	AppendModOrder(MOD_ORDER_MIDCAST_RA_DEFENSE, ...)
end

function AppendModOrderMidcastWSOffense(...)
	AppendModOrder(MOD_ORDER_MIDCAST_WS_OFFENSE, ...)
end
function AppendModOrderMidcastWSDefense(...)
	AppendModOrder(MOD_ORDER_MIDCAST_WS_DEFENSE, ...)
end


-- Status Mod Order
function AppendModOrderEngagedOffense(...)
	AppendModOrder(MOD_ORDER_STATUS_ENGAGED_OFFENSE, ...)
end
function AppendModOrderEngagedDefense(...)
	AppendModOrder(MOD_ORDER_STATUS_ENGAGED_DEFENSE, ...)
end

function AppendModOrderIdleOffense(...)
	AppendModOrder(MOD_ORDER_STATUS_IDLE_OFFENSE, ...)
end
function AppendModOrderIdleDefense(...)
	AppendModOrder(MOD_ORDER_STATUS_IDLE_DEFENSE, ...)
end

function AppendModOrderRestingOffense(...)
	AppendModOrder(MOD_ORDER_STATUS_RESTING_OFFENSE, ...)
end
function AppendModOrderRestingDefense(...)
	AppendModOrder(MOD_ORDER_STATUS_RESTING_DEFENSE, ...)
end