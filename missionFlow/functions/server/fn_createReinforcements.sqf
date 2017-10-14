params ["_pos", ["_dir", 0], ["_waypoints",[]]];

_truck = createVehicle ["RHS_Ural_VDV_01", _pos, [], 0, "NONE"];
_truck setDir _dir;
_truck enableDynamicSimulation false;


_crewGroup = createGroup civilian;
createVehicleCrew _truck;
[_truck] joinSilent _crewGroup;
crew _truck joinSilent _crewGroup;
{
	_x enableDynamicSimulation false;
} forEach crew _truck;



// add units to vehicle
{
	if (!(driver _truck isEqualTo _x)) then {
		_x assignAsCargo _truck;
		_x moveInCargo _truck; 
	};
} forEach units _crewGroup;


// set driving path
_truck setPilotLight true; 


_crewGroup setSpeedMode "FULL";
_crewGroup setBehaviour "CARELESS";
// create trigger for disembark
_lastPosition = _waypoints select (count _waypoints - 1);

_handle = [{
	params ["_args", "_handle"];
	_args params ["_truck", "_lastPosition"];

	/*
	if (!(alive (driver _truck))) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		[_truck] call suomen_mission_fnc_disembarkAndTurn;
	};
	*/

	if (_truck distance _lastPosition < 5 || !canMove _truck || !alive _truck) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
		_truck removeAllEventHandlers "Hit";

		if (HEADLESS_CONNECTED) then {
			[_truck] remoteExec ["suomen_mission_fnc_disembarkAndTurn", suomen_headless];
		} else {
			[_truck] call suomen_mission_fnc_disembarkAndTurn;
		};
		
	};
}, 1, [_truck, _lastPosition]] call CBA_fnc_addPerFrameHandler;

_truck setDriveOnPath _waypoints;
/*
_wp =_crewGroup addWaypoint [_lastPosition, 0];
_wp setWaypointType "GETOUT";
*/

_truck addEventHandler ["Hit", {
	(_this select 0) removeAllEventHandlers "Hit";

	if (HEADLESS_CONNECTED) then {
		[(_this select 0)] remoteExec ["suomen_mission_fnc_disembarkAndTurn", suomen_headless];
	} else {
		[(_this select 0)] call suomen_mission_fnc_disembarkAndTurn;
	};
}];