params ["_pos"];

["Crowe", _pos, 13, 1, _pos select 2] call suomen_fx_fnc_crowCreate;
missionNamespace setVariable ["GRAD_crows_center", [_pos select 0, _pos select 1, 100]];
missionNamespace setVariable ["GRAD_crows_density", 15];