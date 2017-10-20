RZ_fnc_zombie_roam = {
	private _zombie = _this;

	_overwrite = _zombie getVariable ["suomen_overwriteRZ", false];
	if (_overwrite) exitWith {sleep 1;};

	_roamPos = [(getposATL _zombie select 0) + random 15 - random 15, (getposATL _zombie select 1) + random 15 - random 15];
	if !(local _zombie) then 
	{
		[_zombie, _roamPos] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
	} else {
		_zombie domove _roamPos;
	};
};

RZ_fnc_zombie_engageTarget =
	{
		params ["_unit","_target"];

		_overwrite = _unit getVariable ["suomen_overwriteRZ", false];

		if(!isNil "_target" && {!isNull _target}) then {
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

		if(!isNil "_target" && {!isNull _target}) then {
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
	
	if(!isNil "_target" && {!isNull _target}) then {
			if (_overwrite) then {
				[_unit, _target] call suomen_spawner_fnc_enemies_feedOnTargetAny;
			} else {
				[_unit, _target] call suomen_spawner_fnc_enemies_feedOnTargetOriginal;
			};
	};
};