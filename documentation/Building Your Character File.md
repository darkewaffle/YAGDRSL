# Starting at the Beginning
Most Gearswap libraries will start with a job file - but YAGDRSL takes a step back from that and instead starts with a character file. This is so that you can more easily define gear, functions and settings that may be used across multiple jobs and so that there is a single, central location to easily update and change your JobControls. The JobControls table is the central feature of your character file, but before we talk about how it works we first need to cover some important structural elements of the character file.

## File Location
Your character file should be in the Windower\addons\GearSwap\libs folder. However if you would rather test-drive YAGDRSL and keep the files for it separate from your existing Gearswap files you can also just put it in the libs-dev folder.

## File Name
In order for Gearswap to recognize and load your character file we have to make sure that Gearswap finds it. The best way to do this is to just name the file after your character. So if your character name is "Merlin" then just name the file "Merlin.lua". The name is not case sensitive.
Additionally if you are using libs-dev to test YAGDRSL, you can easily go back and forth between your current Gearswap setup and YAGDRSL. Just rename the libs-dev/charactername.lua file so gearswap won't recognize it, input a 'gs reload' command and you're back to your original gearswap. Then when you want to continue trying YAGDSRL just do the reverse - change the file name to match your character, 'gs reload' and you're back in YAGDRSL.

## File Structure
Your character file needs to contain two functions for GearSwap and YAGDRSL to work together correctly. The first is get_sets() and the second is GetPlayerSettings(). These function names **are** case sensitive.
#### get_sets()
```
function get_sets()
	require "YAG_include.lua"
end
```
get_sets() is a function built into GearSwap and get_sets() is the first piece of user code that Gearswap runs. By placing 'require "YAG_include.lua"' in it we ensure that it loads the full YAGDRSL library. You do not need to make any changes to this function, just place the complete code snippet above at the start of your character file.

#### GetPlayerSettings()
```
function GetPlayerSettings()
	-- JobControls, settings, gear declarations go here.
end
```
GetPlayerSettings is a function built into YAGDRSL. After the library does most of it's initial load it will call GetPlayerSettings() when it is ready to start reading and using your character data. This function should at least contain your JobControls and any YAGDRSL settings that you want to change. This should go in your character file just below get_sets().


So in it's most basic form your character file may just look like this when you start to build it.
```
function get_sets()
	require "YAG_include.lua"
end

function GetPlayerSettings()
	-- I'm empty!
end
```
But now let's add some more.

## JobControls
JobControls is the most important part of your character file because it's how your character file connects to your job files. It's a table that you fill out to tell YAGDRSL what settings should be applied when you change to a job and what files contain your job data. Every time YAGDRSL is loaded or your job is changed the values you put into JobControls will determine how your macrobook, macroset and lockstyle are changed as well as what files are loaded to define your gearsets and any custom logic. Here's how it looks before you put anything into it.

```
	JobControls = 
	{
		["WAR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["MNK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["WHM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BLM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RDM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["THF"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["PLD"] = {macrobook=1, macroset=1, lockstyle=3, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["DRK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BST"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BRD"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RNG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SAM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["NIN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["DRG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SMN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BLU"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["COR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["PUP"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["DNC"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SCH"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["GEO"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RUN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""}
	}
```

As you can see each job represents a row in the table and each row contains seven different values you can fill out. Here's what each one does.

| Name | Description |
| --- | --- |
| macrobook | The number of the in-game macro book that will be automatically selected for the job. |
| macroset | The number of the in-game macro set that will be automatically selected for the job. |
| lockstyle | The number of the in-game equipment set lockstyle that will be automatically set for the job. |
| file_equipment | The name of the file that contains the all the gearsets for the job. |
| file_logic | The name of the file that contains any library function calls or custom code for the job. Technically this is optional as you could put everything into the equipment file - or vice versa - but I suggest separating them into two files to stay organized.|
| script_binds_main | When the job is set to your main job this script will be executed. This is an optional setting and will only be applied if the library setting ApplyKeybindScripts = true. |
| script_binds_sub | When the job is set to your sub job this script will be executed. This is an optional setting and will only be applied if the library setting ApplyKeybindScripts = true. |


Now here's how a JobControls table with some data in it may look. Keep in mind that you don't have to fill out anything for a job that you don't use. Also note that the file path for the file_equipment and file_logic files should be relative to your Windower\addons\GearSwap\libs (or libs-dev) folder while the file path for the script_binds_main and script_binds_sub files will be relative to your Windower\scripts folder.

```
	JobControls = 
	{
		["WAR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_war.lua"},
		["MNK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["WHM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BLM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RDM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["THF"] = {macrobook=4, macroset=1, lockstyle=4, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["PLD"] = {macrobook=3, macroset=1, lockstyle=3, file_equipment="samples/jobfiles/intermediate_pld_equipment.lua", file_logic="samples/jobfiles/intermediate_pld_logic.lua", script_binds_main="binds/pld.lua", script_binds_sub=""},
		["DRK"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BST"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BRD"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="samples/jobfiles/intermediate_brd_equipment.lua", file_logic="samples/jobfiles/intermediate_brd_logic.lua", script_binds_main="", script_binds_sub=""},
		["RNG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SAM"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_sam.lua"},
		["NIN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_nin.lua"},
		["DRG"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["SMN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["BLU"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub="binds/sub_blu.lua"},
		["COR"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["PUP"] = {macrobook=1, macroset=1, lockstyle=5, file_equipment="samples/jobfiles/simple_pup_equipment.lua", file_logic="samples/jobfiles/simple_pup_logic.lua", script_binds_main="binds/pup.lua", script_binds_sub=""},
		["DNC"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="samples/jobfiles/advanced_dnc_equipment.lua", file_logic="samples/jobfiles/advanced_dnc_logic.lua", script_binds_main="binds/dnc.lua", script_binds_sub="binds/sub_dnc.lua"},
		["SCH"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["GEO"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""},
		["RUN"] = {macrobook=1, macroset=1, lockstyle=1, file_equipment="", file_logic="", script_binds_main="", script_binds_sub=""}
	}
```

Now that we have our JobControls table we'll look at all the settings that you can use to adjust YAGDRSL as well.


## YAGDRSL SETTINGS
These are settings that control many aspects of how YAGDRSL works and looks. You do not need to include all of them, only the ones you want to use and change. The others will simply revert to a safe, default value. You can define these inside of GetPlayerSettings by simply typing a line with the setting name, then an equals sign and the desired value.
```
ApplyKeybindScripts = false
```

### Keybinds
| Setting | Default Value | Description |
| --- | --- | --- |
| ApplyKeybindScripts | false | This setting controls whether or not the script_binds_main and script_binds_sub values in JobControls are executed or not. |
| UnbindMainJobScript | blank | Default unbind script that will be run anytime your job changes or the library is unloaded. |
| UnbindSubJobScript | blank | Default unbind scripts that will be run anytime your job changes or the library is unloaded. |


### Update After Changing Zone
| Setting | Default Value | Description |
| --- | --- | --- |
| ForceUpdateAfterZone | false | Controls whether or not an update to your current status set will be applied when you change zone. |
| ForceUpdateAfterZoneDelay | 10 | Controls the amount of time that must pass before the force update occurs after changing zone. |


### Update After Cycling Mod Value
| Setting | Default Value | Description |
| --- | --- | --- |
| ForceUpdateAfterCycle | true | Controls whether or not an update to your current status set will be applied when you cycle a mod value. |
| ForceUpdateAfterCycle | 0 | How long the update will be delayed. Essentially this lets you cycle a mod value repeatedly without causing an update every time and then after you stop cycling for ForceUpdateAfterCycleDelay amount of seconds then the update will be applied. |


### Chat Settings
| Setting | Default Value | Description |
| --- | --- | --- |
| ShowDebugMessages | false | YAGDRSL has fairly extensive debug messages in place that are normally hidden. But if you want to see them to learn more about how it works or to try to diagnose why something isn't working like you expect then turning them on can be helpful. You can also turn them on at will using a 'gs c debug' command. |
| GearSetChatSlotWidth | 35 | Debug messages will also display gearsets in the chat log. This controls how much horizontal space each slot will take up in the chat log. |


### Other Settings
| Setting | Default Value | Description |
| --- | --- | --- |
| AutoCancelDelayAmount | .2 | YAGDRSL can automatically cancel buffs configured with the SetAutoCancelBuff function. When a cancel takes place this determines how much time the action is delayed before being cast. |
| AutomaticPrecastTermination | false | Precast has some simple checks in place that will cancel an action (and will not change gear) if the action is on recast or if the action is a Weaponskill and the character has <1000 TP. This may be expanded in the future. |


### Tick Settings
These control YAGDRSL's OnTick event. Essentially this allows code to be run at regular intervals regardless of what's happening in the game. However because of that if it is used irresponsibly then it can degrade game performance. But that should not be a problem as long as you are careful to not set TickInterval too low.

| Setting | Default Value | Description |
| --- | --- | --- |
| TickEnable | false | Enables or disables the creation of the tick event when YAGDRSL is loaded. |
| TickInterval | 60 | Controls the frequency of the tick event. Essentially this is the number of frames that must be displayed between each tick. If you play at 30FPS then I would not go lower than 10. If you play at 60FPS then I would not go lower than 20. |
| TickForceUpdateCooldown | 5 | Controls how many seconds must pass between each force update called by tick. |
| TickEvaluateMovement | false | Enables movement tracking so that gearsets can be equipped or modified depending on whether or not the character is moving or stationary. |
| TickEvaluateFacing | false | Enables tracking of whether or not you are currently engaged with the target and facing the target's face. Useful for conditionally equipping items like Horos Toe Shoes. |
| TickEvaluateHook | false | Enables the HookOnTick function where the user can write their own code that would be run every tick interval. |

### Control Panel Settings
The control panel is a text display that will show you the current state of various mods. Most of these should be self explanatory however a few are worth mentioning specifically.


| Setting | Default Value | Description |
| --- | --- | --- |
| ControlPanelDescriptionWidth | 20 | When a mod is formatted into the control panel the description will be padded with spaces up to ControlPanelDescriptionWidth length. |
| ControlPanelValueWidth | 10 | When a mod is formatted into the control panel the value will be padded with spaces up to ControlPanelValueWidth length. |
| ControlPanelActiveValueOnly | false | This setting controls whether or not the control panel will display all the values a mod contains (highlighting the active value among them) or if it will only display the currently active value. |


| Setting Name | Default Value |
| --- | --- |
| ControlPanelVisible | true |
| ControlPanelActiveDecoratorPrefix | "**" |
| ControlPanelActiveDecoratorSuffix | "**" |
| ControlPanelX | 100 |
| ControlPanelY | 100 |
| ControlPanelBackgroundTransparency | 128 |
| ControlPanelBackgroundRed | 0 |
| ControlPanelBackgroundGreen | 0 |
| ControlPanelBackgroundBlue | 0 |
| ControlPanelBackgroundVisible | true |
| ControlPanelJustifyRight | false |
| ControlPanelJustifyBottom | false |
| ControlPanelBold | false |
| ControlPanelDraggable | false |
| ControlPanelItalic | false |
| ControlPanelPadding | 6 |
| ControlPanelFontSize | 12 |
| ControlPanelFont | 'Consolas' |
| ControlPanelFontTransparency | 255 |
| ControlPanelFontRed | 255 |
| ControlPanelFontGreen | 255 |
| ControlPanelFontBlue | 255 |
| ControlPanelFontOutlineWidth | 0 |
| ControlPanelFontOutlineTransparency | 255 |
| ControlPanelFontOutlineRed | 0 |
| ControlPanelFontOutlineGreen | 0 |
| ControlPanelFontOutlineBlue | 0 |

## Character Gear
You may also want to include gearsets or aliases that are useful across multiple jobs. Maybe you have a crafting set...

```
	sets.craft =
		{
			main="Caduceus",
			sub="Ossifier's Shield",
			head="Protective Specs.",
			body="Boneworker's Apn.",
			hands="Tanner's Gloves",
			waist="Boneworker's Belt",
			neck="Bone. Torque",
			ring1="Artificer's Ring",
			ring2="Craftmaster's Ring"
		}
```

Or gear that you want to re-use on multiple jobs easily.

```
	gear.TH2_Hands = { name="Herculean Gloves", augments={'"Dbl.Atk."+1','"Occult Acumen"+9','"Treasure Hunter"+2','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
```

The character file is a good place to put those as well. Just make sure that your JobControls, settings and any of your gear definitions are *inside* of your GetPlayerSettings function. 

[Finally, click here to see an annotated example of a complete character file.](https://github.com/darkewaffle/YAGDRSL/blob/main/samples/charactername.lua)