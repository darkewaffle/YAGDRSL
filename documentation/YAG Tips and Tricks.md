# Today I Learned
## Collections
YAGDRSL maintains an internal collection of various widely used gearsets. They're just a convenient shorthand to help get new jobs up and running or so you don't have to remember if a Nyame body piece is "Nyame Mail" or "Nyame Chainmail" or "Nyame Cuirass", etc. Currently it contains the following armor sets (no weapons are included).

```
collections.Agwu
collections.Bunzi
collections.Gleti
collections.Ikenga
collections.Malignance
collections.Mpaca
collections.Null
collections.Nyame
collections.Sakpata
```

## Keybinds
Any keybinds set by YAGDSRL functions will accept the same [keybind syntax used by Windower.](https://docs.windower.net/commands/input/)<br>
[Here is a link to the full list of keys as well.](https://docs.windower.net/commands/keymapping/)

### Keybind Quick Reference
| Key Modifier | Description |
| --- | --- |
| ^ | Ctrl |
| ! | Alt |
| @ | Win |
| # | Apps |
| ~ | Shift |
| $ | Keybind works while chat is open |
| % | Keybind does not work while chat is open |

## YAGDRSL Debug & Chat Functions
YAGDRSL contains a [.lua module of chat functions](https://github.com/darkewaffle/YAGDRSL/blob/main/YAGDRSL/debug/chat.lua) that it uses to send all messages to the in-game chat log. Feel free to use these in any of your own functions to assist with debugging or just putting text into chat that you want to see. It also has some helper functions to [print objects like tables, gearsets and SpellAttributes directly to chat](https://github.com/darkewaffle/YAGDRSL/blob/main/YAGDRSL/debug/chat_objects.lua).


## YAGDRSL SpellAttributes
Gearswap events give us a 'spell' table to work with but YAGDRSL turns this into a 'SpellAttributes' table and then passes that to function calls instead. Why? Partially because I didn't know what I was doing with spell originally but SpellAttributes also contains some translation layers that have been very helpful for creating a standardized set of spell information for use in defining the action paths. To see what SpellAttributes contains you can check the [get_spellattributes.lua file](https://github.com/darkewaffle/YAGDRSL/blob/main/YAGDRSL/get/get_spellattributes.lua). Also if you would prefer to access the contents of the original spell data then SpellAttributes.spell will contain a copy of it.