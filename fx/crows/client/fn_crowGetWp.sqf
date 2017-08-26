params ["_crow", "_nearTargetPoint"];

_nearTargetPoint params ["_xPos", "_yPos", "_zPos"];

_density = missionNamespace getVariable [format ["GRAD_crows_density_%1", _index], 20];

_heightRandom = _zPos + _density - random (_density*2);

if (_heightRandom < 5) then {
	_heightRandom = _zPos;
};

diag_log format ["_nearTargetPoint %1, _density %2", _nearTargetPoint, _density];

_randomizedPosition = [
	_xPos + (_density -  random (_density*2)), 
	_yPos + (_density -  random (_density*2)),
	_heightRandom
];

diag_log format ["_randomizedPosition %1", _randomizedPosition];

_randomizedPosition