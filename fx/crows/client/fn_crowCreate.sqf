/* 

suggested types:

Eagle_F
Crowe
Kestrel_random_F

["Crowe", position player, 50, 50, 50] call suomen_fx_fnc_crowCreate;

*/

params ["_type", "_flockPos", "_flockCount", "_density","_flockHeight", "_index", "_targetPos"];

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

	sleep (random 0.5);
};

_veh = "Land_PenBlack_F" createVehicle _flockPos;
_veh say3D ["fx_crows_takeoff", 250];

missionNamespace setVariable [format ["GRAD_crows_startlingPoint_%1", _index], [_flockPos select 0, _flockPos select 1, 100]];
missionNamespace setVariable [format ["GRAD_crows_nearTarget_%1", _index], [_flockPos select 0, _flockPos select 1, 100]];
missionNamespace setVariable [format ["GRAD_crows_density_%1", _index], GRAD_CROWS_DENSITY];
missionNamespace setVariable [format ["GRAD_crows_distantTarget_%1", _index], _targetPos];

_existingCrows = missionNamespace getVariable ["GRAD_crows_list", []];
_existingCrows append [_crowList];
missionNamespace setVariable ["GRAD_crows_list", _existingCrows];

[_crowList, _index] call suomen_fx_fnc_crowLoop;