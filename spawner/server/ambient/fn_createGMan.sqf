/*
	skiptime 2; ["mrk_trawler_spawn", "mrk_trawler_target"] call suomen_spawner_fnc_createGMan;
*/

params ["_marker", "_targetMarker"];

_scooter = createVehicle ["C_Scooter_Transport_01_F", getMarkerPos _marker, [], 0, "NONE"];
createVehicleCrew _scooter;
_scooter setDir 83;

_trawler = createVehicle ["C_Boat_Civil_04_F", [0,0,0], [], 0, "NONE"];
_trawler attachTo [_scooter, [0,0,3]];

sleep 1;

_lamp = "Land_Camping_Light_F" createVehicle [0,0,0]; 
_lamp attachTo [_trawler, [-5,-19.5,-0.13]];

_suitcase = createVehicle ["Land_Suitcase_F", [0,0,0], [], 0, "NONE"];

_gman = (createGroup civilian) createUnit ["RDS_Functionary1", [0,0,0], [], 0, "NONE"];
_gman setCaptive true;
_gman setCombatMode "BLUE";

_gman attachTo [_trawler, [-4.5,-19,-0.13]];
_gman setDir -180;
[_gman, "Acts_JetsCrewaidF_idle"] remoteExec ["switchMove", allPlayers];
_gman disableAI "ALL";
sleep 2;
_trawler setVectorUp [0,-0.03,1];

_suitcase attachto [_gman, [0,-.105,-0.35], "LeftHandMiddle1"]; 
_suitcase setdir 90;
_chemlight = "ACE_G_Chemlight_HiWhite" createVehicle [0,0,0]; 
_chemlight attachTo [_suitcase, [0,0,0]];


// todo make particles local
[{
	params ["_args", "_handle"];
	 _args params ["_trawler", "_scooter", "_gman", "_marker", "_targetMarker"];

	

	if ({_x distance _trawler < 50} count allPlayers > 0) exitWith {

		[] remoteExec ["suomen_mission_fnc_endMission", allPlayers, true];
		[_trawler] spawn suomen_mission_fnc_endMissionServer;

		_scooter forceSpeed 2;
		_scooter doMove (getMarkerPos _targetMarker);
		
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

},1,[_trawler, _scooter, _gman, _marker, _targetMarker]] call CBA_fnc_addPerFrameHandler;