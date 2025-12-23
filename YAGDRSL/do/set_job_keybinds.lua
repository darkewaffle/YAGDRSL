require "YAGDRSL/do/execute_script.lua"
require "YAGDRSL/get/get_jobcontrol.lua"

function SetBindsMain()
	ExecuteScript(GetMainJobBindScript(), "Main Job Key Bindings")
end

function SetBindsSub()
	ExecuteScript(GetSubJobBindScript(), "Sub Job Key Bindings")
end

function ClearBindsMain()
	ExecuteScript(_G[YAG_SETTINGS]["UnbindMainJobScript"], "Unbinding Main Job Keys")
end

function ClearBindsSub()
	ExecuteScript(_G[YAG_SETTINGS]["UnbindSubJobScript"], "Unbinding Sub Job Keys")
end

function ClearJobBinds()
	ClearBindsMain()
	ClearBindsSub()
end

function SetJobBinds()
	if _G[YAG_SETTINGS]["ApplyKeybindScripts"] then
		-- Schedule to prevent the Clear scripts from running at the same time as the Set scripts.
		ClearJobBinds()
		coroutine.schedule(SetBindsMain, .10)
		coroutine.schedule(SetBindsSub,  .15)
	end
end