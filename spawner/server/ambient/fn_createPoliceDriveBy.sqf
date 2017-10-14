params ["_car"];

_wp = (group driver _car) addWaypoint [getPos pos_police_target,0];
_wp setWaypointType "MOVE";
_wp setWaypointStatements ["true","
	(group this) leaveVehicle (vehicle this);
	_wp = (group this) addWaypoint [getPos civilian_doc, 0];
	_wp setWaypointType 'MOVE';
"];

// [car_police] call suomen_spawner_fnc_createPoliceDriveBy;