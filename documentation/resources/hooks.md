# Event Hook Overrides Available To Users
There are hook functions available in all Gearswap events and most major custom YAGDRSL events. You can easily find them in the codebase by searching for @Hook. Please be mindful of the comments for each one and make sure they return the appropriate data when necessary. The Hook(event)Customize events must return a gearset in order for processing to continue correctly.

Additionally if you plan to override these by defining them in your character file then they must be defined within GetPlayerSettings - otherwise the empty library versions of the functions will actually end up overriding your custom versions.


| Function Name | Expected Return(s) | Location |
| --- | --- | --- |
| HookMidcastCustomizeDefense(SpellAttributes, MidcastSet) | MidcastSet | midcast.lua |
| HookMidcastCustomizeFinal(SpellAttributes, MidcastSet)  | MidcastSet | midcast.lua |
| HookMidcastCustomizeOffense(SpellAttributes, MidcastSet)  | MidcastSet |  midcast.lua |
| HookOnAftercast(SpellAttributes) | none | aftercast.lua |
| HookOnBuffChange(BuffName, BuffState) | none | buff_change.lua |
| HookOnBuffRefresh(BuffName, BuffState) | none | buff_refresh.lua |
| HookOnFileUnload(file_name) | none | file_unload.lua |
| HookOnFilteredAction(SpellAttributes) | none | filtered_action.lua |
| HookOnIndiChange(indi_table, gain) | none | indi_change.lua |
| HookOnLoad() | none | on_load.lua |
| HookOnPartyBuffChange(member_table, name, gain, buffid) | none | party_buff_change.lua |
| HookOnPetAftercast(SpellAttributes) | none | pet_aftercast.lua |
| HookOnPetChange(pet, gain) | none | pet_change.lua |
| HookOnPetMidcast(SpellAttributes) | none | pet_midcast.lua |
| HookOnPetStatusChange(new, old) | none | pet_status_change.lua |
| HookOnPretarget(spell) | none | pretarget.lua |
| HookOnStatusChange(NewStatus, OldStatus) | none | status_change.lua |
| HookOnSubJobChange(new, old) | none | sub_job_change.lua |
| HookOnTick() | none | on_tick.lua |
| HookPrecastCustomizeDefense(SpellAttributes, PrecastSet) | PrecastSet | precast.lua |
| HookPrecastCustomizeFinal(SpellAttributes, PrecastSet) | PrecastSet | precast.lua |
| HookPrecastCustomizeOffense(SpellAttributes, PrecastSet) | PrecastSet | precast.lua |
| HookPrecastTerminate(SpellAttributes) | TerminateSpell boolean<br>TerminateReason string| precast.lua |
| HookStatusCustomizeDefense(SpellAttributes, StatusSet) | StatusSet | get_set_status.lua |
| HookStatusCustomizeFinal(SpellAttributes, StatusSet) | StatusSet | get_set_status.lua |
| HookStatusCustomizeOffense(SpellAttributes, StatusSet) | StatusSet | get_set_status.lua |
| HookUserSelfCommand(CommandInputs) | none | self_command.lua |