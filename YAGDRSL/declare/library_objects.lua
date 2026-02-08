require "YAGDRSL/libraries/modes.lua"

function DeclareLibraryObjects()
	-- Things that need to be declared but don't necessarily logically fit anywhere else.

	-- Mode to control if Offense or Defense mods are combined into the set first
	_G[MOD_VALUES_ROOT_NAME][MOD_PRIORITIZE_DEFENSE] = M{true, false, ["description"]="Defense Priority"}

	-- Mode to handle locking weapon slots (implemented in EquipSafe)
	_G[MOD_VALUES_ROOT_NAME][MOD_LOCK_WEAPONS] = M{MOD_DEFAULT_OFF, MOD_LOCK_ALL, MOD_LOCK_MAIN_SUB_RANGE, MOD_LOCK_MAIN_SUB, MOD_LOCK_RANGE_AMMO, ["description"]="Locked Weapons"}
	_G[IGNORE_LOCK_SPELLS] = {}
	_G[IGNORE_LOCK_CYCLE_MODS] = {}

	-- Globals to track if a cycle command already has a ForceStatusUpdate scheduled.
	STATE_CYCLE_UPDATE_PENDING = false
	CYCLE_UPDATE_COROUTINE = "cycle_update_coroutine"

	STATE_SET_LOCKSTYLE_PENDING = false
	SET_LOCKSTYLE_COROUTINE = "set_lockstyle_coroutine"

	STATE_PLAYER_SETTINGS_LOADED = false
	STATE_JOB_EQUIPMENT_LOADED = false
	STATE_JOB_LOGIC_LOADED = false

	STATE_DISPLAY_ORDER_DEBUG = false
	STATE_DISPLAY_DEV_LOG = false
	STATE_TRACK_PET = false

	DEVELOPER_LOG = "developer_log"
	_G[DEVELOPER_LOG] = {}

	PERFORMANCE_LOG = "performance_log"
	_G[PERFORMANCE_LOG] = {}

	_G[MAP_BUFF_NAMES] = {}
	_G[MAP_EQUIPMENT_NAMES] = {}

	_G[TRACK_AUTO_CANCEL_SPELLS] = {}
	_G[TRACK_KEY_BINDS] = {}
	_G[TRACK_BUFFS] = {}
	_G[TRACKER_INTO_ORDERS_QUEUE] = {}

	_G[TRACK_MAGIC_BURST] = {}
	_G[TRACK_REGISTERED_EVENTS] = {}
end