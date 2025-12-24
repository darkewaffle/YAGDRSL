# Library Functions Suggested for Users

## BindKey
> function BindKey(KeyCode, CommandText, AutomaticUnbind)
> Example: BindKey("f12", "gs c update", true)

## ConfigureDefensePriority
> function ConfigureDefensePriority(ModDescription, ControlPanelDisplay, ModKeyBind)
> Example: ConfigureDefensePriority("Def Prio", true, "end")

## ConfigureOverride
> function ConfigureOverride(OverrideDescription, ControlPanelDisplay, OverrideKeyBind, ...)
> Example: ConfigureOverride("My Overrides", true, "f10", "CP", "BluLearn", "Vagary")

## ConfigureWeaponLock
> function ConfigureWeaponLock(ModDescription, ControlPanelDisplay, ModKeyBind)
> Example: ConfigureWeaponLock("LockWeps", false, "~end")

## CreateMod
> function CreateMod(ModName, ModDescription, ControlPanelDisplay, CycleKeyBind, ...)
> Example: CreateMod("MagicBurst", "MB Mode", true, "f9", "MB High", "MB Low")

## InsertGearSet
> function InsertGearSet(InsertIntoTable, InsertFromTable)
> Example: InsertGearSet(sets.precast.magic, {ring1="Kishar Ring", ear1="Loquacious Earring"})

## SetAutoCancelBuff
> function SetAutoCancelBuff(SpellsBeingCast, BuffsToCancel)
> Example: SetAutoCancelBuff({"Curing Waltz", "Healing Waltz}, {"Saber Dance"})

## SetModValue
> function SetModValue(ModName, Value)
> Example: SetModValue("MagicBurst", "MB Low")

## TrackOffenseBuffs
> function TrackOffenseBuffs(...)
> Example: TrackOffenseBuffs("Striking Flourish", "Climactic Flourish")

## TrackDefenseBuffs
> function TrackDefenseBuffs(...)
> Example: TrackDefenseBuffs("Sentinel", "Defender")

## SetModOrders

> function SetModOrderPrecastJAOffense(...)
> function SetModOrderPrecastJADefense(...)
> function SetModOrderPrecastMagicOffense(...)
> function SetModOrderPrecastMagicDefense(...)
> function SetModOrderPrecastRAOffense(...)
> function SetModOrderPrecastRADefense(...)
> function SetModOrderPrecastWSOffense(...)
> function SetModOrderPrecastWSDefense(...)
---
> function SetModOrderMidcastJAOffense(...)
> function SetModOrderMidcastJADefense(...)
> function SetModOrderMidcastMagicOffense(...)
> function SetModOrderMidcastMagicDefense(...)
> function SetModOrderMidcastRAOffense(...)
> function SetModOrderMidcastRADefense(...)
> function SetModOrderMidcastWSOffense(...)
> function SetModOrderMidcastWSDefense(...)
---
> function SetModOrderEngagedOffense(...)
> function SetModOrderEngagedDefense(...)
> function SetModOrderIdleOffense(...)
> function SetModOrderIdleDefense(...)
> function SetModOrderRestingOffense(...)
> function SetModOrderRestingDefense(...)
---
> Example: SetModOrderEngagedOffense("OffenseMode", "TreasureHunter")