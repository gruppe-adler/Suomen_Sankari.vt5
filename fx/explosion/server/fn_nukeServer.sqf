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
playSound3D [_root + "sounds\explosion.ogg", nukepos, false, getPosASL nukepos, 15, 1, 500];
playSound3D [_root + "sounds\windsound.ogg", nukepos, false, getPosASL nukepos, 15, 0.5, 500];
nul = [5] execVM "spawner\spawnRussianZombiesInCircle.sqf";
nul = [25] execVM "spawner\spawnAmericanZombiesAlongRoads.sqf";
nul = [30] execVM "spawner\spawnRussianZombiesAlongRoads.sqf";