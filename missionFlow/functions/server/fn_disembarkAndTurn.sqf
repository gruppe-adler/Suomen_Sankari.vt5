params ["_truck"];

{
	unassignVehicle (vehicle _x);
	doGetOut _x;
} forEach units in _truck;