// [getMarkerPos "mrk_spawnHunt", getMarkerPos "mrk_spawnHuntTarget"] call suomen_spawner_fnc_spawnHunt;

params ["_pos", "_targetPos"];

_grpUnit = createGroup independent;
_unit = _grpUnit createUnit ["GRAD_SoldierZed_rhs_uniform_emr_patchless", _pos, [], 0, "NONE"];

_unit enableDynamicSimulation true;
_unit setVariable ["RZ_isDemon", false];
_unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
[_unit] call suomen_spawner_fnc_getRussianLoadout;
_unit setVariable ["suomen_overwriteRZ", true];

_grpTargetUnit = createGroup east;
_targetUnit = _grpTargetUnit createUnit ["rhs_vdv_rifleman", _pos, [], 0, "NONE"];
_targetUnit enableDynamicSimulation true;
removeAllWeapons _targetUnit;

_targetUnit setHit["legs",1];
_targetUnit doMove _targetPos;


_targetUnit setVariable ["suomen_currentTargetPos", _targetPos];

[{
    params ["_args", "_handle"];
    _args params ["_unit", "_targetUnit", "_pos", "_targetPos"];

    if (!alive _unit || !alive _targetUnit) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };
    _targetPos = _targetUnit getVariable ["suomen_currentTargetPos", _targetPos];

    if (_unit distance _targetPos < 5) then {
		_unit doMove _pos;
		_unit setVariable ["suomen_currentTargetPos", _pos];
	} else {
		_unit doMove _targetPos;
	};

},1,[_unit, _targetUnit, _pos, _targetPos]] call CBA_fnc_addPerFrameHandler;