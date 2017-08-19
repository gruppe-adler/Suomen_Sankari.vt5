params ["_crows"];

[{
    params ["_args", "_handle"];
    _args params ["_crows"];
    
    if (!alive player) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    {
    	_followedObject = missionNamespace getVariable [format ["GRAD_crows_objTarget_%1", _forEachIndex], objNull];
    	if (!isNull _followedObject) then {
    		missionNamespace setVariable [format ["GRAD_crows_distantTarget_%1",_forEachIndex], position _followedObject];
    	};
       
        // first crow is lead crow
        if (_forEachIndex == 0) then {
            _targetWp = [_x] call suomen_fx_fnc_crowGetWp;
            [_x, _targetWp] call suomen_fx_fnc_crowMoveTo;
        } else {
            _targetWp = [_x] call suomen_fx_fnc_crowGetWp;
            [_x, _targetWp] call suomen_fx_fnc_crowMoveTo;
        };        
    } forEach _crows;


},0.5,[_crows]] call CBA_fnc_addPerFrameHandler;