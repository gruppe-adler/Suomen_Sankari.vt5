params ["_pos", ["_dir", 0], ["_waypoints",[]]];

_truck = createVehicle ["RHS_Ural_VDV_01", _pos, [], 0, "NONE"];
_truck setDir _dir;

_type = [
	"rhs_vdv_sergeant",
	"rhs_vdv_machinegunner",
	"rhs_vdv_medic",
	"rhs_vdv_at",
	"rhs_vdv_rifleman",
	"rhs_vdv_rifleman",
	"rhs_vdv_rifleman",
	"rhs_vdv_rifleman",
	"rhs_vdv_rifleman",
	"rhs_vdv_rifleman",
	"rhs_vdv_rifleman",
	"rhs_vdv_rifleman"
];

_crewGroup = createGroup civilian;
createVehicleCrew _truck;
[_truck] joinSilent _crewGroup;
crew _truck joinSilent _crewGroup;


// create units
for "_i" from 0 to 10 do 
{
	_unit = _crewGroup createUnit [selectRandom _type, _pos, [], 0, "NONE"];

	removeAllWeapons _unit;

	_face = selectRandom RZ_FaceArray;
	[_unit, _face] remoteExec ["setFace", allPlayers];
	[_unit] joinSilent _crewGroup;
};

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
	if (_truck distance _lastPosition < 5) then {
		[_truck] call suomen_mission_fnc_disembarkAndTurn;
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
}, 1, [_truck, _lastPosition]] call CBA_fnc_addPerFrameHandler;

_truck setDriveOnPath _waypoints;
/*
_wp =_crewGroup addWaypoint [_lastPosition, 0];
_wp setWaypointType "GETOUT";
*/

_truck addEventHandler ["GetOut", {
	[_this select 0] call suomen_mission_fnc_disembarkAndTurn;
}];