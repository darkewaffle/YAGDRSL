# YAGDRSL - Yet Another God Damn geaR Swap Library

Summary: YAGDRSL is a gearswap library that is intended to make your gearswap files smaller and easier to manage through intuitive ability mapping and by building sets that are added together through individual steps rather than asking that users define entire sets for every scenario. It should also give users the means to control their gear easily and in detail with a reasonable amount of setup and not too many button presses. There are numerous functions designed specifically for users to help them create Gearswap behavior that does what they want and makes sense for them. There are also many exposed library settings that let them tune what the library does and the feedback it provides in game.

However, YAGDRSL is not intended to provide any automatic 'reactions' to game events. It will not automatically use Holy Water when you are afflicted with Doom, it will not use Presto before a Step, it will not remove Berserk if you're receiving damage, etc. There are hooks in each major event where you could potentially define this behavior. But they will not be part of the library.



- Brand new to GearSwap? [Let's start from the beginning.](https://github.com/darkewaffle/YAGDRSL/blob/main/2_GEARSWAP_BASICS.md)
- Somewhat familiar with GearSwap and interested in YAGDRSL? [Let's look at how it works.](https://github.com/darkewaffle/YAGDRSL/blob/main/3_YAGDRSL_FLOW.md)
- Are you a Gearswap pro? Here's what [might be new to you about YAGDRSL](https://github.com/darkewaffle/YAGDRSL/blob/main/3_YAGDRSL_FLOW.md) and here's [some sample files to peruse.](https://github.com/darkewaffle/YAGDRSL/tree/main/samples)

### Quick Start Guide
1. Download the YAG_include.lua file and the entire YAGDRSL folder.
2. Place them in your C:\Program Files (x86)\Windower\addons\GearSwap\libs folder
3. In the libs folder create a .lua file with the same name as your character. (eg: If your character is John then create John.lua).
4. Follow the examples in [the sample character file](https://github.com/darkewaffle/YAGDRSL/blob/main/3_YAGDRSL_FLOW.md) to create your character file.
5. When created correctly the character file will then load your job files and you are up and running.

### Technical Resources
- YAGDRSL Flow
- In Game Commands
- Useful .lua Functions
- Event Hooks
- Gearset Table Structure
- Gearset Paths for Actions
- Gotchas and Limitations To Be Mindful Of