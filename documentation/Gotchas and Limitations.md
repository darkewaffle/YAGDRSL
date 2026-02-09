# Naming Mods and Overrides
- When you create a mod make sure you give it a unique name.
- Mod values and override values should also be unique. It is possible to make it work with shared names, but it could make it more difficult to determine the cause if something doesn't work the way you expect.
- Mod values and override values should not use any strings that are also used in gearsets. For instance - don't define a mod with values like "main", "sub" or "back". This will cause problems.
- This is also why the ranged weaponskill path is sets.precast.ws.distant as opposed to sets.precast.ws.range; "range" and "ranged" are both words already effectively 'reserved' by Gearswap.

# Table Definitions and InsertGearSet
Because YAGDRSL defines so many tables behind the scenes you should be able to just drop your sets into wherever makes sense to you and move on. *However* depending on the position in the path 'chain' this can cause some errors.
If we take melee weaponskills as an example then when YAGDRSL is loaded the following tables will all already exist.

```
sets = {}
sets.precast = {}
sets.precast.ws = {}
sets.precast.ws.melee = {}
sets.precast.ws.melee.hybrid = {}
sets.precast.ws.melee.magical = {}
sets.precast.ws.melee.physical = {}
```

However if you decide to put gear into sets.precast.ws then those tables that currently exist 'below' .ws will no longer exist. Even though the way we typically write out tables doesn't necessarily make this clear, every period essentially represents a new table that is contained in the table above it. Another way to write these tables which might illustrate the problem is like this.
```
sets= {
		"precast"= {
					"ws"= {
							"melee" = {
										"hybrid" = {},
										"magical = {},
										"physical" = {}
									  }
						  }
				   }
	  }
```

Now if you assigned your Fotia Gorget to sets.precast.ws then the tables that exist would now look like this. 
```
sets = {}
sets.precast = {}
sets.precast.ws = {neck="Fotia Gorget"}
```

Or to put it more visually.
```
sets= {
		"precast"= {
					"ws"= {
							"neck" = "Fotia Gorget"
						  }
				   }
	  }
```


While "ws" originally contained "melee" and "melee" contained "hybrid", "magical" and "physical" those were all wiped out because "ws" was redefined to now only contain "neck". Depending on what you want to do, this might be fine. For instance it's common for non-caster jobs to define only sets.precast.magic and sets.midcast.magic since the rest of the tables below those often aren't relevant to them. But it might also be a problem if you decide you do want to put gear into sets.precast.ws.melee.physical because now you're trying to put the table "physical" into the table "melee" - which does not exist. This will cause the common 'attempt to index nil' error.
```
sets.precast.ws.melee.physical = {body="Scorpion Harness"} -> would cause an error
```
However we have a way to address this with a library function called InsertGearSet. When you use this instead of redefining the table, your gearset will just be inserted into the existing table. To handle the example above you would simply do this.
```
InsertGearSet(sets.precast.ws, {neck="Fotia Gorget"})
```
This will ensure that "neck" is inserted without harming "melee" or the other tables that "melee" contains. Illustrated below.
```
sets= {
		"precast"= {
					"ws"= {
							"neck"  = "Fotia Gorget",
							"melee" = {
										"hybrid" = {},
										"magical = {},
										"physical" = {}
									  }
						  }
				   }
	  }
```

# EquipSafe() and equip()
GearSwap natively provides the equip() function which is how we give GearSwap the items that we actually want to put on. However YAGDRSL uses a wrapper for equip() called EquipSafe() that provides a bit of extra processing and error protection. As such you should not call equip() directly - and unless you know what you're doing you probably should not call EquipSafe() either since all the processes where you might want to equip an item should give you a gearset to work with. Since that gearset will already be equipped at the end of the process you should instead just modify the gearset and return it - not equip it directly.

### What does EquipSafe() do though?
- It checks if the gearset is empty before passing it to equip(). I'm sure equip() already has no problem with this but it just seemed logical to do it.
- It implements YAGDRSL's WeaponLock mod. Rather than having to disable and enable Gearswap slots YAGDRSL instead uses the mod value to remove locked slots from the gearset before it is ever given to equip().
- It implements YAGDRSL's ProtectRangeFromWrongAmmo setting which removes ammo from a gearset if it would cause the ranged item in the gearset or currently equipped to become unequipped.
- It prevents a bug that can cause earring or ring slots to become 'stuck'. If your character is currently equipped with left_ear = EarringA and right_ear = EarringB but then you try to equip a gearset that contains left_ear = EarringB and right_ear = EarringC this can sometimes cause an error message stating 'Unable to equip EarringB'. Additionally this can sometimes cause GearSwap to no longer successfully equip one of the ear slots until the library or addon is reloaded. EquipSafe will check the currently equipped earrings (and rings) and swap them inside the GearSet if necessary to prevent the errors and slot lock.