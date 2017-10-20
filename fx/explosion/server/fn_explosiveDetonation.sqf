bomb="Bo_GBU12_LGB" createvehicle (getPos leakaction);
deleteVehicle leakaction;

BLOW_UP = true; 
publicVariable "BLOW_UP";

_fences = nearestObjects [getPos nukepos, ["Land_Mil_WiredFence_F", "Land_Mil_WiredFenceD_F"], 100];

{
	deleteVehicle _x;
} forEach _fences;


_vehicles = nearestObjects [getPos nukepos, ["Car"], 100];



// hintsilent format ["vehicles %1", _vehicles];

{
	_range = 150 + random 5;
	_speed = 45 + random 5;
	_dir = ([_x, getpos nukepos] call BIS_fnc_relativeDirTo) - 180;
	[_x, [_speed * (sin _dir), _speed * (cos _dir), 5 * (_range / _speed)]] remoteExec ["setVelocity", _x];
} forEach _vehicles;

[{
	["mrk_repairVan_3"] call suomen_spawner_fnc_createPoliceDriveBy;
	["mrk_repairVan_2"] call suomen_spawner_fnc_createPoliceDriveBy;
	[getMarkerPos "mrk_repairVan"] call suomen_spawner_fnc_createRepairVan;
}, [], 3] call CBA_fnc_waitAndExecute;