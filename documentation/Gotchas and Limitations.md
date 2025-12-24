# Naming Mods and Overrides
- When you create a mod make sure you give it a unique name.
- Mod values and override values should also be unique. It is possible to make it work with shared names, but it could make it more difficult to determine the cause if something doesn't work the way you expect.
- Mod values and override values should not use any strings that are also used in gearsets. For instance - don't define a mod with values like "main", "sub" or "back". This will cause problems.
- This is also why the ranged weaponskill path is sets.precast.ws.distant as opposed to sets.precast.ws.range; "range" and "ranged" are both words already effectively 'reserved' by Gearswap.

# Table Definitions and InsertGearSet
- Because YAGDRSL defines so many tables behind the scenes you should be able to just drop your sets into wherever makes sense to you and move on. *However* depending on the position in the path 'chain' this can cause some errors.
If we take melee weaponskills as an example then when YAGDRSL is loaded the following tables will all already exist.

sets = {}
sets.precast = {}
sets.precast.ws = {}
sets.precast.ws.melee = {}
sets.precast.ws.melee.hybrid = {}
sets.precast.ws.melee.magical = {}
sets.precast.ws.melee.physical = {}

However if you decide to put gear into sets.precast.ws then those tables that currently exist 'below' .ws will no longer exist. Even though the way we typically write out tables doesn't necessarily make this clear, every period essentially represents a new table that is contained in the table above it. Another way to write these tables which might illustrate the problem is like this.

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

Now if you assigned your Fotia Gorget to sets.precast.ws then the tables that exist would now look like this. 

sets = {}
sets.precast = {}
sets.precast.ws = {neck="Fotia Gorget"}

Whereas "ws" used to contain "melee" and "melee" then contained "hybrid", "magical" and "physical" those have all been wiped out because "ws" was redefined to now only contain "neck". Depending on what you want to do, this might be fine. For instance it's not uncommon for non-caster jobs to define only sets.precast.magic and sets.midcast.magic - all the rest of the tables below those aren't relevant to them. But it might also be a problem if you decide you do want to put gear into sets.precast.ws.melee.physical because now you're trying to put the table "physical" into the table "melee" - which does not exist. This will cause the common error 'attempt to index nil'.

sets.precast.ws.melee.physical = {body="Scorpion Harness"} -> will cause an error

However we have a way to address this with a library function called InsertGearSet. When you use this instead of redefining the table, your gearset will instead just be inserted into the existing table. To handle the example above you would simply do this.

InsertGearSet(sets.precast.ws, {neck="Fotia Gorget"})

This will ensure that "neck" is inserted without harming "melee" or the other tables that "melee" contains.