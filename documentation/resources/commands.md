# Gearswap Commands In YAGDRSL

## cycle
```
gs c cycle
```
This command can be used to cycle a mod to the next value. CreateMod will automatically create a keybind to do this for you if you give it a key code.

## debug
```
gs c debug
```
Toggles the display of debug messages.

## demo
```
gs c demo (ability type) (ability name)
gs c demo ja Spectral Jig
gs c demo ws Rudra's Storm
gs c demo ma Burst II
---
gs c demo status (status name)
gs c demo status engaged
gs c demo status idle
```
Enables debug messages temporarily and then simulates the precast and midcast events and gearset creation steps for the ability with respect to all current mod, override and library settings. The debug messages will be printed to the chat log and will detail how the gearset was assembled and what sets became part of it. Also useful to test abilities that may just have long cooldowns or high resource costs.

## orders
```
gs c orders
```
Displays a debugging window that will show the mods that are part of each mod order and the current value of each one.

## ring
```
gs c ring (xp, cp) (left, right)
gs c ring cp
```
Attempts to find and use a CP or XP ring depending on the parameter provided. It will use rings in order of largest to smallest bonus.

## showlog
```
gs c showlog
```
Writes a timestamped log of the last action (precast to aftercast) to the chat log. This can be useful for testing if something is taking too long to compute or it's also just neat to see an approximation of how long each step of the process can take (hint: the longest part is the animations).

## tables
```
gs c tables
```
Writes YAG_tables.txt to Windower\addons\GearSwap\data\export which contains a list of every expected/supported status, item, ability, magic and weaponskill path. Useful for reference or to just copy and paste long paths. Note that current job's gearset definitions may interfere with the results. 

## update
```
gs c update
```
Forces Gearswap to update the equipment set for your current status.

## validate
```
gs c validate (alljobs) (noweapons)
gs c validate
gs c validate alljobs
gs c validate alljobs noweapons
```
Reads the gear in your currently defined gearsets and compares it to the gear in your inventory and wardrobe 1 - 8. Prints out results to the chat log identifying invalid gearset definitions, items in gearsets that you do not possess and items in inventory or wardrobe that are not used in a gearset. Alljobs will tell YAGDRSL to load each equipment file defined in JobControls and include the items in it in the final evaluation. Noweapons will exclude weapons from the 'items in inventory but not in gearsets' results since many players do not put weapons into gearsets.