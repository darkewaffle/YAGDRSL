# YAGDRSL - Yet Another God Damn geaR Swap Library

## Summary
YAGDRSL is a gearswap library intended to make your gearswap files smaller and easier to manage through intuitive mappings and by building sets that are added together through individual steps rather than asking that users define entire sets for every scenario. It should also give users the means to control their gear easily and in detail with a reasonable amount of setup and not too many button presses. There are numerous functions designed specifically for users to help them create Gearswap behavior that does what they want and makes sense to them. There are also many exposed library settings that let them tune what the library does and the feedback it provides in game.

However, YAGDRSL is not intended to provide any automatic 'reactions' to game events. It will not automatically use Holy Water when you are afflicted with Doom, it will not use Presto before a Step, it will not remove Berserk if you're receiving damage, etc. There are hooks in each major event where you could potentially define this behavior. But they will not be part of the library.


#### Quick Start Guide
1. Download the YAG_include.lua file and the entire YAGDRSL folder.
2. Place them in your Windower\addons\GearSwap\libs folder.<br>
*Or if you want to test-drive YAGDRSL and keep the files for it separate from your existing Gearswap files you can also just put everything in the libs-dev folder*.
3. In the libs folder create a .lua file with the same name as your character. (eg: If your character is John then create John.lua).<br>
*If using libs-dev to test YAGDRSL, you can easily go back and forth between your current Gearswap setup and YAGDRSL. Just rename the libs-dev/charactername.lua file so gearswap won't recognize it, input a 'gs reload' command and you're back to your original gearswap. Then when you want to continue trying YAGDSRL just do the reverse - change the file name to match your character, 'gs reload' and you're back in YAGDRSL.*
4. Follow the examples in [the sample character file](https://github.com/darkewaffle/YAGDRSL/blob/main/samples/charactername.lua) to create your character file.
5. When created correctly the character file will then load your job files and you are up and running.


#### Full Documentation
- [Quick Primer on the Difference Between Gearswap and a Gearswap Library](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Gearswap%20and%20Libraries.md)
- [How YAGDRSL Builds a GearSet](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Sets.md)
- [How YAGDRSL Modifies a GearSet](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Mods.md)
- [Overriding Sets for Special Cases](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Overrides.md)
- [Trackers To Track the Trackables](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Trackers.md)
- [Gotchas and Limitations](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Gotchas%20and%20Limitations.md)

#### Getting Up and Running with YAGDRSL
- [Building Your CharacterName.lua File](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20Your%20Character%20File.md)
- [Building a Job Equipment File](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20a%20Job%20Equipment%20File.md)
- [Building a Job Logic File](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20a%20Job%20Logic%20File.md)

#### Technical Resources
- [Examples of Interactions Between sets, mods and overrides](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Equipment%20Examples.md)
- [YAGDRSL Flow Diagram](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Flow%20Diagram.md)
- [Gearset Paths for Actions](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/paths.md)
- [Complete List of Supported Gearset Paths](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/YAG_tables.txt)
- [YAGDRSL Commands](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/commands.md)
- [.lua User Functions](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/functions.md)
- [.lua Event Hooks](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/hooks.md)