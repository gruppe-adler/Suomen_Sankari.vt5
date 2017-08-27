params ["_unit", "_group"];


_unit = _this select 0;

_pos = position _unit;
_dir = getDir _unit;
_unit removeEventhandler ["AnimDone", 0];
deleteVehicle _unit;

_newUnit = _group createUnit ["GRAD_SoldierZed_rhs_uniform_emr_patchless_slow", _pos, [], 0, "NONE"];
[_newUnit] call suomen_spawner_fnc_getRussianLoadout;
_newUnit setDir _dir;

[_newUnit, 0, true] call suomen_fx_fnc_createFire;