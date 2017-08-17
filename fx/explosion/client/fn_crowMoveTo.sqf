params ["_crow"];

_targetWp = [_crow] call suomen_fx_fnc_crowGetWp;

// hintsilent format ["moving crows to %1", _targetWp];

_dis = _crow distance _targetWp;
_time = (_dis);
_crow camsetpos _targetWp;
_crow camcommit _time;