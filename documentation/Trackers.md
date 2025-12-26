# Trackers
Trackers are a specific type of mod that YAGDRSL uses to, well, track information about the current state of the game. However unlike other mods the user doesn't interact with them directly. You don't need to create trackers, define the values they hold or cycle them. Instead when the library is loaded it will automatically create trackers based on your library settings and the functions you use in GetPlayerSettings.

Then when a tracker has beenc created it will behave like a high priority mod because they get added to the end 


## YAGDRSL Currently Supports Tracking The Following...
| Tracker Name | Purpose | Values | Usage |