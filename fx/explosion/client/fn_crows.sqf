
/*
	Author: Karel Moricky

	Description:
	Spawns flock of crows circling the area.

	Parameter(s):
	_this select 0: ARRAY - Position of flock
	_this select 1 (Optional): NUMBER - area size
	_this select 2 (Optional): NUMBER - number of crows

	Returns:
	ARRAY - list of all spawned crows
*/
private ["_flockPos","_flockArea","_flockCount","_wp0","_wp1","_wp2","_wp3","_wps","_crowList","_crow"];

_flockPos = _this select 0;
_flockArea = if (count _this > 1) then {_this select 1} else {50};
_flockCount = if (count _this > 2) then {_this select 2} else {_flockArea / 5};
_flockHeight = if (count _this > 3) then {_this select 3} else {30 + random 10};

if (typename _flockPos == typename objnull) then {_flockPos = position _flockPos};
if (typename _flockPos == typename "") then {_flockPos = markerpos _flockPos};

_flockPos set [2,_flockHeight];
_wp0 = _flockPos getPos [_flockArea, 00];
_wp1 = _flockPos getPos [_flockArea, 090];
_wp2 = _flockPos getPos [_flockArea, 180];
_wp3 = _flockPos getPos [_flockArea, 270];
_wps = [_wp0,_wp1,_wp2,_wp3];

_crowList = [];
for "_i" from 1 to _flockCount do {
	_crow = "crowe" camcreate [
		(_flockPos select 0) - _flockArea + (random _flockArea)*2,
		(_flockPos select 1) - _flockArea + (random _flockArea)*2,
		_flockHeight
	];
	// [_crow,_wp0,_wp1,_wp2,_wp3,_flockArea] execfsm "fx\crows\fn_crows_hacked.fsm";
	_crowList = _crowList + [_crow];
};

_crowList;