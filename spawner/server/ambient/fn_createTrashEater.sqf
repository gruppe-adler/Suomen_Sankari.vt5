// [getMarkerPos "mrk_lightHouseFeed"] call suomen_spawner_fnc_createLightHouseFeed;

params ["_pos"];

_grpUnit = createGroup independent;
_unit = _grpUnit createUnit ["GRAD_CivilianZed_rds_uniform_citizen1_walker", _pos, [], 0, "NONE"];

_unit setVariable ["suomen_overwriteRZ", true];
_unit setVariable ["RZ_isDemon", false];
_unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_unit setVariable ["RZ_aggressiveSoundCount",round (random 5),true]; 

_grpTargetUnit = createGroup west;
_targetUnit = _grpTargetUnit createUnit ["RDS_Worker1", _pos, [], 0, "CAN_COLLIDE"];
_targetUnit setHit["legs",1];

_unit reveal _targetUnit;
[_unit, _targetUnit] spawn RZ_fnc_zombie_engageTarget;

_targetUnit setDamage 1;
_splatter1 = createVehicle ["BloodSplatter_01_Large_New_F",_targetUnit, [], 0, "NONE"];
_splatter2 = createVehicle ["BloodSpray_01_New_F",_targetUnit, [], 0, "NONE"];
_splatter3 = createVehicle ["BloodPool_01_Large_New_F",_targetUnit, [], 0, "CAN_COLLIDE"];

_splatter1 setPos [getPos _splatter1 select 0, getPos _splatter1 select 1, 0];
_splatter2 setPos [getPos _splatter2 select 0, getPos _splatter2 select 1, 0];
_splatter3 setPos [getPos _splatter3 select 0, getPos _splatter3 select 1, 0];