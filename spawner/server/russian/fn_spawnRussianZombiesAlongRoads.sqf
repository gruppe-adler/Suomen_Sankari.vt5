
_count = _this select 0;

for "_i" from 0 to _count do {

	_findPosition = [] call _findFreePos;
	

	if (DEBUG) then {
	_alongRoadsR = createMarker [str (_findPosition), _findPosition]; 
	_alongRoadsR setMarkerShape "ICON";
	_alongRoadsR setMarkerType "mil_dot";
	_alongRoadsR setMarkerColor "ColorRed";
	_alongRoadsR setMarkerSizeLocal [0.5, 0.5];
	};

	_grp = creategroup independent;
	_zombie = _grp createUnit ["GRAD_SoldierZed_rhs_uniform_emr_patchless_slow", "mrk_spawn_r", [], 0, "NONE"];
	_zombie enableDynamicSimulation true;
	[_zombie] call suomen_spawner_fnc_getRussianLoadout;
	[_zombie,_zombie findNearestEnemy _zombie] call RZ_fnc_zombie_feedOnTarget;
	sleep 1;
};