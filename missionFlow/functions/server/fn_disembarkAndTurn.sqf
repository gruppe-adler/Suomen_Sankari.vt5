params ["_truck"];

{
	deleteVehicle _x;
} forEach units group (driver _truck);

[_truck, false] spawn suomen_mission_fnc_turnOver;