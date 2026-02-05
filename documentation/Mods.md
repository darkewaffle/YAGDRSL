# How YAGDRSL Modifies a Gearset

Most libraries have some kind of support for variations of a gearset. Maybe you've seen sets.precast.ws.acc or sets.accuracy or sets.status.engaged.lowacc and sets.status.engaged.DT. These all represent variations of a base set that is conditionally selected when we want to change our gear for certain situations. Maybe you want to equip gear with more accuracy, more magic evasion, Treasure Hunter etc. YAGDRSL supports these kinds of changes through 'mods'. 

## From modes, mods. From mods, flexibility. In flexibility, control.

First, what is a mod? Well, it exists in three parts really.

### The Mod Itself
First is the mod itself. You might recognize this as a 'mode' from the 'Mote-libs' collection of files that have been commonly used by the Gearswap community for years now. Other libraries may refer to these as modes, states, toggles, etc. In .lua the 'raw' form of a mod looks like this. 
```
offense_mode = M{"off", "Accuracy", "STP", ["description"]="Offense Mode"}
```

"offense_mode" would be the name of the mod used in code, "off" is the default value when the mod is inactive, 'Accuracy' and 'STP' are the active options for the mode and the description is a label that can be displayed in game to help inform you of which mods are active and in what way. The process of changing a mod value is essentially the same as other libraries - we can create a keybind that will cycle through each of the mod values to set the next one in the sequence as 'active'.


### Mod Sets
Second are the mod *sets*. These are defined just like normal gearsets except they reside in a different table and YAGDRSL will only look for them using the path defined for the current action plus the values of active mods. So let's briefly revisit Evisceration from the previous section. We know that the makeup of Evisceration's full path is this: 
```
sets
sets.precast
sets.precast.ws
sets.precast.ws.melee
sets.precast.ws.melee.physical
```
And YAGDRSL will look for mods in the exact same way. Except instead of the sets table we're going to be using the mods table.
```
mods
mods.precast
mods.precast.ws
mods.precast.ws.melee
mods.precast.ws.melee.physical
```
And further - mods must match the active mod value. So if the active value of our "Offense Mode" is "Accuracy" then that means YAGDRSL is going to look specifically for only the following sets.
```
mods.Accuracy
mods.precast.Accuracy
mods.precast.ws.Accuracy
mods.precast.ws.melee.Accuracy
mods.precast.ws.melee.physical.Accuracy
```
And then, of course, that mod set will be added to the base set so that it now includes the accuracy gear from the mod set.

### Mod Orders
But how do we tell YAGDRSL which mods we want to apply? And when? For that we have mod *orders*. These are simply lists of mod names that we use to define which mods apply to which actions and events as well as the order that the mods should be applied. Mod orders can be defined by function calls starting with SetModOrder___. There is a SetModOrder___ function for each different combination of event and action.
```
SetModOrderPrecastWSOffense("Offense")
SetModOrderEngagedOffense  ("Offense", "TH")
SetModOrderEngagedDefense  ("PhysicalDefense", "MagicalDefense")
```
So in this example the value of the "Offense" mod would be used to find mods both during the precast of a Weapon Skill and when you are engaged. But if your Treasure Hunter mod is also active then it will only be used to modify your engaged set. Likewise if "PhysicalDefense" or "MagicalDefense" are active then they too will only modify your engaged set.

### Mod Phases
I know I said there are three parts to mods and that's true - but there's one more important idea too. And that is mod *phases*. You'll notice that the previous example had a function called SetModOrderEngagedOffense and SetModOrderEngagedDefense. How are those different? Well they let you separate mods into those that affect your defensive stats and those that affect your everything else. It isn't strictly offense, that's just the simplest name to give it. The reason we do this is so that you can have active Offense mods and active Defense mods simultaneously - and easily swap between the two. By default Defense mods are given priority because the offense mods are combined with the base set first and then the defense mods are applied second. But you can also control that using a special mod built directly into YAGDRSL called "mod_prioritize_defense" (you can give it a more friendly description label).

mod_prioritize_defense contains only two values - true and false. When true that means defense has priority and it is applied second, potentially overwriting gear from offense mods. If it's false then the opposite happens, defense *does not* have priority and so defense mods are applied first and then offense mods are applied to potentially overwrite defense mod gear. And you can easily keybind to change your Defense Priority just like any other mod - so you can swap from just the right offense set for your situation to just the right defense set when damage is incoming or when new enemies are about to spawn with a single button press. You don't have to turn off or toggle your mods at all. You just tell YAGDRSL which ones get priority.

However, there are some things that perhaps don't belong in a mod. Or maybe it's just too specific to be worth the trouble - you don't want to have to change your mod loadout and gearsets just for one uncommon situation. Maybe you need a very particular set of gear for a specific boss, maybe you want to make sure your Capacity Mantle is always equipped when you're in a CP party, maybe you want your BLU artifact gloves always equipped when learning spells. What do we do about these unusual scenarios? [We make an override.](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Overrides.md)