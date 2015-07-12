// "Debug tools"//
//
["click", "onMapSingleClick", { player setPos _pos; }] call BIS_fnc_addStackedEventHandler; 
enableRadio false; //disable radio messages to be heard and shown in the left lower corner of the screen
0 fadeRadio 0; //mute in-game radio commands

reason = false;
GAS_EFFECTED = 0;
NUKE_DETONATE = false;
EXPLOSIVE_PLANTED = false;
ENEMIES_DETECTED = false;


if (isServer) then {

	call compile preprocessfile "SHK_pos\shk_pos_init.sqf";


	GAS_EFFECTED = 0;
	publicVariable "GAS_EFFECTED";

	GASMASK_FOUND = false;
	publicVariable "GASMASK_FOUND";

	COMRADES_FOUND = false;
	publicVariable "COMRADES_FOUND";
};

// DEBUG STUFF
[] spawn {
	while {true} do {
	//hintSilent format ["Willi_Demon: %1", animationState willi_demon];
	//diag_log format ["Willi_Demon: %1", animationState willi_demon];
	sleep 1;
	/*
	hintSilent format ["jussi: %1", animationState jussi];
	diag_log format ["jussi: %1", animationState jussi];
	sleep 1;

	hintSilent format ["usmc: %1", animationState usmc];
	diag_log format ["usmc: %1", animationState usmc];
	sleep 1;

	hintSilent format ["russian: %1", animationState russian];
	diag_log format ["russian: %1", animationState russian];
	sleep 1;
	*/
	//hintSilent format ["willi_fast2: %1", animationState willi_fast];
	//diag_log format ["willi_fast2: %1", animationState willi_fast];
	sleep 1;

	//hintSilent format ["willi_fast3: %1", animationState willi_fast];
	//diag_log format ["willi_fast3: %1", animationState willi_fast];
	sleep 1;
	};
};

/////////////////////////////////////////////////////////////////////////////////////////
// NUKE RELATED STUFF
/////////////////////////////////////////////////////////////////////////////////////////
mdh_nuke_destruction_zone	= 0;	// DESTRUCTION ZONE OF NUKE IN METERS, USE 0 TO DEACTIVATE
mdh_nuke_camshake			= 1;	// CAEMRASHAKE AT NUKEDETONATION 1=ON, 0=OFF
mdh_nuke_ash				= 1;	// ASH AFTER NUKEDETONATION 1=ON, 0=OFF
mdh_nuke_colorcorrection	= 0;	// COLLORCORRECTION AFTER NUKEDETONATION 1=ON, 0=OFF
/////////////////////////////////////////////////////////////////////////////////////////