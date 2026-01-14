# How To Create and Adjust Mods

This information applies equally to both your character file and job logic files. The functions can be used in either location to build a baseline of mods that apply to all jobs or to build a very specific set of mods to suit a specific job.

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

## SetModOrders
These functions allow you to control which mods apply to which events and actions. SetModOrder will overwrite any mod order that may already exist while AppendModOrder will simply insert a ModName at the end of an existing list. Using these together you can often set your mod orders in the character file and then simply set or append to them in your job logic files as needed when you create new mods. 

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

## AppendModOrders
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