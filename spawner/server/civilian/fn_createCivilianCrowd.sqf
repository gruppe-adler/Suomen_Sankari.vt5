params ["_count"];

_findFreePos = {
	_freePos = [];

	while{ count _freePos < 1} do {
		_freePos = ["mrk_civCrowd"] call SHK_pos;
	};
	//if (DEBUG) then {hintSilent format ["%1",_freePos];};
	_freePos
};

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

	[_findPosition] execVM "spawner\createCivilianCrowd.sqf";
	sleep 1;
};