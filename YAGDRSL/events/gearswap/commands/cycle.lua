function SelfCommandCycle(CommandInputs)
	if #CommandInputs == 0 then
		ChatError("SelfCommandCycle failure: insufficient parameters")
		return
	end

	local ModToCycle = _G[MOD_VALUES_ROOT_NAME][CommandInputs[1]]

	if ModToCycle then
		ModToCycle:cycle()
		ChatNotice(CommandInputs[1] .. " =", ModToCycle.current)
	else
		ChatError("SelfCommandCycle: " .. CommandInputs[1] .. " mod not found")
	end

	UpdateControlPanel()

	if _G[YAG_SETTINGS]["ForceUpdateAfterCycle"] then

		-- Setting enforces a delay on the update after a cycle.
		-- This allows a mod to be cycled within the delay window without triggering an update on every cycle.
		if _G[YAG_SETTINGS]["ForceUpdateAfterCycleDelay"] and _G[YAG_SETTINGS]["ForceUpdateAfterCycleDelay"] > 0 then

			-- If there is no update pending then schedule the update and set STATE_CYCLE_UPDATE_PENDING to true.
			-- When ForceStatusUpdateFromCycle runs it will set STATE_CYCLE_UPDATE_PENDING back to false.
			if not STATE_CYCLE_UPDATE_PENDING then
				_G[CYCLE_UPDATE_COROUTINE] = coroutine.schedule(ForceStatusUpdateFromCycle, ForceUpdateAfterCycleDelay)
				STATE_CYCLE_UPDATE_PENDING = true

			-- If there is an update pending then close the scheduled coroutine containing the update and reschedule a new one.
			else
				coroutine.close(_G[CYCLE_UPDATE_COROUTINE])
				_G[CYCLE_UPDATE_COROUTINE] = coroutine.schedule(ForceStatusUpdateFromCycle, ForceUpdateAfterCycleDelay)
			end

		else
			ForceStatusUpdateFromCycle()
		end
	end
end