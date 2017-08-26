params ["_crow", "_targetWp"];


// diag_log format ["crow moving %1", velocityModelSpace _crow];

_dis = _crow distance _targetWp;
_time = (_dis);

if (_time > 20) then {
	_time = _time/5;
} else {
	if (_time > 15) then {
		_time = _time/4;
	} else {
		if (_time > 10) then {
			_time = _time/3;
		} else {
			if (_time > 5) then {
				_time = _time/2;
			} else {
				if (_time < 1) then {
					_targetWp = [_targetWp] call suomen_fx_fnc_crowCircle;
				};
			}
		};
	};
};


_crow camsetpos _targetWp;
_crow camcommit _time;