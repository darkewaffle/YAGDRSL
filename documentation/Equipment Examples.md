# Everything Is Illuminated
Here are some sample gearsets and scenarios to try to illustrate the full process of composing a gearset from sets, mods and overrides.

```
sets.engaged = {body="Scorpion Harness"}
sets.precast.magic = {neck="Voltsurge Torque"}
sets.precast.ws = {neck="Fotia Gorget"}
sets.precast.ws.melee.physical = {ring1="Rajas Ring"}
sets.precast.ws.melee.magical = {ear1="Friomisi Earring"}

mods.precast.Acc = {neck="Peacock Charm"}
mods.precast.ws.melee.Acc = {ring1="Sniper's Ring"}
mods.DT = {ear1="Alabaster Earring", ring1="Defending Ring"}
mods.engaged.DT = {back="Mollusca Mantle", ring2="Murky Ring"}
mods.engaged.Acc = {neck="Peacock Charm"}

overrides["+CP"] = {back="Aptitude Mantle"}
```

Example 1: Evisceration
Mods active = none
```
sets.precast.ws + sets.precast.ws.melee.physical = 
{neck="Fotia Gorget", ring1="Rajas Ring"}
```

Example 2: Evisceration
Mods active: "Acc"
```
sets.precast.ws + sets.precast.ws.melee.physical + mods.precast.Acc + mods.precast.ws.melee.Acc = 
{neck="Peacock Charm", ring1="Sniper's Ring"}
```

Example 3: Cure
Mods active: "Acc"
```
sets.precast.magic + mods.precast.Acc = 
{neck="Peacock Charm"}
```
*This illustrates something you should not do / should be careful about. In this case mods.precast.Acc is in the wrong place as it is defined to apply to **all** precast actions, not just a specific category. As such it overwrites the Voltsurge Torque, which is useful for precast magic, with a Peacock Charm that is useless for precast magic.*


Example 4: Evisceration
Mods active: "Acc", "DT"
Defense Priority = true
```
sets.precast.ws + sets.precast.ws.melee.physical + mods.precast.Acc + mods.precast.ws.melee.Acc + mods.DT = 
{ear1="Alabaster Earring", neck="Peacock Charm", ring1="Defending Ring"}
```

Example 5: Evisceration
Mods active: "Acc", "DT"
Defense Priority = false
```
sets.precast.ws + sets.precast.ws.melee.physical + mods.DT + mods.precast.Acc + mods.precast.ws.melee.Acc = 
{ear1="Alabaster Earring", neck="Peacock Charm", ring1="Sniper's Ring"}
```

Example 6: Idle Set
Mods active: "Acc", "DT"
Defense Priority = true
```
(there are no idle sets defined) + mods.DT = 
{ear1="Alabaster Earring", ring1="Defending Ring"}
```

Example 7: Engaged Set
Mods active: "Acc", "DT"
Defense Priority = true
Override value = "+CP"
```
sets.engaged + mods.engaged.Acc + mods.DT + mods.engaged.DT + overrides["+CP"] = 
{body="Scorpion Harness", neck="Peacock Charm", ear1="Alabaster Earring", ring1="Defending Ring", ring2="Murky Ring", back="Aptitude Mantle"}
```