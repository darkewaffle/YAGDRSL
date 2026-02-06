function SelfCommandCycle(CommandInputs)
	local ModName = ""

	if #CommandInputs == 0 then
		ChatError("SelfCommandCycle failure: insufficient parameters")
		return
	elseif #CommandInputs == 1 then
		ModName = CommandInputs[1]
	elseif #CommandInputs > 1 then
		ModName = CycleConstructModName(CommandInputs)
	end

	local ModToCycle = _G[MOD_VALUES_ROOT_NAME][ModName]

	if ModToCycle then
		ModToCycle:cycle()
		ChatNotice(ModName .. " =", ModToCycle.current)
	else
		ChatError("SelfCommandCycle: " .. ModName .. " mod not found")
	end

	UpdateControlPanel()

	if _G[YAG_SETTINGS]["ForceUpdateAfterCycle"] then

		-- Determine if the mod is configured to ignore the lock when it triggers a cycle update
		-- If so call the NoLock update, if not call the normal update
		local CycleUpdateFunction = ""
		if GetModIgnoresLockOnCycle(ModName) then
			CycleUpdateFunction = ForceStatusUpdateFromCycleNoLock
		else
			CycleUpdateFunction = ForceStatusUpdateFromCycle
		end

		-- Setting enforces a delay on the update after a cycle.
		-- This allows a mod to be cycled within the delay window without triggering an update on every cycle.
		if _G[YAG_SETTINGS]["ForceUpdateAfterCycleDelay"] and _G[YAG_SETTINGS]["ForceUpdateAfterCycleDelay"] > 0 then

			-- If there is no update pending then schedule the update and set STATE_CYCLE_UPDATE_PENDING to true.
			-- When CycleUpdateFunction runs it will set STATE_CYCLE_UPDATE_PENDING back to false.
			if not STATE_CYCLE_UPDATE_PENDING then
				_G[CYCLE_UPDATE_COROUTINE] = coroutine.schedule(CycleUpdateFunction, ForceUpdateAfterCycleDelay)
				STATE_CYCLE_UPDATE_PENDING = true

			-- If there is an update pending then close the scheduled coroutine containing the update and reschedule a new one.
			else
				coroutine.close(_G[CYCLE_UPDATE_COROUTINE])
				_G[CYCLE_UPDATE_COROUTINE] = coroutine.schedule(CycleUpdateFunction, ForceUpdateAfterCycleDelay)
			end

		else
			CycleUpdateFunction()
		end
	end

	HookOnModChange(ModName, ModToCycle.current) -- @Hook
end

function CycleConstructModName(CommandParameters)
	-- Command inputs are split on each space character. Reconstruct the mod name if it contained spaces.
	-- eg: CommandInputs may be {"Magic", "Defense"}

	local ModName = CommandParameters[1]
	for i = 2, #CommandParameters do
		ModName = ModName .. " " .. CommandParameters[i]
	end
	return ModName
end

function HookOnModChange(ModName, NewModValue) -- @Hook
	-- This is a function the user can override to implement custom logic.
end