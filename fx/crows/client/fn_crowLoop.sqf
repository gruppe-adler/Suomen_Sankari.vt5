params ["_crows", "_index"];

[{
    params ["_args", "_handle"];
    _args params ["_crows", "_index"];
    
    if (!alive player) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    {
    	_followedObject = missionNamespace getVariable [format ["GRAD_crows_objTarget_%1", _index], objNull];
    	if (!isNull _followedObject) then {
    		missionNamespace setVariable [format ["GRAD_crows_distantTarget_%1",_index], position _followedObject];
    	};



        // origin getPos [distance, heading]
        _distantTargetPoint = missionNamespace getVariable [format ["GRAD_crows_distantTarget_%1", _index], []];
        _nearTargetPointTemp = missionNamespace getVariable [format ["GRAD_crows_nearTarget_%1", _index], []];
        diag_log format ["_nearTargetPointTemp %1, _distantTargetPoint %2", _nearTargetPointTemp, _distantTargetPoint];
        _nearTargetPoint = _nearTargetPointTemp getPos [2, (_nearTargetPointTemp getDir _distantTargetPoint)];
        _nearTargetPoint set [2, _distantTargetPoint select 2];
        missionNamespace setVariable [format ["GRAD_crows_nearTarget_%1", _index], _nearTargetPoint];

        diag_log format ["_nearTargetPoint %1", _nearTargetPoint];

        _targetWp = [_x, _nearTargetPoint] call suomen_fx_fnc_crowGetWp;
        [_x, _targetWp] call suomen_fx_fnc_crowMoveTo;

        if (_forEachIndex == 0 && isNull _followedObject) then {
            if ((getPosATL _x) distance _targetWp < 50) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
                { deleteVehicle _x } forEach _crows;
            };
        };
              
    } forEach _crows;

 


},0.5,[_crows, _index]] call CBA_fnc_addPerFrameHandler;