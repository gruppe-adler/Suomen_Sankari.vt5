params ["_unit", "_group"];

[{
	_unit = _this select 0;
	_group = _this select 1;
	_pos = position _unit;
	_dir = getDir _unit;

	deleteVehicle _unit;

	_newUnit = _group createUnit ["GRAD_SoldierZed_rhs_uniform_emr_patchless_slow", _pos, [], 0, "NONE"];
	[_newUnit] call suomen_spawner_fnc_getRussianLoadout;
	_newUnit setDir _dir;

}, [_unit, _group], 2] call CBA_fnc_waitAndExecute;