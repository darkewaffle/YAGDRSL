function SelfCommandDemo(CommandInputs)
	if #CommandInputs == 0 then
		ChatError("SelfCommandDemo failure: insufficient parameters")
		return
	end

	-- Demo relies on Debug class messages to provide feedback. If debug messages are already enabled, do nothing.
	-- Otherwise set RevertDebug so that the messages can be turned off again after demo completes.
	local RevertDebug = false
	if not _G[YAG_SETTINGS]["ShowDebugMessages"] then
		_G[YAG_SETTINGS]["ShowDebugMessages"] = true
		RevertDebug = true
	end

	local CategoryValid, SpellCategory = DemoValidateCategory(CommandInputs[1])

	if not CategoryValid then
		ChatError("SelfCommandDemo failure: Invalid action or status command -", CommandInputs[1])
	else
		if SpellCategory == CATEGORY_STATUS then

			local StatusValid, CharacterStatus = DemoValidateStatus(CommandInputs[2])
			if not StatusValid then
				ChatError("SelfCommandDemo failure: Invalid status -", CommandInputs[2])
			else
				ChatBlankLine()
				ChatCheckpoint("Demo Start: " .. SpellCategory .." =", CharacterStatus)

				-- Demo for a status does not require any additional parameters (unlike SpellAttributes for an action).
				-- Just submit the status to GetStatusSet and voila.
				local DemoStatusSet = GetStatusSet(CharacterStatus, EVENT_STATUS_CHANGE_DEMO)
				ChatGearSet(DemoStatusSet, EVENT_STATUS_CHANGE_DEMO)
			end

		else

			-- Command inputs are split on each space character. Reconstruct the spell name if it contained spaces.
			-- eg: CommandInputs may be {"ws", "Rudra's", "Storm"} 
			local SpellName = ""

			if SpellCategory == CATEGORY_RA then
				SpellName = NAME_RA
			else
				SpellName = DemoConstructSpellName(CommandInputs)
			end

			if not GetActionNameIsValid(SpellName) then
				ChatError("SelfCommandDemo failure: Invalid spell or action name -", SpellName)
			else
				ChatBlankLine()
				ChatCheckpoint("Demo Start: " .. SpellCategory .." =", SpellName)

				-- To get the set for an action the Precast and Midcast events will require a SpellAttributes object.
				-- DemoSpellAttributes builds it based off the SpellCategory and Name to lookup other necessary data.
				local DemoSpellAttributes = DemoConstructSpellAttributes(SpellCategory, SpellName)

				local DemoPrecastSet = PrecastContainer(DemoSpellAttributes, EVENT_PRECAST_DEMO)
				ChatGearSet(DemoPrecastSet, EVENT_PRECAST_DEMO)

				if DemoSpellAttributes["Category"] == CATEGORY_MAGIC or DemoSpellAttributes["Category"] == CATEGORY_RA or DemoSpellAttributes["ParentGroup"] == MAP_JA_BLOODPACT then
					local DemoMidcastSet = MidcastContainer(DemoSpellAttributes, EVENT_MIDCAST_DEMO)
					ChatGearSet(DemoMidcastSet, EVENT_MIDCAST_DEMO)
				end
			end
		end
	end

	ChatCheckpoint("Demo End")
	ChatBlankLine()

	if RevertDebug then
		_G[YAG_SETTINGS]["ShowDebugMessages"] = false
	end
end

function DemoValidateCategory(CategoryInput)
	
	local CategoryMap =
		{
			--["i"]=CATEGORY_ITEM, ["item"]=CATEGORY_ITEM,
			["j"]=CATEGORY_JA, ["ja"]=CATEGORY_JA, ["jobability"]=CATEGORY_JA, ["p"]=CATEGORY_JA, ["pet"]=CATEGORY_JA,
			["m"]=CATEGORY_MAGIC, ["ma"]=CATEGORY_MAGIC, ["magic"]=CATEGORY_MAGIC, ["spell"]=CATEGORY_MAGIC, ["n"]=CATEGORY_MAGIC, ["nin"]=CATEGORY_MAGIC, ["ninjutsu"]=CATEGORY_MAGIC, ["s"]=CATEGORY_MAGIC, ["song"]=CATEGORY_MAGIC,
			["r"]=CATEGORY_RA, ["ra"]=CATEGORY_RA, ["range"]=CATEGORY_RA, ["ranged"]=CATEGORY_RA,
			["state"]=CATEGORY_STATUS, ["status"]=CATEGORY_STATUS,
			["w"]=CATEGORY_WS, ["ws"]=CATEGORY_WS, ["weaponskill"]=CATEGORY_WS
		}

	local CategoryFound = false
	CategoryInput = string.lower(CategoryInput)
	if CategoryMap[CategoryInput] then
		CategoryFound = true
	end

	return CategoryFound, CategoryMap[CategoryInput]
end

function DemoValidateStatus(StatusInput)

	local StatusMap =
		{
			["e"]=STATUS_ENGAGED, ["engaged"]=STATUS_ENGAGED, ["combat"]=STATUS_ENGAGED, ["fighting"]=STATUS_ENGAGED,
			["i"]=STATUS_IDLE, ["idle"]=STATUS_IDLE,
			["r"]=STATUS_RESTING, ["rest"]=STATUS_RESTING, ["resting"]=STATUS_RESTING
		}


	local StatusFound = false
	StatusInput = string.lower(StatusInput)
	if StatusMap[StatusInput] then
		StatusFound = true
	end

	return StatusFound, StatusMap[StatusInput]
end

function DemoConstructSpellName(CommandParameters)
	-- Command inputs are split on each space character. Reconstruct the spell name if it contained spaces.
	-- eg: CommandInputs may be {"ws", "Rudra's", "Storm"}

	-- CommandParameters[2] should be the start 
	local SpellName = CommandParameters[2]
	for i = 3, #CommandParameters do
		SpellName = SpellName .. " " .. CommandParameters[i]
	end
	return SpellName
end