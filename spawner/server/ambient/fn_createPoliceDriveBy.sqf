params ["_car"];

_wp = (group driver _car) addWaypoint [getPos pos_police_target,0];
_wp setWaypointType "MOVE";
_wp setWaypointStatements ["true","group this leaveVehicle (vehicle this);"];

// [car_police] call suomen_spawner_fnc_createPoliceDriveBy;