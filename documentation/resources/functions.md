# Library Functions Suggested for Users
More details on these functions can be found in the .lua files defining them. You can locate them easily by searching for the name of the function or @User which is found in the comments for each one.

## AssignModOptions
```
function AssignModOptions(ModName, ...)
AssignModOptions("Offense", "Acc", "Multi", "STP", "Subtle")
```

## BindKey
```
function BindKey(KeyCode, CommandText, AutomaticUnbind)
BindKey("f12", "gs c update", true)
```

## ConfigureDefensePriority
```
function ConfigureDefensePriority(ModDescription, ControlPanelDisplayOrder, ModKeyBind)
ConfigureDefensePriority("Def Prio", 15, "end")
```

## ConfigureOverride
```
function ConfigureOverride(OverrideDescription, ControlPanelDisplayOrder, OverrideKeyBind, ...)
ConfigureOverride("My Overrides", 10, "f10", "CP", "BluLearn", "Vagary")
```

## ConfigureWeaponLock
```
function ConfigureWeaponLock(ModDescription, ControlPanelDisplayOrder, ModKeyBind)
ConfigureWeaponLock("LockWeps", 20, "~end")
```

## CreateMod
```
function CreateMod(ModName, ModDescription, ControlPanelDisplayOrder, CycleKeyBind, ...)
CreateMod("MagicBurst", "MB Mode", 2, "f9", "MB High", "MB Low")
```

## CustomizeDualWield
```
function CustomizeDualWield(GearSet, DualWieldToAdd)
StatusSet = CustomizeDualWield(StatusSet, 9)
```

## CustomizeGearForDayElement
```
function CustomizeGearForDayElement(SpellAttributes, GearSet)
CustomizeGearForDayElement(SpellAttributes, MidcastSet)
```

## CustomizeGearForWeatherElement
```
function CustomizeGearForWeatherElement(SpellAttributes, GearSet)
CustomizeGearForWeatherElement(SpellAttributes, MidcastSet)
```

## DeleteMod
```
function DeleteMod(ModName)
DeleteMod("MagicBurst")
```

## GetCharacterHaste
```
function GetCharacterHaste(HasteDefinitions)
local CurrentHaste = GetCharacterHaste({HasteSpell = 15, Samba = 10})
```

## GetDualWieldToCap
```
function GetDualWieldToCap(JobDualWield, PlayerHaste)
local DualWieldNeeded = GetDualWieldToCap(35, 68)
```

## InsertGearSet
```
function InsertGearSet(InsertIntoTable, InsertFromTable)
InsertGearSet(sets.precast.magic, {ring1="Kishar Ring", ear1="Loquacious Earring"})
```

## ReplaceMoonshade
```
function ReplaceMoonshade(PrecastSet, AlternateEarrings)
PrecastSet = ReplaceMoonshade(PrecastSet, {"Ishvara Earring", "Sherida Earring"})
```

## ScaleCure
```
function ScaleCure(SpellAttributes, CurePotency, CureReceived, DayWeatherMultiplier)
TerminateSpell, TerminateReason = ScaleCure(SpellAttributes, 1.5, 1, 1)
```

## ScaleWaltz
```
function ScaleWaltz(SpellAttributes, WaltzPotency)
TerminateSpell, TerminateReason = ScaleWaltz(SpellAttributes, 1.5)
```

## SetAutoCancelBuff
```
function SetAutoCancelBuff(SpellsBeingCast, BuffsToCancel)
SetAutoCancelBuff({"Curing Waltz", "Healing Waltz}, {"Saber Dance"})
```

## SetModValue
```
function SetModValue(ModName, Value)
SetModValue("MagicBurst", "MB Low")
```

## SetWeaponLockIgnoreCycleMods
```
function SetWeaponLockIgnoreCycleMods(...)
SetWeaponLockIgnoreCycleMods("MainHand", "OffHand")
```

## SetWeaponLockSetWeaponLockIgnoreSpells
```
function SetWeaponLockIgnoreSpells(...)
SetWeaponLockIgnoreSpells("Phalanx", "Temper")
```

## TrackDefenseBuffs
```
function TrackDefenseBuffs(...)
TrackDefenseBuffs("Sentinel", "Defender")
```

## TrackOffenseBuffs
```
function TrackOffenseBuffs(...)
TrackOffenseBuffs("Striking Flourish", "Climactic Flourish")
```

## TrackPetNameAsDefenseMod
```
function TrackPetNameAsDefenseMod()
TrackPetNameAsDefenseMod()
```

## TrackPetNameAsOffenseMod
```
function TrackPetNameAsOffenseMod()
TrackPetNameAsOffenseMod()
```

## SetModOrders
```
function SetModOrderPrecastJAOffense(...)
function SetModOrderPrecastJADefense(...)
function SetModOrderPrecastMagicOffense(...)
function SetModOrderPrecastMagicDefense(...)
function SetModOrderPrecastRAOffense(...)
function SetModOrderPrecastRADefense(...)
function SetModOrderPrecastWSOffense(...)
function SetModOrderPrecastWSDefense(...)

function SetModOrderMidcastJAOffense(...)
function SetModOrderMidcastJADefense(...)
function SetModOrderMidcastMagicOffense(...)
function SetModOrderMidcastMagicDefense(...)
function SetModOrderMidcastRAOffense(...)
function SetModOrderMidcastRADefense(...)
function SetModOrderMidcastWSOffense(...)
function SetModOrderMidcastWSDefense(...)

function SetModOrderEngagedOffense(...)
function SetModOrderEngagedDefense(...)
function SetModOrderIdleOffense(...)
function SetModOrderIdleDefense(...)
function SetModOrderRestingOffense(...)
function SetModOrderRestingDefense(...)

SetModOrderEngagedOffense("OffenseMode", "TreasureHunter")
```

## AppendModOrders
```
function AppendModOrderPrecastJAOffense(ModName)
function AppendModOrderPrecastJADefense(ModName)
function AppendModOrderPrecastMagicOffense(ModName)
function AppendModOrderPrecastMagicDefense(ModName)
function AppendModOrderPrecastRAOffense(ModName)
function AppendModOrderPrecastRADefense(ModName)
function AppendModOrderPrecastWSOffense(ModName)
function AppendModOrderPrecastWSDefense(ModName)

function AppendModOrderMidcastJAOffense(ModName)
function AppendModOrderMidcastJADefense(ModName)
function AppendModOrderMidcastMagicOffense(ModName)
function AppendModOrderMidcastMagicDefense(ModName)
function AppendModOrderMidcastRAOffense(ModName)
function AppendModOrderMidcastRADefense(ModName)
function AppendModOrderMidcastWSOffense(ModName)
function AppendModOrderMidcastWSDefense(ModName)

function AppendModOrderEngagedOffense(ModName)
function AppendModOrderEngagedDefense(ModName)
function AppendModOrderIdleOffense(ModName)
function AppendModOrderIdleDefense(ModName)
function AppendModOrderRestingOffense(ModName)
function AppendModOrderRestingDefense(ModName)

AppendModOrderEngagedOffense("CustomOffense")
```