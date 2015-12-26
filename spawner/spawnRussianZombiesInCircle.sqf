
_count = _this select 0;

_westUnitsNear = {
	_pos = _this select 0;
	_unitsNear = false;
	_nearestunits = nearestObjects [_pos,["Man"],200];

	_nearestfriendlies = [];

	// cancel if west guy is very close
	if(west countSide _nearestunits > 0) then {
		_unitsNear = true;
	};
	_unitsNear
};

_findFreePos = {
	_center = _this select 0;
	_freePos = [];

	while{ count _freePos < 1} do {
		_freePos = ["mrk_spawn_c", 0,["mrk_not_here","mrk_not_here_too"]] call SHK_pos;
	};
	sleep 1;
	//if (DEBUG) then {hintSilent format ["%1",_freePos];};
	_freePos
};

for "_i" from 0 to _count do {

	_findPosition = [] call _findFreePos;
	while {[_findPosition] call _westUnitsNear} do {
		_findPosition = [] call _findFreePos;
		
	};
	

	if (DEBUG) then {
	_mName = createMarker [str (_findPosition), _findPosition]; 
	_mName setMarkerShape "ICON";
	_mName setMarkerType "mil_dot";
	_mName setMarkerColor "ColorBlack";
	_mName setMarkerSizeLocal [1, 1];
	};

	_grp = creategroup independent;
	_zombie = _grp createUnit ["nomi_soldier_us_1", _findPosition, [], 0, "NONE"];
	sleep 0.5;
	_nul = [_zombie] execVM "loadout\russian.sqf";
	sleep 1;
};