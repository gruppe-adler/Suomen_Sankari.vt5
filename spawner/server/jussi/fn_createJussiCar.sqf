params ["_pos"];

private ["_veh"];

_veh = "RDS_Gaz24_Civ_03" createVehicle _pos;
_veh setDir 284;

[_veh] call suomen_spawner_fnc_shakeDatCar;

_veh