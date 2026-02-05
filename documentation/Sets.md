# How YAGDRSL Builds a GearSet
Most players are probably familiar with the process of defining gearsets that correspond to game states and actions. When you're about to cast a spell then a Gearswap library will look for something like sets.precast.magic to find your fastcast gear, then when that spell reaches midcast it uses something like sets.midcast.magic.cure to find your midcast cure potency set and then when the cast is completed your sets.status.idle or sets.status.engaged gearset will be equipped. YAGDRSL generally follows the same path but how it gets there is a bit different.

## Sets are additive, mappings are intuitive

In YAGDRSL spells and actions have been mapped to a gearset 'path' that will hopefully be intuitive and efficient so you don't have to maintain so many overlapping gearsets. Further, when a gearset is being built the gear found in each step of the path contributes to the final set. To see how this plays out let's take a look at some weapon skills.

For weapon skills the full path is made out of the following elements.

| Root Table Name | sets |
| --- | --- |
| Action Event | precast |
| Action Category | Weaponskills are simply abbreviated as 'ws' |

So far this probably looks very familiar - we have sets.precast.ws. But now we go further.
| Weapon Range | Weapon skills are divided into 'melee' and 'distant' |
| --- | --- |
| Damage Type | Weapon skills are then further divided into 'physical', 'magical' or 'hybrid'. | 

So if we put it all together then the possible, complete paths are each of the following.
```
sets.precast.ws.melee.physical
sets.precast.ws.melee.magical
sets.precast.ws.melee.hybrid
sets.precast.ws.distant.physical*
sets.precast.ws.distant.magical*
sets.precast.ws.distant.hybrid*
```

[**If you're curious why we call it 'distant', click here.*](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Gotchas%20and%20Limitations.md#naming-mods-and-overrides)

This probably looks a bit wordy - but you only need to define the ones you want to use. And because the path steps are all added together, you may end up defining fewer or smaller sets than you think. Why? Let's look at all the steps the path takes for a weapon skill like Evisceration.

Evisceration's final path would be sets.precast.ws.melee.physical. But it's not going to equip just what it finds in that set - instead the final set would actually be the result of combining the sets found in each of the following tables.
```
sets
sets.precast
sets.precast.ws
sets.precast.ws.melee
sets.precast.ws.melee.physical
```
This means that your sets can look something like this where you can separately define gear that would apply to all weaponskills in sets.precast.ws and gear that would only apply to melee, physical weapon skills in sets.precast.ws.melee.physical. 
```
sets.precast.ws = {neck="Fotia Gorget", body="Scorpion Harness", waist="Fotia Belt"}
sets.precast.ws.melee.physical = {head="Nyame Helm", body="Nyame Mail"}
```
So by logically placing gear where it would be appropriate to use for all actions with the characteristics described by the path we've now defined not just our Evisceration set - but also a set for every melee, physical weapon skill. They would all equip Fotia Gorget, Fotia Belt, Nyame Helm and Nyame Mail. Additionally, take note that the sets will be combined from 'least specific' to 'most specific' so to speak - so Scorpion Harness would be overwritten by Nyame Mail.

Now that lets us define a bunch of gear that is the same for our weapon skills as a starting point - but what about the gear that should be different? That actually works pretty similar to other libraries in that you can define a set specific to Evisceration with +Crit gear that would only apply to Evisceration. However the way that it finds it is again a little different. Instead of only looking for sets.precast.ws.melee.physical.Evisceration YAGDRSL will instead search through those same paths from before but this time it will look for any sets (or rather, table keys) named Evisceration.
```
sets.Evisceration
sets.precast.Evisceration
sets.precast.ws.Evisceration
sets.precast.ws.melee.Evisceration
sets.precast.ws.melee.physical.Evisceration
```
All of these are valid. I can't think of any reason to actually define multiple sets for an individual skill but it does mean you can place it wherever you think is convenient or logical. And once again, any Evisceration-specific sets that it finds will be combined with the sets that were found originally.

All told if our sets were defined like this and we used Evisceration...
```
sets.precast.ws = {neck="Fotia Gorget", body="Scorpion Harness", waist="Fotia Belt"}
sets.precast.ws.melee.physical = {head="Nyame Helm", body="Nyame Mail"}
sets.precast.Evisceration {head="Gleti's Helm", feet="Gleti's Boots"}
```
Then our final set would be **{head="Gleti's Helm", body="Nyame Mail", neck="Fotia Gorget", waist="Fotia Belt", feet="Gleti's Boots"}**.

But that's not actually our final set. Because sometimes we want to modify it. How? [How else - with mods!](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Mods.md)