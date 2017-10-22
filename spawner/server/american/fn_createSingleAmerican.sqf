params ["_pos", "_isFast"];

private ["_typesSlow", "_typesFast", "_unit"];

_typesSlow = [
"GRAD_SoldierZed_rhs_uniform_FROG01_wd_slow",
"GRAD_SoldierZed_rhs_uniform_FROG01_wd_medium",
"GRAD_SoldierZed_rhs_uniform_FROG01_wd_walker"
];

_typesFast = [
"GRAD_SoldierZed_rhs_uniform_FROG01_wd",
"GRAD_SoldierZed_rhs_uniform_FROG01_wd_fast"
];

if (_isFast) then {
	_grp = creategroup independent;
	_unit = _grp createUnit [selectRandom _typesFast, _pos, [], 0, "NONE"];
	_unit enableDynamicSimulation true;
	_unit setVariable ["RZ_isDemon", false];
	_unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
	[_unit] call suomen_spawner_fnc_getAmericanLoadout;
} else {
	_grp = creategroup independent;
	_unit = _grp createUnit [selectRandom _typesSlow, _pos, [], 0, "NONE"];
	_unit enableDynamicSimulation true;
	_unit setVariable ["RZ_isDemon", false];
	_unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
	[_unit] call suomen_spawner_fnc_getAmericanLoadout;
};