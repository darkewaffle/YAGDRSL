# How To Create and Adjust Mods

This information applies equally to both your character file and job logic files. The processes and functions described here can be used in either location to build a baseline of mods that apply to all jobs or to build a very specific set of mods to suit a specific job. This section will include a written guide on how to create and order your mods as well as a full list of all the functions that are available to configure and manipulate mods.

## Mod Making Guide

### Creating a Mod
Mods represent a variation of a gearset that contains more of a specific stat - more accuracy, more damage reduction, more magic evasion, etc. But you can also define them for more generic purposes like an idle mod to equip your crafting or fishing gear. In order to make a mod we'll want to use the library's CreateMod function. CreateMod is a function that accepts four core parameters and then a variable number of parameters that represent the values that the mod can have.

```
function CreateMod(ModName, ModDescription, ControlPanelDisplayOrder, CycleKeyBind, ...)
```

| Parameter | Description |
| --- | --- |
| ModName | The name of the mod that will be used 'in code' to identify it. This should be unique to each mod. |
| ModDescription | The description of the mod that will show up in the ControlPanel. You can make this whatever makes sense to you. |
| ControlPanelDisplayOrder | This is a numeric value that controls the order (top to bottom) that the mod will be displayed in the Control Panel. If <= 0 then it will not be displayed. |
| CycleKeyBind | If this value is input then YAGDRSL will attempt to use it to keybind a cycle command for the mod. [Click here for resources on how to format a key for binding.](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/YAG%20Tips%20and%20Tricks.md#keybinds)|
| ... | These will be the mod values. They should be wrapped with quotation marks and separated by commas. While not required it is recommended that your mod values be unique across all mods in use by the job as well. |

Here's an example of how it would look in practice.
```
CreateMod("Offense", "F9 Offense", 1, "f9", "Acc", "STP", "Multi", "Subtle")
```

This will create a mod named "Offense". It will appear in the control panel at or near the top and cycling the mod will be automatically bound to the key F9. Additionally in the control panel the description will be "F9 Offense". You can make the description whatever you like but including the keybind can be a handy reminder. Then you would just repeat the process for each mod you want to be able to control. It could be as simple as just having an "Offense" mod and "Defense" mod or as intricate as Offense, Physical Defense, Magical Defense, Treasure Hunter, Magic Burst, Cure Mode, etc. It's really up to you - although starting with fewer mods and keeping them simple is probably going to be the best place to start.


## Ordering Your Mods

Once you have made a few mods they will need to be added to mod orders. This tells YAGDRSL when to look for each mod and the order that they will be applied to the gearset. Defining your Mod Orders is done with a simple function call to either Set or Append a mod order. You can find a [full list of all of the available functions here](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/functions.md#setmodorders). Keep in mind you do not have to use all of them - you only need to use the ones that correspond to where you want to use mods.

SetModOrder functions look like this and only need parameters that are mod names. These names should match the names you assign to mods with CreateMod. SetModOrder will overwrite any mods that have been previously assigned to the order and create the order anew.

```
function SetModOrderPrecastWSOffense(...)
```

To assign mods to a mod order you would simply call the function with the mod names in it.

```
SetModOrderPrecastWSOffense("Offense")
SetModOrderEngagedOffense("Offense", "TreasureHunter")
SetModOrderEngagedDefense("Physical Defense", "Magical Defense")
```

AppendModOrder works very similarly to SetModOrder except it will only accept a single ModName parameter and rather than overwriting the Mod Order it will simply place the mod at the end of the order. This means the appended mod will be the last mod that is evaluated and it will have high priority when added to the gearset.

```
function AppendModOrderPrecastWSOffense(ModName)
AppendModOrderPrecastWSOffense("CustomOffense")
```

Once you've put the mods into the mod orders YAGDRSL will then use them, when active and when appropriate based on the action and event, to identify mod sets and apply them when building your gearset.

## Configuring Library Mods and Override
### Library Mods
YAGDRSL also includes a few built-in mods that you do not need to create but you can configure.
```
function ConfigureDefensePriority(ModDescription, ControlPanelDisplayOrder, ModKeyBind)
function ConfigureWeaponLock(ModDescription, ControlPanelDisplayOrder, ModKeyBind)
```
First there are two mods that don't affect your gear directly like other mods but instead control how YAGDRSL operates. Defense Priority is the mod that controls whether your defense or offense mods are applied first - meaning it controls which ones can potentially overwrite the other. Weapon Lock is a mod that tells YAGDRSL which weapon slots you want to be enabled or disabled. You do not need to input the values of these mods but you can still control their description, decide how they should appear in the control panel and give them a keybind.

### Override

Then we have the override configuration. If you're not sure what the override is [then check out the full documentation to find out what it is and how it's used in YAGDRSL.](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Overrides.md).

Since the override is built into the library you don't need to create it. But if you want to use it then you will need to populate it with values. You can do this with the ConfigureOverride function which works very similar to the previous Configure functions.

```
function ConfigureOverride(OverrideDescription, ControlPanelDisplayOrder, OverrideKeyBind, ...)
```

The only difference is ConfigureOverride accepts additional parameters at the end which will become the values that the override can have. Here's an example.

```
ConfigureOverride("MyOverrides", 10, "f10", "CP", "BluLearn", "Vagary")
```

Once you've given values to the override it essentially works like any other mod. You can just cycle it to a value and then that value will be used to find override gearsets.


# Functions

## Functions for Custom Mods
These functions allow to to build and control your own custom mod definitions.

### CreateMod
```
function CreateMod(ModName, ModDescription, ControlPanelDisplayOrder, CycleKeyBind, ...)
CreateMod("MagicBurst", "MB Mode", 2, "f9", "MB High", "MB Low")
```
CreateMod does exactly what it says. It creates a mod and accepts parameters to define all the important attributes of it.

### DeleteMod
```
function DeleteMod(ModName)
DeleteMod("MagicBurst")
```
Likewise DeleteMod exactly what it says. Simply give it the name of a mod and that mod will be deleted. This can be useful if you are customizing your mods in a job file and want to delete a mod you created in the character file that doesn't apply to the job.

### AssignModOptions
```
function AssignModOptions(ModName, ...)
AssignModOptions("Offense", "Acc", "Multi", "STP", "Subtle")
```
AssignModOptions is used to alter the options that a mod contains. This only changes the options, all the other attributes of a mod remain intact. You can use this to redefine the options for a mod that is created in the character file in order to provide options that are tailored to a specific job. For instance if your default "Offense" mod contains "Accuracy" and "Multiattack" then perhaps a mage job would rather have options of "MagicAccuracy" and "MagicDamage". Or you could simply create a second mod to control the magic offense options, both are valid.

### SetModValue
```
function SetModValue(ModName, Value)
SetModValue("MagicBurst", "MB Low")
```
SetModValue allows you to set the current value of a mod. This may be useful if you want to define a specific default active value for a mod or change a mod value within custom code.

## Functions for Library Mods
These functions allow you to control the mods that are built-in to YAGDRSL. They work very similarly to CreateMod except the mods already all exist (and most already have predefined values) so you just need to handle their description, control panel display and keybind. These are also all optional. If you do not configure them they will work silently in the background or have no impact. 

### ConfigureDefensePriority
```
function ConfigureDefensePriority(ModDescription, ControlPanelDisplayOrder, ModKeyBind)
ConfigureDefensePriority("Def Prio", 15, "end")
```

### ConfigureOverride
```
function ConfigureOverride(OverrideDescription, ControlPanelDisplayOrder, OverrideKeyBind, ...)
ConfigureOverride("My Overrides", 10, "f10", "CP", "BluLearn", "Vagary")
```

### ConfigureWeaponLock
```
function ConfigureWeaponLock(ModDescription, ControlPanelDisplayOrder, ModKeyBind)
ConfigureWeaponLock("LockWeps", 20, "~end")
```

## Functions for Mod Orders
These functions allow you to control which mods apply to which events and actions. SetModOrder will overwrite any mod order that may already exist while AppendModOrder will simply insert a ModName at the end of an existing list. Using these together you can often set your mod orders in the character file and then simply set or append to them in your job logic files as needed when you create new mods.

### SetModOrders
```
function SetModOrderPrecastJAOffense(...)
function SetModOrderPrecastJADefense(...)
function SetModOrderPrecastMagicOffense(...)
function SetModOrderPrecastMagicDefense(...)
function SetModOrderPrecastRAOffense(...)
function SetModOrderPrecastRADefense(...)
function SetModOrderPrecastWSOffense(...)
function SetModOrderPrecastWSDefense(...)

function SetModOrderMidcastJAOffense(...)
function SetModOrderMidcastJADefense(...)
function SetModOrderMidcastMagicOffense(...)
function SetModOrderMidcastMagicDefense(...)
function SetModOrderMidcastRAOffense(...)
function SetModOrderMidcastRADefense(...)
function SetModOrderMidcastWSOffense(...)
function SetModOrderMidcastWSDefense(...)

function SetModOrderEngagedOffense(...)
function SetModOrderEngagedDefense(...)
function SetModOrderIdleOffense(...)
function SetModOrderIdleDefense(...)
function SetModOrderRestingOffense(...)
function SetModOrderRestingDefense(...)

SetModOrderEngagedOffense("OffenseMode", "TreasureHunter")
```

### AppendModOrders
```
function AppendModOrderPrecastJAOffense(ModName)
function AppendModOrderPrecastJADefense(ModName)
function AppendModOrderPrecastMagicOffense(ModName)
function AppendModOrderPrecastMagicDefense(ModName)
function AppendModOrderPrecastRAOffense(ModName)
function AppendModOrderPrecastRADefense(ModName)
function AppendModOrderPrecastWSOffense(ModName)
function AppendModOrderPrecastWSDefense(ModName)

function AppendModOrderMidcastJAOffense(ModName)
function AppendModOrderMidcastJADefense(ModName)
function AppendModOrderMidcastMagicOffense(ModName)
function AppendModOrderMidcastMagicDefense(ModName)
function AppendModOrderMidcastRAOffense(ModName)
function AppendModOrderMidcastRADefense(ModName)
function AppendModOrderMidcastWSOffense(ModName)
function AppendModOrderMidcastWSDefense(ModName)

function AppendModOrderEngagedOffense(ModName)
function AppendModOrderEngagedDefense(ModName)
function AppendModOrderIdleOffense(ModName)
function AppendModOrderIdleDefense(ModName)
function AppendModOrderRestingOffense(ModName)
function AppendModOrderRestingDefense(ModName)

AppendModOrderEngagedOffense("CustomOffense")
```