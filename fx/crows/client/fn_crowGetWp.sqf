params ["_crow", "_index"];

_startlingPoint = missionNamespace getVariable [format ["GRAD_crows_startlingPoint_%1", _index], []];
_targetPoint = missionNamespace getVariable [format ["GRAD_crows_distantTarget_%1", _index], []];
_density = missionNamespace getVariable [format ["GRAD_crows_density_%1", _index], 20];

if (count _startlingPoint == 0) then { 
	_startlingPoint = getPos _crow; _startlingPoint set [2,100]; 
};

if (count _targetPoint > 0) then { 
	_startlingPoint = _targetPoint;
	// diag_log format ["targetpoint set to %1", _startlingPoint]; 
};
	
_flockHeight = _startlingPoint select 2;
_heightRandom = _flockHeight + 7 - random 14;

if (_heightRandom < 5) then {
	_heightRandom = _flockHeight;
};

_startlingPoint set [2,_heightRandom];

// _startlingPoint = _startlingPoint getPos [_density, selectRandom [00,090,180,270]];


_startlingPoint