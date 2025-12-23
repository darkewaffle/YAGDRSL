-- Table names where mods and overrides are stored.
MOD_VALUES_ROOT_NAME = "mod_values"
OVERRIDE_VALUES_ROOT_NAME = "override_values"

-- Default value for all mods created using CreateMod.
MOD_DEFAULT_OFF = "Off"
-- Default value available for trackers that may track a negative state (eg: "No Shell")
MOD_DEFAULT_ON = "On"

-- Build-in mod that can control what weapon slots EquipSafe will pass to equip
MOD_LOCK_WEAPONS = "mod_lock_weapons"
MOD_LOCK_ALL = "LockAll"
MOD_LOCK_MAIN_SUB_RANGE = "LockMSR"
MOD_LOCK_MAIN_SUB = "LockMS"
MOD_LOCK_RANGE_AMMO = "LockRA"

-- Built-in mod necessary to control mod application order.
MOD_PRIORITIZE_DEFENSE = "mod_prioritize_defense"

-- Values used by the library to handle mod application order.
MOD_CLASS_DEFENSE = "mod_defense"
MOD_CLASS_OFFENSE = "mod_offense"

-- Mod order naming
MOD_ORDER_CONTAINER = "Mod_Order_Container"

MOD_ORDER_LIST_OFFENSE = "MO_List_Offense"
MOD_ORDER_LIST_DEFENSE = "MO_List_Defense"

MOD_ORDER_PRECAST_JA_OFFENSE = "MO_Precast_JA_Offense"
MOD_ORDER_PRECAST_JA_DEFENSE = "MO_Precast_JA_Defense"
MOD_ORDER_MIDCAST_JA_OFFENSE = "MO_Midcast_JA_Offense"
MOD_ORDER_MIDCAST_JA_DEFENSE = "MO_Midcast_JA_Defense"

MOD_ORDER_PRECAST_MAGIC_OFFENSE = "MO_Precast_Magic_Offense"
MOD_ORDER_PRECAST_MAGIC_DEFENSE = "MO_Precast_Magic_Defense"
MOD_ORDER_MIDCAST_MAGIC_OFFENSE = "MO_Midcast_Magic_Offense"
MOD_ORDER_MIDCAST_MAGIC_DEFENSE = "MO_Midcast_Magic_Defense"

MOD_ORDER_PRECAST_RA_OFFENSE = "MO_Precast_RA_Offense"
MOD_ORDER_PRECAST_RA_DEFENSE = "MO_Precast_RA_Defense"
MOD_ORDER_MIDCAST_RA_OFFENSE = "MO_Midcast_RA_Offense"
MOD_ORDER_MIDCAST_RA_DEFENSE = "MO_Midcast_RA_Defense"

MOD_ORDER_PRECAST_WS_OFFENSE = "MO_Precast_WS_Offense"
MOD_ORDER_PRECAST_WS_DEFENSE = "MO_Precast_WS_Defense"
MOD_ORDER_MIDCAST_WS_OFFENSE = "MO_Midcast_WS_Offense"
MOD_ORDER_MIDCAST_WS_DEFENSE = "MO_Midcast_WS_Defense"

MOD_ORDER_STATUS_ENGAGED_OFFENSE = "MO_Engaged_Offense"
MOD_ORDER_STATUS_ENGAGED_DEFENSE = "MO_Engaged_Defense"

MOD_ORDER_STATUS_IDLE_OFFENSE = "MO_Idle_Offense"
MOD_ORDER_STATUS_IDLE_DEFENSE = "MO_Idle_Defense"

MOD_ORDER_STATUS_RESTING_OFFENSE = "MO_Resting_Offense"
MOD_ORDER_STATUS_RESTING_DEFENSE = "MO_Resting_Defense"

MOD_ORDER_CONTROL_PANEL = "MO_Control_Panel"