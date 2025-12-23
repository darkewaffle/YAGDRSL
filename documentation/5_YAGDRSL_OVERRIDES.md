# Step 3 - Overrides for All Occasions

The override is a special type of mod. It works just like a mod except sets for it are defined in the overrides set table and there's only one override - and it's always given priority over other mods no matter what. The override is a built-in mod that you just need to populate with values. Then it works just like other mods - you can cycle it to select the active value and then the active value is applied to the set paths to find the appropriate override. Here's how it looks to define your override values.

> CreateOverride("ShEnd Override", true, "~end", "BossTank", "Vagary")

CreateOverride is the function you use to define your override, we'll cover what the parameters for it do later but for now the important thing to know is that this creates an override that has three values - the default "off", "BossTank" and "Vagary". When the override is set to "off" it does nothing and has no impact on your gear. When an override value is active YAGDRSL will look for override sets named after the override value (just like it searches for a mod set based on the mod value) and apply it to the gearset. Since it applies it to the gearset as the final step after both the offense and defense mod phases the override set will therefore override any previously selected gear. Let's look at an example of how this might be useful.

Let's say you cycle the override to select "Vagary". What might this be for? Well in Vagary if we want to spawn Perfidien and Plouton we have to accomplish certain objectives - but if you wear all your normal, powerful gear you might do too much damage and make it harder than it needs to be. So let's define some Vagary override sets. Just like 'sets' and 'mods' these sets will follow the same path definitions, they simply start from a different root table - 'overrides'.

> overrides.engaged.Vagary = {body="Malignance Tabard", legs="Malignance Tights"}
> overrides.precast.ws.Vagary = {body="Malignance Tabard", hands="Malignance Gloves", legs="Malignance Tights", feet="Malignance Boots"}

So in this scenario when the override is set to "Vagary" and you perform a weaponskill the weaponskill set will still be put together the exact same way as before. It'll go through the sets path, then it'll apply any mods. But then as a final step it will use the same path elements to search for overrides. And just like a mod it will only pick up sets where the name (key) is equal to the value of the overrides. All that is to say - it will look for these sets.

> overrides.Vagary
> overrides.precast.Vagary
> overrides.precast.ws.Vagary
> overrides.precast.ws.melee.Vagary
> overrides.precast.ws.melee.physical.Vagary

And any of them that it finds will then be applied to the set as a final step. Overrides are a great option to define gearsets that are very niche - something that you wouldn't want to have cluttering up your usual mods. Or it's also very useful to have an easy way to define gear that you want to have equipped at all times. Maybe an override for a +Capacity Point Bonus cape when you're in a CP party or for Assimilator's Bazubands when you're trying to learn BLU magic would be useful.

But as one final note, keep in mind you can also tune your overrides so that it only applies when you want it to apply. If you have a "+CP" override then you could define your overrides like this so that your cape always equipped while idle and engaged but it won't interfere with your precast sets or midcast equipment.

> overrides.idle["+CP"] = {back="Aptitude Mantle"}
> overrides.engaged["+CP"] = {back="Aptitude Mantle"}

Good lord that was a lot to take in, no? I think it's worth covering but now that you have an idea of how each of the major parts of the process works let's look at a complete, end-to-end example. 