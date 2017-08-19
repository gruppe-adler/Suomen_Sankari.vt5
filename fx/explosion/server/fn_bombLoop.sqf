[{EXPLOSIVE_PLANTED},{call suomen_fx_fnc_explosivePlanted;}] call CBA_fnc_waitUntilAndExecute;

[{BLOW_UP},{
	
	[15, [1, 0.05,0]] remoteExec ["suomen_fx_fnc_setFog", allPlayers];
	NUKE_DETONATE = true; 
	publicVariable "NUKE_DETONATE";
	[] execVM "helpers\changePoliticalLandscape.sqf";
	[] remoteExec ["suomen_fx_fnc_nukeClient", allPlayers];
	// [150,150] remoteExec ["suomen_fx_fnc_fogMoving", allPlayers];
	[leakpos, 5000, {MISSION_COMPLETED}] call suomen_fx_fnc_gasEffectsAdd;

	call suomen_fx_fnc_nukeServer;
}] call CBA_fnc_waitUntilAndExecute;