[format ["Zeitzünder auf %1 s aktiviert.", str SUOMEN_EXPLOSION_TIMER]] remoteExec ["hint", allPlayers];
[[player,"watchBeep_single"]] remoteExec ["say3D", allPlayers];
[{call suomen_fx_fnc_explosiveDetonation;}, [], SUOMEN_EXPLOSION_TIMER] call CBA_fnc_waitAndExecute;