function TerminateSpellOnPlayerMidaction(SpellAttributes, Source)
	local TerminateSpell = false
	local TerminateReason = ""

	-- midaction() is a Gearswap function that should be true throughout the duration of a player action and false at all other times.
	-- When true midaction also returns the spell that is currently in progress.
	local PlayerMidactionState, PlayerActionInProgress = midaction()

	-- If player is midaction then terminate starting a new action.
	if PlayerMidactionState then
		TerminateSpell = true
		TerminateReason = "TSOPMA Player: " .. PlayerActionInProgress["name"] .. " is in progress. Terminating " .. SpellAttributes["Name"] .. " " .. Source .. "."
	end

	return TerminateSpell, TerminateReason
end

function TerminateUpdateOnPlayerMidaction(Source)
	local TerminateUpdate = false
	local TerminateReason = ""

	-- midaction() is a Gearswap function that should be true throughout the duration of a player action and false at all other times.
	-- When true midaction also returns the spell that is currently in progress.
	local PlayerMidactionState, PlayerActionInProgress = midaction()

	-- If player is midaction then terminate a status set update.
	if PlayerMidactionState then
		TerminateUpdate = true
		TerminateReason = "TUOPMA Player: " .. PlayerActionInProgress["name"] .. " is in progress. Terminating status set update from " .. Source .. "."
	end

	return TerminateUpdate, TerminateReason
end