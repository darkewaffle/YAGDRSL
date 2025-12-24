# Status Paths
- Table Name (sets, mods, overrides)
- Character Status (engaged, idle, resting)
- Zone Class (field, town)

## sets.engaged
## sets.idle.field
## sets.idle.town
## sets.resting


# Action Paths
## All action paths begin with the same three elements. Each group will detail the elements unique to them.
## Additionally all found action paths will be searched using the name of the spell, ability or item.
- Table Name (sets, mods, overrides)
- Event (precast, midcast)
- Category (ja, ra, magic, ws)


## Items
### sets.precast.item
### sets.midcast.item


## Job Abilities
### ex: sets.precast.ja.maneuver
### ex: sets.precast.ja.waltz.cure
- Parent Group (corsairshot, maneuver, samba, waltz, etc.)
- Child Group (waltz.cure)

### Bloodpact Rage
#### ex: sets.precast.bloodpact.rage
#### ex: sets.midcast.bloodpact.rage.magical
- Parent Group (bloodpact)
- Child Group (rage)
- Damage Type (hybrid, magical, physical)

### Bloodpact Ward
#### ex: sets.precast.bloodpact.ward.friend
#### ex: sets.midcast.bloodpact.ward.enemy
- Parent Group (bloodpact)
- Child Group (ward)
- Target Type (friend, enemy)

### Ready
#### ex: sets.precast.ready
#### ex: sets.midcast.ready.physical
- Parent Group (ready)
- Damage Type (hybrid, magical, physical)


## Magic
### ex: sets.precast.magic
### ex: sets.midcast.magic.healing.cure
-- Skill (enfeebling, healing, etc.)
-- Parent Group (absorb, cure, paralyze, etc.)

### Blue Magic
#### ex: sets.midcast.magic.blue.enfeebling
#### ex: sets.midcast.magic.blue.physical
-- Skill (blue)
-- Parent Group (cure, enfeebling, enhancing, physical, magical)

### Singing
#### ex: sets.midcast.magic.singing
#### ex: sets.midcast.magic.singing.friend.minne
#### ex: sets.midcast.magic.singing.enemy.lullaby
-- Skill (singing)
-- Target Type (friend, enemy)
-- Parent Group (ballad, lullaby, mambo, etc.)


## Ranged Attack
### sets.precast.ra
### sets.midcast.ra
-- No additional elements.


## Weaponskills
### ex: sets.precast.ws.melee.physical
### ex: sets.precast.ws.distant.magical
- Range (melee, distant)
- Damage Type (hybrid, magical, physical)