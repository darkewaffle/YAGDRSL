# Overrides for All Occasions

The override is a special type of mod. It works just like a mod except the gearsets for it are defined in the 'overrides' table and there's only one override. And it's always given priority over other mods no matter what. The override is a built-in mod that you just need to populate with values. Then it works just like other mods - you can cycle it to select the active value and then the active value is applied to the set paths to find the appropriate override. Here's how it looks to define your override values.
```
ConfigureOverride("ShEnd Override", true, "~end", "BossTank", "Vagary")
```
ConfigureOverride is the function you use to define your override, we'll cover what the parameters do later but for now the important thing to know is that this creates an override that has three values - the default "off" and then two different active values of "BossTank" and "Vagary". When the override is set to "off" it does nothing and has no impact on your gear. When an override value is active then YAGDRSL will look for override sets that have the same name as the override value - just like how it searches for a mod set based on the mod value. Then it will apply this override set to the gearset as the final step after both offense and defense mods have been applied. Therefore the override set will override any previously selected gear. Let's look at an example of how this might be useful.

Let's say you cycle the override to select "Vagary". What might this be for? Well in Vagary if we want to spawn Perfidien and Plouton we have to accomplish certain objectives - but if you wear all your normal, powerful gear you might do too much damage and make it harder than it needs to be. So let's define some Vagary override sets. Just like 'sets' and 'mods' these sets will follow the same path definitions, they simply start from a different root table - 'overrides'.
```
overrides.engaged.Vagary = {body="Malignance Tabard", legs="Malignance Tights"}
overrides.precast.ws.Vagary = {body="Malignance Tabard", hands="Malignance Gloves", legs="Malignance Tights", feet="Malignance Boots"}
```
So in this scenario when the override is set to "Vagary" and you perform a weaponskill the weaponskill set will still be put together the exact same way as before. It'll go through the sets path, then it'll apply any mods. But then it will use the same path elements to also search for override sets. And just like a mod it will only pick up sets where the name (key) is equal to the value of the override. All that is to say - it will look for these sets.
```
overrides.Vagary
overrides.precast.Vagary
overrides.precast.ws.Vagary
overrides.precast.ws.melee.Vagary
overrides.precast.ws.melee.physical.Vagary
```
And any of them that it finds will then be applied to the set in the final step. Overrides are a great option to define gearsets that are very niche - something that you wouldn't want to have cluttering up your usual mods. Or maybe it just requires unique combination of equipment that just doesn't fit with your mods. Or it's also just an easy way to define gear that you want to make sure you have equipped at all times. Maybe an override for a +Capacity Point Bonus cape when you're in a CP party or for Assimilator's Bazubands when you're trying to learn BLU magic.

But as one last note, keep in mind that (just like mods) you can also define your override so that it only applies when you want it to apply. If you have a "+CP" override then you could define your overrides like this so that your cape always equipped no matter what.
```
overrides["+CP"] = {back="Aptitude Mantle"}
```

But you could also define them like this so that it applies when you're idle or engaged - but it won't apply to your precast or midcast sets so your weapon skills and magic could still be used at full power. The choice is yours.

```
overrides.idle["+CP"] = {back="Aptitude Mantle"}
overrides.engaged["+CP"] = {back="Aptitude Mantle"}
```


Good lord that was a lot to take in, no? If you're still unsure of how the steps in the process connect or if you're more of a visual learner then take a look at the [Flow Diagram](https://github.com/darkewaffle/YAGDRSL/blob/main/documentation/Flow%20Diagram.md) which charts out how all the major steps in building a set fit together.