["Suomen", "All Players in Cars SUCCESS", {
	ALL_IN_CARS = true; publicVariableServer "ALL_IN_CARS";
}] call Ares_fnc_RegisterCustomModule;


["Suomen", "ENEMIES ALERT", {
	[] call suomen_mission_fnc_setEnemiesAlert;
}] call Ares_fnc_RegisterCustomModule;

["Suomen", "ENEMIES DETECTED", {
	[] call suomen_mission_fnc_setEnemiesDetected; [] call removeAIEventhandlers;
}] call Ares_fnc_RegisterCustomModule;


["Suomen", "MISSION_COMPLETED", {
	MISSION_COMPLETED = true; publicVariableServer "MISSION_COMPLETED";
}] call Ares_fnc_RegisterCustomModule;

CAM_LASTPOS = [0,0];
CAM_VECTOR_DIR = [0,0,0];
CAM_VECTOR_UP = [0,0,0];

["Suomen", "CINEMA CAM", {
	CAM_LASTPOS = getPos curatorCamera;
	CAM_VECTOR_DIR = vectorDir curatorCamera;
	CAM_VECTOR_UP = vectorUp curatorCamera;

	findDisplay 312 closeDisplay 2;
	waitUntil {isNull curatorCamera};
	[CAM_LASTPOS, CAM_VECTOR_DIR, CAM_VECTOR_UP] call suomen_helpers_fnc_cameraOld;

	private _bisCam = missionNamespace getVariable ["BIS_DEBUG_CAM", objNull];
	_bisCam camSetPos CAM_LASTPOS;
	_bisCam setVectorDir CAM_VECTOR_DIR;
	_bisCam setVectorUp CAM_VECTOR_UP;
	_bisCam camCommit 0;
	[
    {
        private _bisCam = missionNamespace getVariable ["BIS_DEBUG_CAM", objNull];
        private _end = isNull _bisCam;
        if (!_end) then {
            CAM_LASTPOS = BIS_DEBUG_CAM_LASTPOS;
            CAM_VECTOR_DIR = BIS_DEBUG_CAM_VECTORUP;
			CAM_VECTOR_UP = BIS_DEBUG_CAM_VECTORDIR;
        };
        _end
    },
    {
    	openCuratorInterface;
    	waitUntil {!isNull curatorCamera};
    	curatorcamera setPos CAM_LASTPOS;
		curatorcamera setvectordir CAM_VECTOR_DIR;
		curatorcamera setvectorup CAM_VECTOR_UP;
    }
	] call CBA_fnc_waitUntilAndExecute;
}] call Ares_fnc_RegisterCustomModule;