# YAGDRSL - Yet Another God Damn geaR Swap Library

## Summary
YAGDRSL is a gearswap library intended to make your gearswap files smaller and easier to manage through intuitive mappings and by building sets that are added together through individual steps rather than asking that users define entire sets for every scenario. It should also give users the means to control their gear easily and in detail with a reasonable amount of setup and not too many button presses. There are numerous functions designed specifically for users to help them create Gearswap behavior that does what they want and makes sense to them. There are also many exposed library settings that let them tune what the library does and the feedback it provides in game.

However, YAGDRSL is not intended to provide any automatic 'reactions' to game events. It will not automatically use Holy Water when you are afflicted with Doom, it will not use Presto before a Step, it will not remove Berserk if you're receiving damage, etc. There are hooks in each major event where you could potentially define this behavior. But they will not be part of the library.


## Significant Features
- [A full set of template files](https://github.com/darkewaffle/YAGDRSL/tree/main/samples/templates) that, when used with the Quick Start Guide below, should allow users to simply fill in their gear and start using YAGDRSL pretty easily. Hopefully.
- Thoughtful mapping of spells and abilities into groups so that more sets and more gear can be defined by purpose rather than by individual spells. (eg: Blue magic split into groups like blue.enfeebling, blue.enhancing and blue.cure. Bloodpact Rage split into bloodpact.rage.physical, bloodpact.rage.magical, bloodpact.rage.hybrid)
- Gearsets that are put together through an additive process so that items don't need to be repeated as often, updates are easier to complete and gearset files are shorter overall.
- Gearset "mods" that can quickly modify gearsets on the fly and .lua functions to easily define them.
- Gearset "overrides" to create sets for unique situations that can easily be turned on and off without affecting regularly used sets.
- Buff tracking that is straightforward to setup and that can be used to create buff-specific mods by simply naming the mod after the buff (eg: mods.engaged["Berserk"] or mods.precast.ws["Sneak Attack"])
- Optional automatic tracking of other dynamic game elements like pet name, character movement and character-target facing that can all be used to apply mods.
- A simple but clear Control Panel UI with customizable content and style to display both user mod and library mod values and options. [[1]](https://imgur.com/dYL9gml), [[2]](https://imgur.com/qTM9qvR)
- Built in validation command that can evaluate gear for a single job or all jobs without requiring any changes to the files. [[1]](https://imgur.com/zj89dfF)
- Built in demo command and comprehensive debug messages to test and understand how a gearset is put together through precast-midcast events. [[1]](https://imgur.com/IAZ55wV), [[2]](https://imgur.com/BhUOjxz)
- [Hook functions in all major Gearswap and library events](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/hooks.md) that users can override to implement custom logic.
- [Custom functions to help handle common Gearswap objectives](https://github.com/darkewaffle/YAGDRSL/tree/main/YAGDRSL/customize_helpers) like scaling cures and waltzes for the target's (estimated) HP, replacing Moonshade Earring when the TP bonus isn't necessary, calculating haste and equipping appropriate dual wield sets and conditionally equipping gear when dealing magic damage that matches the day or weather element. 


## Guides and Documentation
#### Quick Start Guide Using YAGDRSL Templates
1. Download the YAG_include.lua file and the entire YAGDRSL folder. These can also be found [in the zip file under 'Releases'](https://github.com/darkewaffle/YAGDRSL/releases).
2. Place them in your Windower\addons\GearSwap\libs folder.
3. Download a copy of the [character file template](https://github.com/darkewaffle/YAGDRSL/blob/main/samples/templates/charactername.lua) and both the equipment and logic file from the [templates directory](https://github.com/darkewaffle/YAGDRSL/tree/main/samples/templates) for any job(s) that you want to configure with YAGDRSL.
4. Place the character file and any job-specific files in the Windower\addons\GearSwap\data folder.
5. Rename charactername.lua to match the name of your character. For example if your character is John then change it to John.lua.

**Important note regarding the order in which GearSwap searches for a file to load. It will search for files matching these names in this order and only load the first one it finds. So if your Windower\addons\GearSwap\data folder contains any other files matching the Name_Job patterns (1 through 4) then they will take priority and your character name file will not be loaded.**
| Load Order | Pattern | Example |
| --- | --- | --- |
| 1 | Name_Job.lua | John_WAR.lua |
| 2 | Name-Job.lua | John-WAR.lua |
| 3 | Name_JobLong.lua | John_Warrior.lua |
| 4 | Name-JobLong.lua | John-Warrior.lua |
| 5 | Name.lua | John.lua |
| 6 | Job.lua | WAR.lua |
| 7 | JobLong.lua | Warrior.lua |
| 8 | default.lua | default.lua |

6. When you have all the files in place then your Windower\addons\GearSwap\libs [folder should look like this](https://imgur.com/xhJqzRx) and your Windower\addons\GearSwap\data [folder should look like this](https://imgur.com/mBixUCk).
7. The character file should be fairly complete already - however you may want to adjust or take note of the following items.

| Name | Usage |
| --- | --- |
| JobControls > macrobook | The in game macro book that will be automatically selected when the library is loaded or you change to the job. |
| JobControls > macroset | The in game macro set that will be automatically selected when the library is loaded or you change to the job. |
| JobControls > lockstyle | The lockstyle that will be automatically applied when the library is loaded or you change to the job. |
| ControlPanelX | The horizontal position of the control panel. 0 represents all the way to the left, positive numbers move it to the right. The range depends on your resolution. |
| ControlPanelY | The vertical position of the control panel. 0 represents all the way at the top, positive numbers move it down. The range depends on your resolution. |
| DayItems | Gear that will be automatically equipped when dealing magical damage that matches the current day element. |
| WeatherItems | Gear that will be automatically equipped when dealing magical damage that matches the current weather element. |
| F12 | F12 is automatically bound to a 'gs c update' command which you can use to call a forced update to your status (idle/engaged/resting) set at any point. |

8. Open the job_equipment.lua file and start filling out the gearsets. Many should be self-explanatory just from how they are named however there are also comments to help explain how and when some of the more unfamiliar ones will be used.
9. Once your character file and job equipment files are in the appropriate folders and have been updated then you should be able to run a 'gs reload' command and start using YAGDRSL. Good luck!


#### Full Documentation
- [Quick Primer on the Difference Between Gearswap and a Gearswap Library](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Gearswap%20and%20Libraries.md)
- [How YAGDRSL Builds a GearSet](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Sets.md)
- [How YAGDRSL Modifies a GearSet](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Mods.md)
- [Overriding Sets for Special Cases](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Overrides.md)
- [Trackers To Track the Trackables](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Trackers.md)
- [Gotchas and Limitations](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Gotchas%20and%20Limitations.md)
- [Tips and Tricks](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/YAG%20Tips%20and%20Tricks.md)

#### Getting Up and Running with YAGDRSL
- [Building Your CharacterName.lua File](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20Your%20Character%20File.md)
- [Making Mods](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Making%20Mods.md)
- [Building a Job Equipment File](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20a%20Job%20Equipment%20File.md)
- [Building a Job Logic File](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20a%20Job%20Logic%20File.md)
- [Building a Job Logic File That's Fancy](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20a%20Job%20Logic%20File%20That's%20Fancy.md)

#### Technical Resources
- [YAGDRSL Flow Diagram](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Flow%20Diagram.md)
- [Examples of Interactions Between sets, mods and overrides](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Equipment%20Examples.md)
- [Gearset Paths for Actions](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/paths.md)
- [Complete List of Supported Gearset Paths](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/YAG_tables.txt)
- [YAGDRSL Commands](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/commands.md)
- [.lua User Functions](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/functions.md)
- [.lua Event Hooks](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/hooks.md)