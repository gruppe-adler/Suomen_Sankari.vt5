params ["_crow", "_targetWp"];


// hintsilent format ["crow moving %1", velocityModelSpace _crow];

_dis = _crow distance _targetWp;
_time = (_dis);
_crow camsetpos _targetWp;
_crow camcommit _time;