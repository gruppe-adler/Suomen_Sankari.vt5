[trg_areaCleaner_1] spawn suomen_mission_fnc_deleteAllUnitsInTrigger; 

private ["_waypoints"];

_waypoints = [
getPos pos_chaser_1,
getPos pos_chaser_2,
getPos pos_chaser_3,
getPos pos_chaser_4,
getPos pos_chaser_5,
getPos pos_chaser_6,
getPos pos_chaser_7,
getPos pos_chaser_8,
getPos pos_chaser_9,
getPos pos_chaser_10,
getPos pos_chaser_11,
getPos pos_chaser_12,
getPos pos_chaser_13,
getPos pos_chaser_14,
getPos pos_chaser_15,
getPos pos_chaser_16,
getPos pos_chaser_17,
getPos pos_chaser_18,
getPos pos_chaser_19,
getPos pos_chaser_20,
getPos pos_chaser_21,
getPos pos_chaser_22,
getPos pos_chaser_23,
getPos pos_chaser_24,
getPos pos_chaser_25,
getPos pos_chaser_26,
getPos pos_chaser_27,
getPos pos_chaser_28,
getPos pos_chaser_29,
getPos pos_chaser_30,
getPos pos_chaser_31,
getPos pos_chaser_32,
getPos pos_chaser_33,
getPos pos_chaser_34,
getPos pos_chaser_35,
getPos pos_chaser_36,
getPos pos_chaser_37,
getPos pos_chaser_38
];


if (HEADLESS_CONNECTED) then {

	[] remoteExec ["suomen_spawner_fnc_createDriveBy", suomen_headless];

	[getMarkerPos "mrk_chaser_spawn", _waypoints, 272, getMarkerPos "mrk_chaser_target",1] remoteExec ["suomen_spawner_fnc_createChaser", suomen_headless];
	[getMarkerPos "mrk_chaser_spawn2", _waypoints, 272, getMarkerPos "mrk_chaser_target",2] remoteExec ["suomen_spawner_fnc_createChaser", suomen_headless];
} else {

	[] call suomen_spawner_fnc_createDriveBy;

	[getMarkerPos "mrk_chaser_spawn", _waypoints, 272, getMarkerPos "mrk_chaser_target",1] call  suomen_spawner_fnc_createChaser; 
	[getMarkerPos "mrk_chaser_spawn2", _waypoints, 272, getMarkerPos "mrk_chaser_target",2] call  suomen_spawner_fnc_createChaser;
};