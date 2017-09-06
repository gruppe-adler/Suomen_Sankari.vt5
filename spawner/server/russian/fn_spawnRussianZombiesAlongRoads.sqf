params ["_count"];

for "_i" from 0 to _count do {
	_pos = ["mrk_spawn_r"] call SHK_pos;
	_grp = creategroup independent;
	_zombie = _grp createUnit ["GRAD_SoldierZed_rhs_uniform_emr_patchless_slow", _pos, [], 0, "NONE"];
	_zombie enableDynamicSimulation true;
	_zombie setVariable ["RZ_isDemon", false];
	[_zombie] call suomen_spawner_fnc_getRussianLoadout;
	[_zombie,_zombie findNearestEnemy _zombie] call RZ_fnc_zombie_feedOnTarget;

	if (DEBUG) then {
		_alongRoadsR = createMarker [str (getPos _zombie), getPos _zombie]; 
		_alongRoadsR setMarkerShape "ICON";
		_alongRoadsR setMarkerType "mil_dot";
		_alongRoadsR setMarkerColor "ColorRed";
		_alongRoadsR setMarkerSizeLocal [0.5, 0.5];
	};
};