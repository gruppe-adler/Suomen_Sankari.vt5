
_count = _this select 0;

sleep 30;

for "_i" from 0 to _count do {

	_findPosition = [] call _findFreePos;

	// DEBUG
	if (DEBUG) then {
	_alongRoadsA = createMarker [str (_findPosition), _findPosition]; 
	_alongRoadsA setMarkerShape "ICON";
	_alongRoadsA setMarkerType "mil_dot";
	_alongRoadsA setMarkerColor "ColorBlue";
	_alongRoadsA setMarkerSizeLocal [0.5, 0.5];
	};

	_grp = creategroup independent;
	_zombie = _grp createUnit ["GRAD_SoldierZed_rhs_uniform_FROG01_wd_slow", _findPosition, [], 0, "NONE"];
	_zombie enableDynamicSimulation true;
	sleep 0.5;
	[_zombie] call suomen_spawner_fnc_getAmericanLoadout;
};