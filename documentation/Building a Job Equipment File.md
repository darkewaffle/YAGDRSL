# Good News - It Ain't That Different!

Building your equipment sets ultimately works the same way in YAGDRSL as it does in most other GearSwap libraries. It's still just a matter of defining a table name and putting the names of your items into the slots. The primary difference with YAGDRSL is most likely going to be in where you put your sets and aligning them with the set, mod and override paths that YAGDRSL has defined for each action.

Before moving on click here for the [path definitions of each action](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/paths.md) or [a full list of all the paths that YAGDRSL can recognize.](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/YAG_tables.txt)

So how do we make these paths work for us? In general I think there are two ideas you should try to follow.

1. Try to define as much gear in the least specific place possible. 
2. Try to avoid repeating yourself.

What does doing that look like? Let's work on some weaponskill sets and think about where it makes sense to put the gear. As a starting point YAGDRSL will look for these sets when building the initial weaponskill set.

```
sets
sets.precast
sets.precast.ws
sets.precast.ws.distant
sets.precast.ws.distant.hybrid
sets.precast.ws.distant.magical
sets.precast.ws.distant.physical
sets.precast.ws.melee
sets.precast.ws.melee.hybrid
sets.precast.ws.melee.magical
sets.precast.ws.melee.physical
```

Suppose we want to define our sets for Evisceration, Shark Bite, Rudra's Storm and Aeolian Edge. First things first let's ignore the paths we dont need. We know we're only dealing with melee weapon skills and while there may sometimes be reason to define mods or overrides directly in the root table or the event table that typically is not the case when building our base sets. So that means we probably only need to think about filling out these sets.

```
sets.precast.ws
sets.precast.ws.melee
sets.precast.ws.melee.hybrid
sets.precast.ws.melee.magical
sets.precast.ws.melee.physical
```

sets.precast.ws is gear that will apply to all weaponskills 