// hide ruins next to building
/*
addMissionEventHandler ["BuildingChanged", { 
	_obj = _this select 1; 
	if (_obj distance (getPos nukepos) < 50) then {	
		if (!isMultiplayer) then {
			hideObject _obj;
		} else {
			hideObjectGlobal _obj;
		};
	};
}];
*/
/*
nearestObject [(getPos leakaction), "Land_i_Barracks_V2_F"] setDamage 1;

hideObject (nearestObject [(getPos leakaction), "Land_barracks_ruins_F"]);
*/

[{EXPLOSIVE_PLANTED},{call suomen_fx_fnc_explosivePlanted;}] call CBA_fnc_waitUntilAndExecute;

[{BLOW_UP},{
	
	[15, [1, 0.05,0]] remoteExec ["suomen_fx_fnc_setFog", allPlayers];
	NUKE_DETONATE = true; 
	publicVariable "NUKE_DETONATE";
	[] execVM "helpers\changePoliticalLandscape.sqf";
	[] remoteExec ["suomen_fx_fnc_nukeClient", allPlayers];
	// [150,150] remoteExec ["suomen_fx_fnc_fogMoving", allPlayers];

	call suomen_fx_fnc_nukeServer;
}] call CBA_fnc_waitUntilAndExecute;