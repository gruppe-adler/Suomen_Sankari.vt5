/*

["mrk_repairVan_2"] call suomen_spawner_fnc_createPoliceDriveBy;

*/

private ["_group"];

params ["_marker"];

_veh = createVehicle ["RDS_Lada_Civ_05",getMarkerPos _marker,[],0,"NONE"];
_veh setDir 133;
[_veh,0.25,false] remoteExec ["suomen_fx_fnc_addBlueLight", allPlayers];



if (ENEMIES_DETECTED) then {
	_group = createGroup WEST;
} else {
	_group = createGroup EAST;
};


_officer = _group createUnit ["B_officer_F", [0,0,0], [],0, "NONE"];
[_officer] execVM "loadout\civilian_police.sqf";

_officer assignAsDriver _car;
_officer moveInDriver _car;


_car addEventHandler ["FiredNear", {
	(_this select 0) removeAllEventHandlers "FiredNear";
	doStop (_this select 0);
	leaveVehicle (driver _this select 0);
}];

_wp = _group addWaypoint [getPos pos_police_target,0];
_wp setWaypointType "MOVE";
_wp setWaypointStatements ["true","
	(group this) leaveVehicle (vehicle this);
	_wp = (group this) addWaypoint [getPos civilian_doc, 0];
	_wp setWaypointType 'MOVE';
"];