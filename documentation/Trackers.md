# Trackers to Track the Trackables
Trackers are a specific type of mod that YAGDRSL uses to, well, track information about the current state of the game. However unlike other mods the user doesn't interact with them directly. You don't need to create trackers, define the values they hold or cycle them. Instead when the library is loaded it will automatically create trackers based on your library settings and the functions you use in GetPlayerSettings or in your job's file_logic. In general the functions that you can call that will create trackers should most likely be placed in your job's file_logic.


Then when a tracker has been created it will behave like a high priority mod because they will be added to the mod orders *after* your own mod order definitions. This behavior may change in the future but for now it seems appropriate for the game elements that trackers currently record.


## YAGDRSL Currently Supports Tracking The Following...
| Tracked Data | Purpose | Values |
| --- | --- | --- |
| Active Buff | Indicates if the player currently has the specified buff. | Full buff name |
| Pet Name | Records the name of the character's pet. | BST: "beast"<br>DRG: "wyvern"<br>GEO: "luopan"<br>PUP: "automaton"<br>SMN: Full pet name |
| Player Facing | Indicates the player's facing relative to the current target. Only tracked when engaged and settings TickEnable and TickEvaluateFacing are both true. Front and back are currently defined as 30 degree cones. | facing_front<br>facing_back<br>facing_other |
| Player Moving | Indicates if the player is currently moving. Only tracked when settings TickEnable and TickEvaluateMovement are both true. | player_moving |



## Using Each Type of Tracker
### Active Buffs
YAGDRSL contains two functions that allow you to declare the buffs that you want to track.
```
TrackOffenseBuffs(...)
TrackDefenseBuffs(...)
```
These functions work the exact same way except that the trackers created by TrackOffenseBuffs will only be inserted into *offense* Mod Orders and the trackers created by TrackDefenseBuffs will be inserted into *defense* Mod Orders. So while trackers are given high priority by being at the end of the orders they do still respect the mod phases.

So how do you actually track buffs and then make use of the tracking? First you need to call one of the Track___Buffs functions and give it the exact names of the buffs you want to track. Each name should be wrapped by quotation marks and separated by commas.

```
TrackOffenseBuffs("Striking Flourish", "Climactic Flourish")
TrackDefenseBuffs("Fan Dance")
```

So what does this do exactly? Behind the scenes YAGDRSL will create a tracker for each of these buffs - and anytime your buffs change it will update the trackers accordingly. Each buff tracker can only have one of two values at any time, it will either be "off" or it will contain the name of the buff itself when you currently have the buff. Then it will insert each tracker into the end of *all offense orders* or the end of *all defense orders* depending on which function is used. 


Now that we have a tracker in the mod orders, how do we use that to actually change our gear when a buff is active? Essentially it can now be treated just like any other mod - except the mod value is just the name of the buff itself. So using the buffs above we can think about what scenarios we care about having buff-specific items equipped. Striking Flourish and Climactic Flourish are basically both just weaponskill buffs but Fan Dance is an important defensive buff so we probably want the gear for it equipped at least while idle and engaged - maybe even at all times. Knowing that, let's build some mods.

```
	mods.precast.ws.melee.physical["Climactic Flourish"] =
		{
			ammo="Charis Feather",
			head="Maculele Tiara +3",
			neck="Etoile Gorget +1"
		}

	mods.precast.ws.melee.physical["Striking Flourish"] =
		{
			body="Maculele Casaque +2"
		}

	mods.engaged["Fan Dance"] =
		{
			hands="Horos Bangles +3"
		}

	mods.idle["Fan Dance"] =
		{
			hands="Horos Bangles +3"
		}

--	mods["Fan Dance"] =
--		{
--			hands="Horos Bangles +3"
--		}
```

The flourish mods mean that anytime we use a melee, physical damage weaponskill and we have the Climactic Flourish or Striking Flourish buff then the gear corresponding to that buff will be equipped. And you'll note that for Climactic Flourish we've also included Charis Feather to increase critical hit damage and Etoile Gorget to provide more charisma - so the set you define for the buff can contain more than just items that are specifically related to the buff.

Then the Fan Dance mods currently mean that Horos Bangles will be equipped anytime Fan Dance is active and the character's status is idle or engaged. However the lines that are commented out (the lines beginning with --) also provide an example of how you could instead have it equipped at all times. By defining it inside of just 'mods' rather than further down the path that means that it would affect all actions, all events and all statuses.

### Pet Name
In order for your Pet Name to act as a tracker mod you only need to call one of these two functions. Similar to buff tracking these functions do the exact same thing except they determine whether or not the tracker is treated as an offense mod or a defense mod.
```
TrackPetNameAsOffenseMod()
TrackPetNameAsDefenseMod()
```

Then anytime your pet changes the pet tracker will change from "off" to the name of your pet (or "wyvern" for DRG and "automaton" for PUP). This allows you to define mod sets that can be specific to your pet. For instance if you are a Summoner and you want to make sure that specific gear is equipped for Carbuncle then you might define your mod sets like this.

```
	mods.idle["Carbuncle"] = 
		{
			hands="Asteria Mitts +1"
		}

	mods.midcast.ja.bloodpact["Carbuncle"] = 
		{
			hands="Asteria Mitts +1"
		}
```

This means that anytime you are idle with Carbuncle then you will equip Asteria Mitts to reduce Carbuncle's perpetuation cost. Likewise anytime you are use a Carbuncle bloodpact you would equip Asteria Mitts to gain +1 Carbuncle Level. But anytime you are idle or using a bloodpact with a different pet then the Asteria Mitts would not be applied.

### Player Facing & Player Moving
These trackers are tied to using the Tick event. That means that in order for facing and movement information to be tracked you first need to enable Tick and the trackers by defining the necessary settings as true in your character file. That just means you will need to place some or all of the following lines inside the GetPlayerSettings function in your character file. However these can also be in your job's file_logic. Normally it is best to only define settings in one place or the other - however in this case you may want the tracking turned on by default but turn it off for specific jobs so there can be valid reasons like this to have them defined in both locations.

```
TickEnable = true
TickEvaluateFacing = true
TickEvaluateMovement = true
```

Once these settings are enabled YAGDRSL will begin to track when you are moving and/or when you are engaged and facing your target's front or back. You can then use this information to define mod sets corresponding to values of "player_moving", "facing_front", or "facing_back". Mods that take advantage of this information might look like this.

```
	mods.idle["player_moving"] = 
		{
			legs="Carmine Cuisses +1"
		}

	mods.engaged["facing_front"] =
		{
			feet="Horos Toe Shoes +4"
		}
```

Also one more note is that while it is not necessary to change the TickForceUpdateCooldown setting for facing or movement tracking to work, you may want to. In addition to tracking your movement and facing, YAGDRSL will also track when your movement or facing state changes and then call for an update when a change is detected. This means that when you start to move after standing still YAGDRSL will recognize that you have started to move, change the tracker to "player_moving" and then call for an update so that your "player_moving" set will be equipped.

TickForceUpdateCooldown represents (in seconds) how frequently tick is 'allowed' to call these updates. So a smaller number means it will update more frequently - but also keep in mind this is more code running inside of the Tick event so it's best to not have it do too much work. A safe range that still feels responsive is probably somewhere around .5 - 1 second.