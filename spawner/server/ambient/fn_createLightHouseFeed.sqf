// [getMarkerPos "mrk_lightHouseFeed"] call suomen_spawner_fnc_createLightHouseFeed;

params ["_pos"];

_grpUnit = createGroup independent;
_unit = _grpUnit createUnit ["GRAD_CivilianZed_rds_uniform_citizen2_walker", _pos, [], 0, "NONE"];

_unit enableDynamicSimulation true;
_unit setVariable ["RZ_isDemon", false];
_unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_unit setVariable ["suomen_overwriteRZ", true];

_grpTargetUnit = createGroup west;
_targetUnit = _grpTargetUnit createUnit ["RDS_Worker3", _pos, [], 0, "NONE"];
_targetUnit setHit["legs",1];

_unit reveal _targetUnit;

[{
	!isNull ((_this select 0) getVariable ["RZ_Target", objNull])
},	
{
	(_this select 1) setDamage 1;
	createVehicle ["BloodSplatter_01_Large_New_F", position (_this select 1), [], 0, "NONE"];
	createVehicle ["BloodSpray_01_New_F", position (_this select 1), [], 0, "NONE"];
	createVehicle ["BloodPool_01_Large_New_F", position (_this select 1), [], 0, "CAN_COLLIDE"];
	
}, [_unit, _targetUnit]] call CBA_fnc_waitUntilAndExecute;