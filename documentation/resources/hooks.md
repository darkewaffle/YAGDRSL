# Event Hook Overrides Available To Users
There are hook functions available in all Gearswap events and most major custom YAGDRSL events. You can easily find them in the codebase by searching for @Hook. Please be mindful of the comments for each one and make sure they return the appropriate data when necessary. The Hook(event)Customize events must return a gearset in order for processing to continue correctly.


| Function Name | Location |
| --- | --- |
| HookMidcastCustomizeDefense(SpellAttributes, MidcastSet) | midcast.lua |
| HookMidcastCustomizeFinal(SpellAttributes, MidcastSet) | midcast.lua |
| HookMidcastCustomizeOffense(SpellAttributes, MidcastSet) | midcast.lua |
| HookOnAftercast(SpellAttributes) | aftercast.lua |
| HookOnBuffChange(BuffName, BuffState) | buff_change.lua |
| HookOnBuffRefresh(BuffName, BuffState) | buff_refresh.lua |
| HookOnFileUnload(file_name) | file_unload.lua |
| HookOnFilteredAction(SpellAttributes) | filtered_action.lua |
| HookOnIndiChange(indi_table, gain) | indi_change.lua |
| HookOnLoad() | on_load.lua |
| HookOnPartyBuffChange(member_table, name, gain, buffid) | party_buff_change.lua |
| HookOnPetAftercast(SpellAttributes) | pet_aftercast.lua |
| HookOnPetChange(pet, gain) | pet_change.lua |
| HookOnPetMidcast(SpellAttributes) | pet_midcast.lua |
| HookOnPetStatusChange(new, old) | pet_status_change.lua |
| HookOnPretarget(spell) | pretarget.lua |
| HookOnStatusChange(NewStatus, OldStatus) | status_change.lua |
| HookOnSubJobChange(new, old) | sub_job_change.lua |
| HookOnTick() | on_tick.lua |
| HookPrecastCustomizeDefense(SpellAttributes, PrecastSet) | precast.lua |
| HookPrecastCustomizeFinal(SpellAttributes, PrecastSet) | precast.lua |
| HookPrecastCustomizeOffense(SpellAttributes, PrecastSet) | precast.lua |
| HookPrecastTerminate(SpellAttributes) | precast.lua |
| HookStatusCustomizeDefense(SpellAttributes, StatusSet) | get_set_status.lua |
| HookStatusCustomizeFinal(SpellAttributes, StatusSet) | get_set_status.lua |
| HookStatusCustomizeOffense(SpellAttributes, StatusSet) | get_set_status.lua |
| HookUserSelfCommand(CommandInputs) | self_command.lua |