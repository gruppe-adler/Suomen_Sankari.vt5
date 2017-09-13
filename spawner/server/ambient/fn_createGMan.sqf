/*
	skiptime 2; ["mrk_trawler_spawn", "mrk_trawler_target"] call suomen_spawner_fnc_createGMan;
*/

params ["_marker", "_targetMarker"];

_scooter = createVehicle ["C_Scooter_Transport_01_F", getMarkerPos _marker, [], 0, "NONE"];
createVehicleCrew _scooter;
_scooter setDir 83;

_trawler = createVehicle ["C_Boat_Civil_04_F", [0,0,0], [], 0, "NONE"];
_trawler attachTo [_scooter, [0,0,3]];


_source01 = "#particlesource" createVehicleLocal [0,0,0];
_source01 attachto [_trawler,[0,-19,-8]];
_source01 setParticleParams [["\A3\data_f\cl_water.p3d", 1, 0, 1], "", "Billboard", 1, 2, [1.5, 1.5, 1.5], 
 [0, 0, 3], 0, 10, 0.01, 0, [5, 10, 15], [[0.7, 0.7, 0.7, 0.01], [0.4, 0.4, 0.4, 0.4], [0.4, 0.4, 0.4, 0]], [0.08], 1, 0, "", "", "",0]; 
_source01 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0.5]; 
_source01 setParticleCircle [0, [0, 0, 0]]; 
_source01 setDropInterval 0.1;



_lamp = "Land_Camping_Light_F" createVehicle [0,0,0]; 
_lamp attachTo [_trawler, [-5,-19.5,-0.13]];

_suitcase = createVehicle ["Land_Suitcase_F", [0,0,0], [], 0, "NONE"];

_gman = (createGroup civilian) createUnit ["RDS_Functionary1", [0,0,0], [], 0, "NONE"];
_gman attachTo [_trawler, [-5,-19,-0.13]];
_gman setDir -180;
[_gman, "Acts_JetsCrewaidF_idle"] remoteExec ["switchMove", allPlayers];

_trawler setVectorUp [0,-0.03,1];

_suitcase attachto [_gman, [0,-.105,-0.35], "LeftHandMiddle1"]; 
_suitcase setdir 90;
_chemlight = "ACE_G_Chemlight_HiWhite" createVehicle [0,0,0]; 
_chemlight attachTo [_suitcase, [0,0,0]];



[{
	params ["_args", "_handle"];
	 _args params ["_trawler", "_scooter", "_gman", "_marker", "_targetMarker", "_source01"];

	if ({_x distance _trawler < 100} count allPlayers > 0) exitWith {
		deleteVehicle _source01;
		_source02 = "#particlesource" createVehicleLocal [0,0,0];
		_source02 attachto [_trawler,[0,-19,-8]];
		_source02 setParticleParams [["\A3\data_f\cl_water.p3d", 1, 0, 1], "", "Billboard", 1, 3, [1.5, 1.5, 1.5], 
		 [0,0,7], 0, 100, 0.01, 0, [2, 3, 7, 10], [[0.7, 0.7, 0.7, 0.01], [1, 1, 1, 0.1], [1, 1, 1, 0]], [0.08], 1, 0, "", "", "",0]; 
		_source02 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0]; 
		_source02 setParticleCircle [0, [0, 0, 0]]; 
		_source02 setDropInterval 0.01;

		_scooter forceSpeed 2;
		_scooter doMove (getMarkerPos _targetMarker);
		
		[_gman, "Acts_JetsCrewaidF_idle2"] remoteExec ["switchMove", allPlayers]; 
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

},1,[_trawler, _scooter, _gman, _marker, _targetMarker, _source01]] call CBA_fnc_addPerFrameHandler;