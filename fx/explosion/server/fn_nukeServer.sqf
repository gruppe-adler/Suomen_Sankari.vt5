tapes = 
	[
	tape1,
	tape2,
	tape3,
	tape4,
	tape5,
	tape6,
	tape7,
	tape8,
	tape9,
	tape10,
	tape11
	];

{deleteVehicle _x} forEach tapes;

private ["_root"];

_root = parsingNamespace getVariable "MISSION_ROOT";
[nukepos, ["fat_explosion", 500]] remoteExec ["say3D", allPlayers];
playSound3D [_root + "sounds\windsound.ogg", nukepos, false, getPosASL nukepos, 15, 0.5, 500];
[25] call suomen_spawner_fnc_spawnAmericanZombiesAlongRoads;


deleteVehicle explosion_target_top;
explosion_target_bottom setPos [getPos explosion_target_bottom select 0, getPos explosion_target_bottom select 1, -9.5];

// debris

_orepile1 = createVehicle ["Land_SY_01_stockpile_02_F", [3263.5,3495.05,0.0163422], [], 0, "CAN_COLLIDE"];
_orepile2 = createVehicle ["Land_SY_01_stockpile_02_F", [3263.29,3495.28,0], [], 0, "CAN_COLLIDE"];
_orepile2 setDir 80;


createVehicle ["test_EmptyObjectForFireBig", getPos _orepile1, [], 0, "CAN_COLLIDE"];
createVehicle ["test_EmptyObjectForFireBig", getPos _orepile2, [], 0, "CAN_COLLIDE"];

_jussiCar = [getMarkerPos "mrk_jussi"] call suomen_spawner_fnc_createJussiCar;

{
	if (isMultiplayer) then {
		_x enableSimulationGlobal true;
		_x hideObjectGlobal false;
	} else {
		_x enableSimulation true;
		_x hideObject false;
	};
} forEach 
[
	tanktrap_1,
	tanktrap_2,
	tanktrap_3,
	tanktrap_4,
	tanktrap_5,
	tanktrap_6
];