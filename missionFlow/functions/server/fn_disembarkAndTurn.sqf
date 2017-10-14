params ["_truck"];

doStop _truck;

_driver = driver _truck;

{
	deleteVehicle _x;
} forEach units group _driver;


[_truck, false] spawn suomen_mission_fnc_turnOver;