if (HEADLESS_CONNECTED) then {
	[40, "mrk_defendParkingLot"] remoteExec ["suomen_spawner_fnc_createCivilianCrowd", suomen_headless];
} else {
	[40, "mrk_defendParkingLot"] spawn suomen_spawner_fnc_createCivilianCrowd;
};