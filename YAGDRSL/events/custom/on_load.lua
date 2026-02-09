-- It all starts here. This should be the first code that the library runs.

function OnLoad()
	ChatCheckpoint("OnLoad started")

	-- Many 'const' string values and some pre-defined booleans are all already created simply through require YAG_include.lua
	-- This creates all library tables including gearset tables and children tables.
	-- Also creates library-defined mods and default settings.
	coroutine.schedule(InitializeLibraryObjects, .1)


	-- The player's charactername.lua file (which should be loaded naturally by Gearswap) should contain a GetPlayerSettings function
	-- that the library calls to define various setting values and possibly gearsets or items.
	-- This happens after the library declaration to try to ensure all gearset tables that the user may want to use are already created.
	coroutine.schedule(InitializePlayerData, .3)


	-- Attempts to load the equipment and logic files that should be defined in in the player's JobControls table.
	coroutine.schedule(InitializeJobData, .5)

	-- Registers functions with Windower events 'prerender' and 'zone change'
	-- This occurs after InitializePlayerData and InitializeJobData as player settings may opt to disable the prerender event (OnTick)
	coroutine.schedule(RegisterCustomEvents, .7)


	-- Trackers are created by the users as part of SetBuffTracking. However they are not added to Mod Orders until all player files have completed processing.
	-- This ensures that trackers always exist at the end of the mod order so that they take priority - which they normally should given they primarily track transient buffs.
	coroutine.schedule(ApplyTrackers, .9)

	coroutine.schedule(LoadControlPanel, 1.1)

	coroutine.schedule(OnLoadComplete, 1.3)

	-- Sets keybinds, lockstyle, macroset and macrobook for current job.
	coroutine.schedule(ApplyJobControls, 1.5)
end

function InitializeLibraryObjects()
	-- Many 'const' string values and some pre-defined booleans are all already created simply through require YAG_include.lua
	-- This creates all library tables including gearset tables and children tables.
	-- Also creates library-defined mods and default settings.
	DeclareYAGLibrary()
end

function InitializePlayerData()
	if GetPlayerSettingsProtected() then
		-- Once GetPlayerSettings has run the player settings should exist in the global space. However the library doesn't read them from there.
		-- This collects each valid setting and then stores it in the _G[YAG_SETTINGS] table where it will actually take effect.
		ApplyPlayerSettings()

		-- While false this allows the library to access certain global setting values that may be found in the character.lua file before
		-- they have been applied via ApplyPlayerSettings.
		-- Currently only affects ChatDebug / ShowDebugMessages.
		STATE_PLAYER_SETTINGS_LOADED = true

	else
		ApplyPlayerSettings()
		ChatError("GetPlayerSettings failed. Job files not loaded and job settings not applied.")
	end
end

function GetPlayerSettingsProtected()
	local SettingsLoaded, Error = pcall(GetPlayerSettings)
	if SettingsLoaded then
		ChatNotice("GetPlayerSettings successful")
	else
		ChatError("GetPlayerSettings failed to load -", Error)
	end
	return SettingsLoaded
end

function InitializeJobData()
	if STATE_PLAYER_SETTINGS_LOADED then 
		-- Attempts to load the equipment and logic files that should be defined in in the player's JobControls table.
		LoadMainJobFiles()

		-- Called again here as the job files could redefine settings or define additional settings.
		ApplyPlayerSettings()
	end
end

function RegisterCustomEvents()
	-- Registers functions with Windower events - each Register function that corresponds to an optional function should contain conditionals to define if they are active or not
	RegisterOnTick()
	RegisterOnZoneChange()
	RegisterOnLogOut()
	RegisterOnChunk()
end

function ApplyTrackers()
	-- Trackers are created by the users as part of SetBuffTracking. However they are not added to Mod Orders until all player files have completed processing.
	-- This ensures that trackers always exist at the end of the mod order so that they take priority - which they normally should given they primarily track transient buffs.
	ProcessQueuedTrackers()
end

function LoadControlPanel()
	InitializeControlPanel()
end

function OnLoadComplete()
	ChatCheckpoint("OnLoad completed")

	-- Scheduled here to ensure that if HookOnLoad is overwritten in either the player or job files then
	-- that data has already been loaded so that the user version of the function is called instead of the
	-- empty placeholder.
	coroutine.schedule(HookOnLoad, 1) -- @Hook
end

function ApplyJobControls()
	if STATE_PLAYER_SETTINGS_LOADED then
		-- Sets keybinds, lockstyle, macroset and macrobook for current job.
		-- These calls are each subject to a further coroutine delay since they send commands directly to the game.
		InitializeJob()
	end
end

function HookOnLoad() -- @Hook
	-- This is a function the user can override to implement custom logic.
	-- Note that the call for this is scheduled within OnLoadComplete and on a 1 second delay.
end