_van = missionNamespace getVariable ['suomen_obj_repairVan', objNull];

_group = group (driver _van);
_driver = driver _van;

_veh animateDoor ['Door_4_source',1,true];

// hintsilent "stopped";

doStop _driver;
_driver leaveVehicle _van;


_driver doFollow _driver;
_wp = _group addWaypoint [getPos leakaction,0];
_wp setWaypointType "MOVE";
_wp setWaypointStatements ["true","this playMove 'HubBriefing_scratch';"];