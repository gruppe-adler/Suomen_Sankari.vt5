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

_crewGroup = createGroup west;
createVehicleCrew _truck;
crew _truck joinSilent _crewGroup;


// create units
for "_i" from 0 to 10 do 
{
	_unit = _crewGroup createUnit [selectRandom _type, _pos, [], 0, "NONE"];
	_face = selectRandom RZ_FaceArray;
	[_unit, _face] remoteExec ["setFace"];
	[_unit] joinSilent _crewGroup;
};

// add units to vehicle
{
	_x assignAsCargo _truck;
	_x moveInCargo _truck; 
} forEach units _crewGroup;


// set driving path
(driver _truck) setDriveOnPath _waypoints;
_crewGroup setSpeedMode "FULL";
_truck setPilotLight true; 
// create trigger for disembark
_lastPosition = _waypoints select (count _waypoints - 1);

[
	{(_this select 0) distance _lastPosition < 5},
	{[_this select 0] call suomen_mission_fnc_disembarkAndTurn; }, 
	[_truck, _lastPosition]
] call CBA_fnc_waitUntilAndExecute;