# Skyrim Special Edition sync utility
Tools for copying Skyrim SE from your desktop to a Steam Deck.  
Made for running under WSL

## Installing Microsoft Visual C++ Redistributable packages
These has to be installed for SKSE64 etc. to work.

Download from https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-170
```
STEAM_GAME_ID=489830
WINEPREFIX=/home/deck/.steam/steam/steamapps/compatdata/$STEAM_GAME_ID/pfx WINEARCH=win64 ~/.local/share/Steam/steamapps/common/Proton\ 7.0/dist/bin/wine VC_redist.x64.exe
WINEPREFIX=/home/deck/.steam/steam/steamapps/compatdata/$STEAM_GAME_ID/pfx WINEARCH=win64 ~/.local/share/Steam/steamapps/common/Proton\ 7.0/dist/bin/wine VC_redist.x86.exe
```

## Locations
### Plugin load orders
`~/.local\share\Steam\steamapps\compatdata\$STEAM_GAME_ID\pfx\drive_c\users\steamuser\AppData\Local\Skyrim Special Edition`
### Saves and stuff
`~/.local\share\Steam\steamapps\compatdata\$STEAM_GAME_ID\pfx\drive_c\users\steamuser\Documents\My Games\Skyrim Special Edition`
