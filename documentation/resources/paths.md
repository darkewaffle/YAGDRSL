# Status Paths
- Table Name (sets, mods, overrides)
- Character Status (engaged, idle, resting)
- Zone Class (field, town)
```
sets.engaged
sets.idle.field
sets.idle.town
sets.resting
```

# Action Paths
All action paths begin with the same three elements. Beyond that each group will detail the elements specifically used for the rest of their path. Additionally all found action paths will be searched using the name of the spell, ability or item.
- Table Name (sets, mods, overrides)
- Event (precast, midcast)
- Category (ja, ra, magic, ws)


## Items
```
sets.precast.item
sets.midcast.item
```

## Job Abilities
- Parent Group (corsairshot, maneuver, samba, waltz, etc.)
- Child Group (waltz.cure)
```
sets.precast.ja.maneuver
sets.precast.ja.waltz.cure
```

### Bloodpact Rage
- Parent Group (bloodpact)
- Child Group (rage)
- Damage Type (hybrid, magical, physical)
```
sets.precast.bloodpact.rage
sets.midcast.bloodpact.rage.magical
```

### Bloodpact Ward
- Parent Group (bloodpact)
- Child Group (ward)
- Target Type (friend, enemy)
```
sets.precast.bloodpact.ward.friend
sets.midcast.bloodpact.ward.enemy
```

### Ready
- Parent Group (ready)
- Damage Type (hybrid, magical, physical)
```
sets.precast.ready
sets.midcast.ready.physical
```


## Magic
- Skill (enfeebling, healing, etc.)
- Parent Group (absorb, cure, paralyze, etc.)
```
sets.precast.magic
sets.midcast.magic.healing.cure
```

### Blue Magic
- Skill (blue)
- Parent Group (cure, enfeebling, enhancing, physical, magical)
```
sets.midcast.magic.blue.enfeebling
sets.midcast.magic.blue.physical
```

### Singing
- Skill (singing)
- Target Type (friend, enemy)
- Parent Group (ballad, lullaby, mambo, etc.)
```
sets.midcast.magic.singing
sets.midcast.magic.singing.friend.minne
sets.midcast.magic.singing.enemy.lullaby
```


## Ranged Attack
- No additional elements.
```
sets.precast.ra
sets.midcast.ra
```



## Weaponskills
- Range (melee, distant)
- Damage Type (hybrid, magical, physical)
```
sets.precast.ws.melee.physical
sets.precast.ws.distant.magical
```