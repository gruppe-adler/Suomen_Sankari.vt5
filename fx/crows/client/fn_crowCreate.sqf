/* 

suggested types:

Eagle_F
Crowe
Kestrel_random_F

["Crowe", position player, 50, 50, 50] call suomen_fx_fnc_crowCreate;

*/

params ["_type", "_flockPos", "_flockCount", "_density","_flockHeight", "_index"];

/* if (typename _flockPos == typename objnull) then {_flockPos = position _flockPos};*/

_crowList = [];

for "_i" from 1 to _flockCount do {
	
	_crow = _type camcreate [
		(_flockPos select 0) - _density + (random _density)*2,
		(_flockPos select 1) - _density + (random _density)*2,
		_flockHeight
	];

	missionNamespace setVariable [format ["GRAD_crows_density_%1", _index], _density];
	missionNamespace setVariable [format ["GRAD_crows_flockHeight", _index], _flockHeight];
	missionNamespace setVariable [format ["GRAD_crows_startlingPoint_%1", _index], _flockPos];

	_crowList = _crowList + [_crow];
};

[_crowList] call suomen_fx_fnc_crowLoop;

_veh = "Land_PenBlack_F" createVehicle _flockPos;
_veh say3D ["fx_crows_takeoff", 250];

_crowList