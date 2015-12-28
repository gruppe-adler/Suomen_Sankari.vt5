if (!alive rus_patrol_gaz) exitWith {};

rus_patrol_gaz doMove (getPosATL rus_patrol_gaz);

_newTarget = rus_patrol_gaz findNearestEnemy rus_patrol_gaz;

rus_patrol_gaz_inf action ["getOut", rus_patrol_gaz];

sleep 2;

rus_patrol_gaz_inf doMove (getPos _newTarget);

group rus_patrol_gaz_inf enableGunLights "forceon";

sleep 20;
[group rus_patrol_gaz_inf, getPos rus_patrol_gaz_inf, 150] call bis_fnc_taskPatrol;