// call suomen_spawner_fnc_createRepairVan;

params [["_pos", getMarkerPos "mrk_repairVan"]];

_veh = createVehicle ["C_Van_02_service_F",_pos,[],0,"NONE"];
[
	_veh,
	["CivService",1], 
	["ladder_hide",0,"spare_tyre_holder_hide",0,"spare_tyre_hide",0,"reflective_tape_hide",0,"roof_rack_hide",0,"LED_lights_hide",0,"sidesteps_hide",0,"rearsteps_hide",0,"front_protective_frame_hide",0,"beacon_front_hide",0,"beacon_rear_hide",0]
] call BIS_fnc_initVehicle;

_veh setDir 220;

createVehicleCrew _veh;
_group = group (driver _veh);
(driver _veh) linkItem "Mask_M50";

_veh setPilotLight true;
missionNamespace setVariable ["suomen_obj_repairVan", _veh];

_path = [
/*
getMarkerPos "mrk_repairVan_1",
getMarkerPos "mrk_repairVan_2",
getMarkerPos "mrk_repairVan_3",
getMarkerPos "mrk_repairVan_4",
getMarkerPos "mrk_repairVan_5",
getMarkerPos "mrk_repairVan_6",
getMarkerPos "mrk_repairVan_7",
getMarkerPos "mrk_repairVan_8",
getMarkerPos "mrk_repairVan_9",
getMarkerPos "mrk_repairVan_10",
getMarkerPos "mrk_repairVan_11",
getMarkerPos "mrk_repairVan_12",
*/
getMarkerPos "mrk_repairVan_13",
getMarkerPos "mrk_repairVan_14",
getMarkerPos "mrk_repairVan_15",
getMarkerPos "mrk_repairVan_16",
getMarkerPos "mrk_repairVan_17",
getMarkerPos "mrk_repairVan_18",
getMarkerPos "mrk_repairVan_target"
];

_lastPosition = _path select (count _path - 2);

_trg = createTrigger ["EmptyDetector", _lastPosition];
_trg setTriggerArea [8, 8, 0, false];
_trg setTriggerActivation ["CIV", "PRESENT", true];
_trg setTriggerStatements [
"this && missionNamespace getVariable ['suomen_obj_repairVan', objNull] in thislist", 
"call suomen_spawner_fnc_handleRepairVan;", 
""];

_veh setDriveOnPath _path;