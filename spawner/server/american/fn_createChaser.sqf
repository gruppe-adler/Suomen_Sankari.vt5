/*
	
	[getMarkerPos "mrk_chaser_spawn", 242, getMarkerPos "mrk_chaser_target"] call
	suomen_spawner_fnc_createChaser;

*/

params ["_pos", "_waypoints", ["_dir", 0], ["_targetPosition", [0,0,0]], "_index"];


private ["_truck", "_crewGroup", "_lastPosition"];

_truck = createVehicle ["rhsusf_M1232_usarmy_wd", _pos, [], 0, "NONE"];
_truck setDir _dir;


_crewGroup = createGroup civilian;
createVehicleCrew _truck;
[_truck] joinSilent _crewGroup;
crew _truck joinSilent _crewGroup;


// set driving path
_truck setPilotLight true;

_crewGroup setSpeedMode "FULL";
_crewGroup setBehaviour "CARELESS";
_crewGroup setCombatMode "BLUE";
_crewGroup allowFleeing 0;

// create trigger for disembark
_lastPosition = _waypoints select (count _waypoints - _index);

_truck addEventHandler ["Hit", {
	(_this select 0) removeAllEventHandlers "Hit";
	(_this select 0) setVariable ["suomen_gogogo", true];
}];

[{
	params ["_args", "_handle"];
	_args params ["_truck", "_lastPosition", "_targetPosition"];

	if (_truck distance _lastPosition < 5 || _truck getVariable ["suomen_gogogo", false]) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
		doStop (driver _truck);
		{_truck deleteVehicleCrew _x} forEach crew _truck;

		_types = [
		"GRAD_SoldierZed_rhs_uniform_FROG01_wd_medium",
		"GRAD_SoldierZed_rhs_uniform_FROG01_wd_fast"
		];

		[_truck, _targetPosition, _types] spawn suomen_spawner_fnc_dropChaser;
	};
}, 1, [_truck, _lastPosition, _targetPosition]] call CBA_fnc_addPerFrameHandler;

_truck setDriveOnPath _waypoints;