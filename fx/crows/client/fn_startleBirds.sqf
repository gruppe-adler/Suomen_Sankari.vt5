params ["_pos"];

_existingCrows = missionNamespace getVariable ["GRAD_crows_list", []];
_index = count _existingCrows;
_crows = ["Crowe", _pos, 13, 1, _pos select 2, _index] call suomen_fx_fnc_crowCreate;

missionNamespace setVariable [format ["GRAD_crows_startlingPoint_%1", _index], [_pos select 0, _pos select 1, 100]];
missionNamespace setVariable [format ["GRAD_crows_density_%1", _index], 15];

// params are destination and index, set after a delay to let them rise vertically first
[{[[random worldSize,worldSize + 250,100], _this select 0] remoteExec ["suomen_fx_fnc_setBirdTarget"]; }, [_index], 10 + random 2] call CBA_fnc_waitAndExecute;

_existingCrows append [_crows];
missionNamespace setVariable ["GRAD_crows_list", _existingCrows];