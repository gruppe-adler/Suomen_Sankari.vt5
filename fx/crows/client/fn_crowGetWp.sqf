params ["_crow"];

_center = missionNamespace getVariable ["GRAD_crows_center", [worldSize/2, worldSize/2, 200]];
_flockHeight = _center select 2;
_density = missionNamespace getVariable ["GRAD_crows_density", 20];



if (typename _center == typename objnull) then {_center = position _center};



_heightRandom = _flockHeight + 5 - random 10;

/* hintsilent format ["_heightRandom crow %1", _heightRandom];*/
	
if (_heightRandom < 5) then {
	_heightRandom = _flockHeight;
};

_center set [2,_heightRandom];

/* _wp = _center getPos [_density, selectRandom [00,090,180,270]];*/

_center