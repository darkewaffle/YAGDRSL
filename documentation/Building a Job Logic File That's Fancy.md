# Building a Job Logic File That's Fancy
This guide will touch on some of the ways that you can use YAGDRSL (and just .lua in general) to implement more advanced features in your job logic file. It will not be as in-depth but instead just try to touch on some more functions you can consider using and ideas about how they could be useful.


## SetAutoCancelBuff & AutoCancelDelayAmount
```
function SetAutoCancelBuff(SpellsBeingCast, BuffsToCancel)
SetAutoCancelBuff({"Curing Waltz", "Healing Waltz}, {"Saber Dance"})

AutoCancelDelayAmount = .2
```

This function will define a set of actions and a set of buffs that should be canceled each time one of the actions is performed. Note that both SpellsBeingCast and BuffsToCancel should be tables (surrounded by {braces}) and will only accept spell names and buff names that are wrapped with quotation marks and separated by commas.

In order to give the cancel command time to be completed the action will be delayed by AutoCancelDelayAmount. AutoCancelDelayAmount is a library setting you can customize. The most common use for this is probably to automatically cancel effects like Sneak, Invisible or Utsusemi when you are refreshing them.


## SetModValue
```
function SetModValue(ModName, Value)
SetModValue("MagicBurst", "MB Low")
```
This is a pretty simple one that you probably won't need to use much. However if you create a mod where you want the default value to be active rather than "off" then you can place a SetModValue call after CreateMod to automatically change the value each time the file is loaded. You can find some examples of how this might be useful in the (intermediate paladin file)[https://github.com/darkewaffle/YAGDRSL/blob/main/samples/jobfiles/intermediate_pld_logic.lua] where it's preferable for some of the Paladin's defensive mods to be on by default. 


## Hooks
All the major events in YAGDRSL (including those are are custom to YAGDRSL and those that are standard in Gearswap) include Hook functions that can be re-defined by the user. You can think of these as 'virtual' functions in other programming languages as they are fully implemented but currently do nothing aside from 'be called'. You can find a (list of the available hooks here)[https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/hooks.md] and some examples about how they can be used in the (advanced dancer logic file)[https://github.com/darkewaffle/YAGDRSL/blob/main/samples/jobfiles/advanced_dnc_logic.lua]. If you're using these be mindful that you pay attention to the return values that are expected from them - most of them do not have all but any of the gearset customization hooks should return a gearset (and you should *not* call equip() in them).


## Your Own Custom Functions
Since your job (and equipment (and character)) files are just .lua files you can also write your own functions that do whatever you think might be useful. Calculate something, check if an item is equipped, send a message, etc. Once again you can find some examples of fully custom functions (which are then implemented in some YAGDRSL hooks) in the (advanced dancer logic file)[https://github.com/darkewaffle/YAGDRSL/blob/main/samples/jobfiles/advanced_dnc_logic.lua].