
_count = _this select 0;



_findFreePos = {
	_freePos = [];

	while{ count _freePos < 1} do {
		_freePos = ["mrk_spawn_crowd2"] call SHK_pos;
	};
	sleep 1;
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

	_grp = creategroup independent;
	_zombie = _grp createUnit ["RyanZombie_USMC", _findPosition, [], 0, "NONE"];
	sleep (random 10);
	_nul = [_zombie] execVM "loadout\usmc.sqf";
	sleep 5;
};