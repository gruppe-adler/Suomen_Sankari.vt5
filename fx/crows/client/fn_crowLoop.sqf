params ["_crows"];

[{
    params ["_args", "_handle"];
    _args params ["_crows"];
    
    if (!alive player) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    {
    	_followedObject = missionNamespace getVariable ["GRAD_crows_target", objNull];
    	if (!isNull _followedObject) then {
    		missionNamespace setVariable ["GRAD_crows_center", position _followedObject];
    	};
        [_x] call suomen_fx_fnc_crowMoveTo;    
    } forEach _crows;


},2,[_crows]] call CBA_fnc_addPerFrameHandler;