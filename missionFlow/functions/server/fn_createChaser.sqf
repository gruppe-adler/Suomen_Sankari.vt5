[trg_areaCleaner_1] spawn suomen_mission_fnc_deleteAllUnitsInTrigger; 

if (HEADLESS_CONNECTED) then {

	[] remoteExec ["suomen_spawner_fnc_createDriveBy", suomen_headless];

	[getMarkerPos "mrk_chaser_spawn", 272, getMarkerPos "mrk_chaser_target",1] remoteExec ["suomen_spawner_fnc_createChaser", suomen_headless];
	[getMarkerPos "mrk_chaser_spawn2", 272, getMarkerPos "mrk_chaser_target",2] remoteExec ["suomen_spawner_fnc_createChaser", suomen_headless];
} else {

	[] call suomen_spawner_fnc_createDriveBy;

	[getMarkerPos "mrk_chaser_spawn", 272, getMarkerPos "mrk_chaser_target",1] call  suomen_spawner_fnc_createChaser; 
	[getMarkerPos "mrk_chaser_spawn2", 272, getMarkerPos "mrk_chaser_target",2] call  suomen_spawner_fnc_createChaser;
};