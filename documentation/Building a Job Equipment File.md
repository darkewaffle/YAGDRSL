# Good News - It Ain't That Different!

Building your equipment sets ultimately works the same way in YAGDRSL as it does in most other GearSwap libraries. It's still just a matter of defining a table name and putting the names of your items into the slots. The primary difference with YAGDRSL is most likely going to be in where you put your sets and aligning them with the set, mod and override paths that YAGDRSL has defined for each action.

*Before moving on click here for the [path definitions of each action](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/paths.md) or [a full list of all the 'base' paths that YAGDRSL can recognize](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/resources/YAG_tables.txt). Also [click here for a handful of complete job equipment and job logic files](https://github.com/darkewaffle/YAGDRSL/tree/main/samples/jobfiles) if you'd prefer to learn by looking through them.*

Additionally this document will make use of YAGDRSL collections. [Click here for an overview](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/YAG%20Tips%20and%20Tricks.md#collections) of what they are and which ones are available.

So how do we make these paths work for us? In general I think there are two ideas you should try to follow.

1. Try to define your most widely used (or most balanced) gear in the least specific place possible.
2. Try to avoid repeating yourself.

What does doing that look like? Let's work on some weaponskill sets and think about where it makes sense to put the gear. As a reminder YAGDRSL will look for these sets when building the initial weaponskill set.


## Defining Your Sets
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

Suppose we want to define our sets for Aeolian Edge, Evisceration, Rudra's Storm and Shark Bite. First things first let's ignore the paths we don't need. We know we're only dealing with melee weapon skills and we also know that there are no hybrid dagger weaponskills. And while there may sometimes be reason to define mods or overrides directly in the root table or the event table that typically is not the case when building sets. So that means we probably only need to think about filling out these sets.

```
sets.precast.ws
sets.precast.ws.melee
sets.precast.ws.melee.magical
sets.precast.ws.melee.physical
```

So sets.precast.ws represents gear that will apply to all weaponskills, sets.precast.ws.melee represents gear that will apply to all melee weaponskills and finally the other two represent melee weaponskills that deal magical and physical damage respectively. We'll start at the top and work our way down.

```
sets.precast.ws
```

Anything that would apply universally to weaponskills would be useful to put here - that way we don't have to put it into both our melee and magical weaponskill sets. So this might be a good place for the Fotia accessories and some +Weaponskill Damage gear.

```
InsertGearSet(sets.precast.ws,
	{
		head="Maculele Tiara +3",
		neck="Fotia Gorget",
		waist="Fotia Belt"
	})
```

InsertGearSet? What? Why? [Click here for an explanation](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Gotchas%20and%20Limitations.md#table-definitions-and-insertgearset), while it might seem a little unusual at first it will later save us from having to re-define gearset tables that are 'below' .ws.

Now what about sets.precast.ws.melee? Unless you're playing a job that uses ranged weaponskills sets.precast.ws and sets.precast.ws.melee are essentially interchangable - you could start your gear definitions in either spot. So I say we skip sets.precast.ws.melee since anything we would want to put there we already have in sets.precast.ws and there's no need to repeat it.

Now to the major fork - sets.precast.ws.melee.magical and sets.precast.ws.melee.physical. This is where we're going to define most items. And you don't have to use InsertGearSet here, although you certainly could, since there are no tables in the path 'below' .magical and .physical.

```
sets.precast.ws.melee.physical = 
	{
		ammo="Charis Feather",
		ear1="Sherida Earring",
		ear2="Maculele Earring +1",
		body="Horos Casaque +3",
		hands="Maculele Bangles +3",
		ring1="Ilabrat Ring",
		ring2="Lehko's Ring",
		back=capes.tp,
		legs="Maculele Tights +3",
		feet="Maculele Toe Shoes +3"
	}

sets.precast.ws.melee.magical = set_combine(collections.Nyame,
	{
		ammo="Oshasha's Treatise",
		ear1="Friomisi Earring",
		ear2="Moonshade Earring",
		body="Samnuha Coat",
		hands="Maxixi Bangles +4",
		ring1="Ilabrat Ring",
		ring2="Etana Ring",
		back=capes.wsd
	})
```

Take note that we did not include any head, neck or waist slots in the above sets. Since they're already defined in sets.precast.ws we don't need to include any gear for those slots *unless we want to change them*.

So now we have defined a starting point for Aeolian Edge, Evisceration, Rudra's Storm and Shark Bite. And as an added bonus we've actually defined a starting set for all of our dagger weaponskills. Even though we didn't set out to do anything with them we now have a complete set ready for Exenterator, Dancing Edge, Cyclone and all the others. Since they're all melee weapon skills that deal physical or magical damage they'll all follow the same paths to find a gearset. Now we just have to customize the gear that will be specific to certain weaponskills. In our case Evisceration probabably wants some +Crit gear while Shark Bite and Rudra's Storm probably want more focus on +Weaponskill Damage. Fortunately we can do that by just defining some additional sets using the name of each weaponskill.

```
sets.precast.ws.Evisceration = set_combine(collections.Gleti,
	{
		ear1="Odr Earring",
		ear2="Sherida Earring",
	})

sets.precast.ws["Rudra's Storm"] = 
	{
		ear1="Ishvara Earring",
		ear2="Moonshade Earring",
		neck="Republican Platinum Medal",
		waist="Sailfi Belt +1",
		legs="Horos Tights +3"
	}

	sets.precast.ws["Shark Bite"] = sets.precast.ws["Rudra's Storm"]
```

Note here how we're using set_combine to easily include Gleti's armor in the Evisceration set and defining the Shark Bite set as a copy of the Rudra's Storm set. These are techniques that you can use in any GearSwap to help reduce the amount of data you have to input and to reduce the effort required when you update sets.

Now we have fully defined sets for each weapon skill we set out to work on. Technically we didn't specify an Aeolian Edge set but that's fine, since Gust Slash and Cyclone are very uncommon weaponskills it's reasonable to treat sets.precast.ws.melee.magical as your Aeolian Edge set and just leave it at that.

Building sets for other actions can all follow a similar pattern that we worked through here. Start at the 'top' and work your way down through the path elements and define gear once it becomes applicable. It should become more intuitive over time and hopefully will save you time, effort and space (especially when dealing with magic and its many skills and groups of spells).

Now, let's work through building some mods for our weaponskills.

## Defining Your Mod Sets

Now might actually be a good time to start looking at [how to build a job logic file](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Building%20a%20Job%20Logic%20File.md) since that's where we'll be defining mods, their values and the orders they belong to. And we need to know the mod values we'll be using in order to correctly define our mod sets. So quick pause here, head over there and we'll continue when you return.

---

Back? Great, let's make some mod sets. Remember that mod sets have to start in the mods table but will otherwise follow the same path. So our weaponskill paths from before will now just look like this.

```
mods.precast.ws
mods.precast.ws.melee
mods.precast.ws.melee.magical
mods.precast.ws.melee.physical
```

Let's say we've defined our precast WS mods with just two mods, one in each phase.

```
SetModOrderPrecastWSOffense("Offense")
SetModOrderPrecastWSDefense("Defense")
```

This means that we should define a mod set *for each mod value that represents a variation that we want to apply to a weaponskill.* That does not mean you have to define a mod set for every value though. For instance "Offense" could contain "Accuracy", "Store TP", and "Multiattack". If you cycle "Offense" to "Accuracy" then you probably do want to equip additional accuracy for your weaponskills - so that should be a mod set. However "Store TP" and "Multiattack" we probably don't want to affect our weaponskills - so we don't need to define mod sets for those mod values (however, to be clear, you probably would want to define *engaged* mod sets for them). So how do we define a mod set for "Accuracy"? It's just a matter of naming it "Accuracy" so that it exactly matches the mod value.

```
	mods.precast.ws.Accuracy = 
		{
			body="Maxixi Casaque +4",
			hands="Maxixi Bangles +4",
			legs="Maculele Tights +3"
		}
```

That should provide a significant accuracy boost to our weapon skills. And anytime the Offense mod is set to "Accuracy" it will find this mod and apply it. However there is one more thing to consider. As is this mod would apply to all weaponskills - both physical and magical. However it doesn't provide much magic accuracy, primarily just physical accuracy. So it might be better to do it a different way.

```
	mods.precast.ws.physical.Accuracy =
		{
			body="Maxixi Casaque +4",
			hands="Maxixi Bangles +4",
			legs="Maculele Tights +3"
		}

	mods.precast.ws.magical.Accuracy =
		{
			neck="Null Loop",
			back="Null Shawl",
			belt="Null Belt"
		}
```

With this approach your accuracy mod set for physical weaponskills contains primarily physical accuracy and then your accuracy mod set for magical weapon skills contains significant magic accuracy. That's a good start, so let's move on to the "Defense" mod. Let's say it only contains one value "-DT" which refers to gear that reduces damage taken. Defining a mod set for it will look just like it did for accuracy except it will have a different name. And in this case we probably *do* want the same set to apply to all weaponskills.

```
	mods.precast.ws["-DT"] =
		{
			neck="Null Loop",
			hands="Maculele Bangles +3",
			ring1="Murky Ring",
			feet="Maculele Toe Shoes +3"
		}
```

## Defining Your Override Sets

Good news, if you can define a mod set then you can define an override set. The process for the two is exactly the same - the only difference is an override set will start in the 'overrides' table instead of the 'mods' table and YAGDRSL will look for sets using the active override value instead of an active mod value.