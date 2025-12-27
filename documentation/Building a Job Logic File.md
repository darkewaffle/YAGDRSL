# Building a Job Logic File
The purpose of a job logic file is to have a place where you can keep all of your custom code for each job. However even though we're calling it 'custom code' it can actually be quite simple. YAGDRSL has a number of functions available to you that will do a lot of the work to setup mods, bind keys, track buffs, automatically cancel buffs when using an action and more.

*[Click here for a full list of the user-facing functions](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/functions.md) or [click here for some example job files to see how they can be setup](https://github.com/darkewaffle/YAGDRSL/tree/main/samples/jobfiles) if you'd prefer to learn by looking through them.*

So what should we put in the logic file? The most useful parts are probably all related to setting up your mods so let's start there. [*If you're not sure what 'mods' means then check out the full documentation on what a mod is and how it's used in YAGDRSL.*](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Mods.md)

## Creating a Mod
First we need to actually make our mods. Usually these represent a variation of a gearset that contains more of a specific stat - more accuracy, more damage reduction, more magic evasion, etc. But you can also define them for more generic uses like an idle mod to equip your crafting or fishing gear. In order to make a mod we'll want to use the library's CreateMod function. CreateMod is a function that accepts four core parameters and then a variable number of parameters that represent the values that the mod can have.

```
function CreateMod(ModName, ModDescription, ControlPanelDisplay, CycleKeyBind, ...)
```

| Parameter | Description |
| --- | --- |
| ModName | The name of the mod that will be used 'in code' to identify it. This should be unique to each mod. |
| ModDescription | The description of the mod that will show up in the ControlPanel. You can make this whatever makes sense to you. |
| ControlPanelDisplay | This is a true or false value that controls whether or not the mod will be displayed in the Control Panel. |
| CycleKeyBind | If this value is input then YAGDRSL will attempt to use it to keybind a cycle command for the mod. [Click here for resources on how to format a key for binding.](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/YAG%20Tips%20and%20Tricks.md#keybinds)|
| ... | These will be the mod values. They should be wrapped with quotation marks and separated by strings. While not required it is recommended that your mod values be unique across all mods in use by the job as well. |

Here's an example of how it would look in practice.
```
CreateMod("Offense", "F9 Offense", true, "f9", "Acc", "STP", "Multi", "Subtle")
```

This will create a mod named "Offense". It will appear in the control panel and cycling the mod will be automatically bound to the key F9. Additionally in the control panel the description will be "F9 Offense". You can make the description whatever you like but including the keybind can be a handy reminder. Then you would just repeat the process for each mod you want to be able to control. It could be as simple as just having an "Offense" mod and "Defense" mod or as intricate as Offense, Physical Defense, Magical Defense, Treasure Hunter, Magic Burst, Cure Mode, etc. It's really up to you - although starting with fewer mods and keeping them simple is probably going to be the best place to start.

## Ordering Your Mods

Once you have made a few mods they will need to be added to mod orders. This tells YAGDRSL when to look for each mod and the order that they will be applied to the gearset. Creating your Mod Orders is also done with a simple function call. You can find a [full list of all of the available SetModOrder functions here](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/functions.md#setmodorders). Keep in mind you do not have to use all of them - you only need to use the ones that correspond to where you want to use mods.

SetModOrder functions look like this and only need parameters that are mod names. These names should match the names you assign to mods with CreateMod.

```
function SetModOrderPrecastWSOffense(...)
```

To assign mods to a mod order you would simply call the function with the mod names in it.

```
SetModOrderPrecastWSOffense("Offense")
SetModOrderEngagedOffense("Offense", "TreasureHunter")
SetModOrderEngagedDefense("Physical Defense", "Magical Defense")
```

Once you've put the mods in the mod order YAGDRSL will use them, when active and when appropriate based on the action and event, to identify mod sets and apply them when building your gearset. That's all there is to it.

## Configuring Library Mods and Override
### Library Mods
A few other functions are worth mentioning as inclusions in your job logic file. These are primarily related to adjusting mods that are built-in to YAGDRSL. So you don't need to create them but you are able to configure them.
```
function ConfigureDefensePriority(ModDescription, ControlPanelDisplay, ModKeyBind)
function ConfigureWeaponLock(ModDescription, ControlPanelDisplay, ModKeyBind)
```
First there are two mods that don't affect your gear directly like other mods but instead control how YAGDRSL operates. Defense Priority is the mod that controls whether your defense or offense mods are applied first - meaning it controls which ones can potentially overwrite the other. Weapon Lock is a mod that tells YAGDRSL which weapon slots you want to be enabled or disabled. You do not need to input the values of these mods but you can still control their description, decide if they should appear in the control panel and give them a keybind.

### Override

Then we have the override configuration. If you're not sure what the override is [then check out the full documentation to find out what it is and how it's used in YAGDRSL.](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Overrides.md).

Since the override is built into the library you don't need to create it. But if you want to use it then you will need to populate it with values. You can do this with the ConfigureOverride function which works very similar to the previous Configure functions.

```
function ConfigureOverride(OverrideDescription, ControlPanelDisplay, OverrideKeyBind, ...)
```

The only difference is ConfigureOverride accepts additional parameters at the end which will become the values that the override can have. Here's an example.

```
ConfigureOverride("My Overrides", true, "f10", "CP", "BluLearn", "Vagary")
```

Once you've given values to the override it essentially works like any other mod. You can just cycle it to a value and then that value will be used to find override gearsets.

## Trackers
Trackers are very similar to mods in terms of how they affect gearsets but the user doesn't need to interact with them directly. You can't cycle a tracker or set it's value. Instead it will track something like a buff or a pet name and automatically update the value it contains. Trackers belong in a job logic file but if you want to find out what can be tracked and how to enable them then [refer to the Tracker documentation](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Trackers.md).

---

And with that we've covered the basics of what can and should be in your job logic file. However there are a lot of other useful things you can do here if you decide to dive further into the library or .lua. If you would like to see some complete example files or get some ideas about what more advanced implementation can do then [have a look at the Making a Job Logic File That's Fancy documentation](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20a%20Job%20Logic%20File%20That's%20Fancy.md) or [check out some of the library's sample files](https://github.com/darkewaffle/YAGDRSL/tree/main/samples/jobfiles).