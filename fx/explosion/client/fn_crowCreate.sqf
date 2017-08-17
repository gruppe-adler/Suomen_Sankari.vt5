/* 

suggested types:

Eagle_F
Crowe
Kestrel_random_F

["Crowe", position player, 50, 50, 50];

*/

params ["_type", "_flockPos", "_flockCount", "_density","_flockHeight"];

/* if (typename _flockPos == typename objnull) then {_flockPos = position _flockPos};*/

_crowList = [];

for "_i" from 1 to _flockCount do {
	
	_crow = _type camcreate [
		(_flockPos select 0) - _density + (random _density)*2,
		(_flockPos select 1) - _density + (random _density)*2,
		_flockHeight
	];

	missionNamespace setVariable ["GRAD_crows_density", _density];
	missionNamespace setVariable ["GRAD_crows_flockHeight", _flockHeight];
	missionNamespace setVariable ["GRAD_crows_center", _flockPos];

	_crowList = _crowList + [_crow];
};

[_crowList] call suomen_fx_fnc_crowLoop;

_crowList