["Zeitzünder auf 25s aktiviert."] remoteExec ["hint", allPlayers];
[[player,"watchBeep_single"]] remoteExec ["say3D", allPlayers];
[{call suomen_fx_fnc_explosiveDetonation;}, [], 25] call CBA_fnc_waitAndExecute;