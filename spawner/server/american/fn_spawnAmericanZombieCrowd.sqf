params ["_count", "_marker"];

sleep 30;

for "_i" from 0 to _count do {
	
	_grp = creategroup independent;
	_zombie = _grp createUnit ["GRAD_SoldierZed_rhs_uniform_FROG01_wd_slow", _marker, [], 0, "NONE"];
	_zombie enableDynamicSimulation true;
	sleep 1;
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