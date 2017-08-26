params ["_group", "_newSide"];

_newGroup = createGroup [_newSide, true];
_newGroup copyWaypoints _group;

_currentWaypoint = currentWaypoint _group;

units _group  joinSilent _newGroup;
_newGroup setCurrentWaypoint [_newGroup, _currentWaypoint];

deleteGroup _group;


{
	_x setVariable ["asr_ai_exclude", true];
	_x setSkill ["aimingAccuracy", 0.05];
	_x setSkill ["aimingShake", 0.05];
	_x setSkill ["aimingSpeed", 0.15];
	// _x setSkill ["endurance", 0.1];
	_x setSkill ["spotDistance", 0.7];
	_x setSkill ["spotTime", 0.4]; // 1 is very fast
	_x setSkill ["courage", 0.7];
	_x setSkill ["reloadSpeed", 0.5];
	_x setSkill ["commanding", 0.4];
	_x setSkill ["general", 0.5];
} forEach units _newGroup;