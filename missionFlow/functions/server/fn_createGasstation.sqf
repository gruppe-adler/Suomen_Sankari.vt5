if (HEADLESS_CONNECTED) then {
	[] remoteExec ["suomen_spawner_fnc_createGasStationDriveBy", suomen_headless];
} else {
	[] spawn suomen_spawner_fnc_createGasStationDriveBy;
};