params ["_truck"];

{
	unassignVehicle (vehicle _x);
	doGetOut _x;
} forEach units group (driver _truck);

_newGroup = createGroup independent;

{
	[_x, _newGroup, false] spawn suomen_mission_fnc_turnOver;
} forEach units group (driver _truck);