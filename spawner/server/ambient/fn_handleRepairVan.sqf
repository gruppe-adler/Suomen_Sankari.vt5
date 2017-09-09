_van = missionNamespace getVariable ['suomen_obj_repairVan', objNull];

_group = group (driver _van);
_driver = driver _van;

_veh animateDoor ['Door_1_source',1,true];

unassignVehicle (vehicle _driver);
doGetOut _driver;

_wp = _group addWaypoint [getPos leakaction,0];
_wp setWaypointType "MOVE";
_wp setWaypointStatements ["true","this playMove 'HubBriefing_scratch';"];