
_count = _this select 0;


_findFreePos = {
	_freePos = [];

	while{ count _freePos < 1} do {
		_freePos = ["mrk_spawn_r"] call SHK_pos;
	};
	//if (DEBUG) then {hintSilent format ["%1",_freePos];};
	_freePos
};


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
	_zombie = _grp createUnit ["GRAD_SoldierZed_rhs_uniform_emr_patchless_slow", _findPosition, [], 0, "NONE"];
	_zombie enableDynamicSimulation true;
	sleep 0.5;
	_nul = [_zombie] execVM "loadout\russian.sqf";
	[_zombie,_zombie findNearestEnemy _zombie] call RZ_fnc_zombie_feedOnTarget;
	sleep 1;
};