params ["_crows", "_index"];

[{
    params ["_args", "_handle"];
    _args params ["_crows", "_index"];
    
    if (!alive player) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    {
    	_followedObject = missionNamespace getVariable [format ["GRAD_crows_objTarget_%1", _forEachIndex], objNull];
    	if (!isNull _followedObject) then {
    		missionNamespace setVariable [format ["GRAD_crows_distantTarget_%1",_forEachIndex], position _followedObject];
    	};
       
        _targetWp = [_x, _index] call suomen_fx_fnc_crowGetWp;
        [_x, _targetWp] call suomen_fx_fnc_crowMoveTo;

        if (_forEachIndex == 0) then {
            if ((getPosATL _x) distance _targetWp < 50) exitWith {
                [_handle] call CBA_fnc_removePerFrameHandler;
                { deleteVehicle _x } forEach _crows;
            };
        };
              
    } forEach _crows;

 


},2,[_crows, _index]] call CBA_fnc_addPerFrameHandler;