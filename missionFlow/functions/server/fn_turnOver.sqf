params ["_unit", "_group", "_onFire"];


_unit = _this select 0;

_pos = position _unit;
_dir = getDir _unit;
_unit removeEventhandler ["AnimDone", 0];
deleteVehicle _unit;

_types = [
	"GRAD_SoldierZed_rhs_uniform_emr_patchless_slow",
	"GRAD_SoldierZed_rhs_uniform_emr_patchless_walker"
];

_newUnit = _group createUnit [selectRandom _types, _pos, [], 0, "NONE"];
_newUnit setVariable ["RZ_isDemon", false];
[_newUnit] call suomen_spawner_fnc_getRussianLoadout;
_newUnit setDir _dir;

[_newUnit,selectRandom allPlayers] call RZ_fnc_zombie_engageTarget; 

if (_onFire) then {
	[_newUnit, 0, true] call suomen_fx_fnc_createFire;
};