params ["_count"];

_types = [
"GRAD_SoldierZed_rhs_uniform_FROG01_wd_slow",
"GRAD_SoldierZed_rhs_uniform_FROG01_wd_medium",
"GRAD_SoldierZed_rhs_uniform_FROG01_wd_walker",
"GRAD_SoldierZed_rhs_uniform_FROG01_wd"
];

for "_i" from 0 to _count do {
	_grp = creategroup independent;
	_pos = ["mrk_spawn_f"] call SHK_pos;
	_zombie = _grp createUnit [selectRandom _types, _pos, [], 0, "NONE"];
	_zombie enableDynamicSimulation true;
	_zombie setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
	_zombie setVariable ["RZ_isDemon", false];
	[_zombie] call suomen_spawner_fnc_getAmericanLoadout;

	// DEBUG
	if (DEBUG) then {
		_alongRoadsA = createMarker [str (getPos _zombie), getPos _zombie]; 
		_alongRoadsA setMarkerShape "ICON";
		_alongRoadsA setMarkerType "mil_dot";
		_alongRoadsA setMarkerColor "ColorBlue";
		_alongRoadsA setMarkerSizeLocal [0.5, 0.5];
	};
};