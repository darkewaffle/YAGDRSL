function CreateMagicBurstTracking(TargetID)
	if not _G[TRACK_MAGIC_BURST][TargetID] then
		_G[TRACK_MAGIC_BURST][TargetID] =
			{
				[TRACK_BURST_CLOSE] = 0,
				[TRACK_BURST_ELEMENTS] = {},
				[TRACK_SKLLCHAIN_COUNT] = 0
			}
	end
end

function UpdateMagicBurstTracking(TargetID, Elements)
	local FullMagicBurstWindowWindow = 10
	local MagicBurstWindowReductionPerChain = 2
	local MinimumWindow = 2

	local MagicBurstDuration = FullMagicBurstWindowWindow - (MagicBurstWindowReductionPerChain * _G[TRACK_MAGIC_BURST][TargetID][TRACK_SKLLCHAIN_COUNT])
	MagicBurstDuration = Clamp(MagicBurstDuration, MinimumWindow, FullMagicBurstWindowWindow)

	_G[TRACK_MAGIC_BURST][TargetID][TRACK_BURST_CLOSE] = os.time() + MagicBurstDuration
	_G[TRACK_MAGIC_BURST][TargetID][TRACK_BURST_ELEMENTS] = Elements
	_G[TRACK_MAGIC_BURST][TargetID][TRACK_SKLLCHAIN_COUNT] = _G[TRACK_MAGIC_BURST][TargetID][TRACK_SKLLCHAIN_COUNT] + 1
end

function DeleteMagicBurstTracking(TargetID)
	_G[TRACK_MAGIC_BURST][TargetID] = nil
end

function GetMagicBurstIsOpen(TargetID)
	if _G[TRACK_MAGIC_BURST][TargetID] then
		local BurstCloseTime = _G[TRACK_MAGIC_BURST][TargetID][TRACK_BURST_CLOSE]
		local BurstTimeRemaining = BurstCloseTime - os.time()
		
		if BurstTimeRemaining > 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

function GetMagicBurstElementMatches(TargetID, SpellElement)
	if _G[TRACK_MAGIC_BURST][TargetID] then
		local BurstElements = _G[TRACK_MAGIC_BURST][TargetID][TRACK_BURST_ELEMENTS]

		if BurstElements[SpellElement] then
			return true
		else
			return false
		end

	else
		return false
	end
end

function GetMagicBurstLikely(SpellCategory, TargetID, SpellElement)
	if MonitorMagicBurstState and SpellCategory == CATEGORY_MAGIC and GetMagicBurstIsOpen(TargetID) and GetMagicBurstElementMatches(TargetID, SpellElement) then
		return true
	else
		return false
	end
end