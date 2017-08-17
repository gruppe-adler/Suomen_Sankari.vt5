[{EXPLOSIVE_PLANTED},{call suomen_fx_fnc_explosivePlanted;}] call CBA_fnc_waitUntilAndExecute;

[{BLOW_UP},{
	
	[15, [1, 0.05,0]] remoteExec ["suomen_fx_fnc_setFog", allPlayers];
	NUKE_DETONATE = true; 
	publicVariable "NUKE_DETONATE";
	[] execVM "helpers\changePoliticalLandscape.sqf";
	[] remoteExec ["suomen_fx_fnc_nukeClient", allPlayers];
	call suomen_fx_fnc_nukeServer;
}] call CBA_fnc_waitUntilAndExecute;