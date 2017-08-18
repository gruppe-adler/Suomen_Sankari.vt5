params ["_count"];

for "_i" from 0 to _count do {
	_pos = ["mrk_civCrowd"] call SHK_pos;
	_zombie = [_pos] call suomen_spawner_fnc_createRandomCivilian;

	// DEBUG
	if (DEBUG) then {
		_alongRoadsA = createMarker [str (getPos _zombie), getPos _zombie]; 
		_alongRoadsA setMarkerShape "ICON";
		_alongRoadsA setMarkerType "mil_dot";
		_alongRoadsA setMarkerColor "ColorBlue";
		_alongRoadsA setMarkerSizeLocal [0.5, 0.5];
	};
};