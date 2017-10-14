RZ_fnc_zombie_engageTarget =
	{
		params ["_unit","_target"];

		_overwrite = _unit getVariable ["suomen_overwriteRZ", false];

		if(!isNull _target) then {
		 		if (_overwrite) then {
					[_unit, _target] call suomen_spawner_fnc_enemies_engageTarget;
				} else {
					[_unit, _target] call suomen_spawner_fnc_enemies_engageTargetOriginal;
				};
		};
	};

RZ_fnc_zombie_findTargetLoop = {
	_unit = _this;

	_overwrite = _unit getVariable ["suomen_overwriteRZ", false];

	if (!_overwrite) then {
		[_unit] call suomen_spawner_fnc_enemies_findTargetLoopOriginal;
	};

	sleep 10;
};

RZ_fnc_zombie_attackHuman =
	{
		params ["_unit","_target"];

		_overwrite = _unit getVariable ["suomen_overwriteRZ", false];

		if(!isNull _target) then {
				if (_overwrite) then {
					[_unit, _target] call suomen_spawner_fnc_enemies_attackHuman;
				} else {
					[_unit, _target] call suomen_spawner_fnc_enemies_attackHumanOriginal;
				};
		};

	};

RZ_fnc_zombie_feedOnTarget = {
	params ["_unit","_target"];

	_overwrite = _unit getVariable ["suomen_overwriteRZ", false];
	
	if(!isNull _target) then {
			if (_overwrite) then {
				[_unit, _target] call suomen_spawner_fnc_enemies_feedOnTargetAny;
			} else {
				[_unit, _target] call suomen_spawner_fnc_enemies_feedOnTargetOriginal;
			};
	};
};