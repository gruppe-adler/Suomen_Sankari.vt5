// call suomen_spawner_fnc_createGasStationAction;
private ["_pos"];


_pos = getMarkerPos "mrk_gasstation";

createVehicle ["test_EmptyObjectForFireBig", _pos, [], 0, "CAN_COLLIDE"];

_bomb = "Bo_GBU12_LGB" createvehicle _pos;
[1] remoteExec ["suomen_fx_fnc_earthquake", allPlayers];
[{
	"R_80mm_HE" createvehicle _pos;
}, [], 1] call CBA_fnc_waitAndExecute;


// todo spawn local
/*
private _source = "#particlesource" createVehicleLocal _pos;
_source setParticleClass "ObjectDestructionFire1Smallx";
*/


_fences = nearestObjects [_pos, [
	"Land_FuelStation_02_pump_F", 
	"Land_Bench_01_F", 
	"Land_GarbageBin_01_F",
	"Land_Camping_Light_F"
], 100];

{
	deleteVehicle _x;
} forEach _fences;


/*
_vehicles = nearestObjects [_pos, ["Car"], 35];

// hintsilent format ["vehicles %1", _vehicles];
{
	_range = 35 + random 5;
	_speed = 2 + random 2;
	_dir = ([_x, getpos nukepos] call BIS_fnc_relativeDirTo) - 180;
	[_x, [_speed * (sin _dir), _speed * (cos _dir), 5 * (_range / _speed)]] remoteExec ["setVelocity", _x];
	_x setDamage 1;
} forEach _vehicles;
*/

// incinerate near units
/*
_nearestunits = nearestObjects [_pos,["Man","Car","Tank"],40];

{
     _unit = _x;
     if(side _unit != east) then{
     	[_unit,0,false] call suomen_fx_fnc_createFire;
     };
} foreach _nearestunits;
*/