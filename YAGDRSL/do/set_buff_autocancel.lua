require "YAGDRSL/debug/chat.lua"
require "YAGDRSL/get/get_action.lua"
require "YAGDRSL/get/get_buff.lua"
require "YAGDRSL/get/get_spell.lua"

-- @User
-- Function record which spells should trigger an automatic buff cancel and which buffs it should attempt to cancel.
-- Every spell submitted in SpellsBeingCast will attempt to cancel any of the buffs in BuffsToCancel if they are active each time the spell is cast.
-- SpellsBeingCast and BuffsToCancel are both expected to be tables. Using it should look like the below example
--
-- SetAutoCancelBuff({"Spectral Jig"}, {"Sneak", "Invisible"})
--
-- Note the braces that surround Spectral Jig and both Sneak and Invisible as well as the commas that separate the braces and each spell or buff.

function SetAutoCancelBuff(SpellsBeingCast, BuffsToCancel)

	local SpellsTriggeringCancel = _G[TRACK_AUTO_CANCEL_SPELLS]
	local ValidSpells = {}
	local ValidBuffs = {}

	if SpellsBeingCast then
		for _, SpellName in ipairs(SpellsBeingCast) do
			if GetActionNameIsValid(SpellName) then
				ChatDebug("Autocancel spell name is valid -", SpellName)
				table.insert(ValidSpells, SpellName)
			else
				ChatError("Autocancel spell name is not valid -", SpellName)
			end
		end
	end

	if BuffsToCancel then
		for _, BuffName in ipairs(BuffsToCancel) do
			if GetBuffNameIsValid(BuffName) then
				ChatDebug("Autocancel buff name is valid -", BuffName)
				table.insert(ValidBuffs, BuffName)
			else
				ChatError("Autocancel buff name is not valid -", BuffName)
			end
		end
	end

	-- Proceed if at least 1 spell and 1 buff were successfully validated.
	if #ValidSpells > 0 and #ValidBuffs > 0 then
		for _, ValidSpellName in ipairs(ValidSpells) do
			ChatDebug(ValidSpellName,"will cancel the following")
			ChatTableDebug(ValidBuffs)
			SpellsTriggeringCancel[ValidSpellName] = ValidBuffs
		end
	end
end