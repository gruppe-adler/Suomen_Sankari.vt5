params ["_pos", "_targetPos", ["_maximum", GRAD_CROWS_MAX_CROWS_COUNT], ["_targetObj", objNull]];

_existingCrows = missionNamespace getVariable ["GRAD_crows_list", []];
_index = count _existingCrows;

// diag_log format ["index client %1", _index];

if (!isNull _targetObj) then {
	missionNamespace setVariable [format ["GRAD_crows_objTarget_%1", _index], _targetObj];
};

_crows = ["Crowe", _pos, ceil (random _maximum), 1, _pos select 2, _index, _targetPos] spawn suomen_fx_fnc_crowCreate;