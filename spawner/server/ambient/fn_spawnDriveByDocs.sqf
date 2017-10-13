params ["_veh"];

(driver _veh) forceWeaponFire ["AmbulanceHorn", "AmbulanceHorn"];
(driver _veh) setDamage 1; // kill driver to hold veh

_veh animateDoor ['Door_4_source',1,true]; // open back door
_posInside = _veh modelToWorld [0,-4.5,0]; // inside of vehicle
_posOutside = _veh modelToWorld [0,-5,0]; // inside of vehicle
_posInside set [2,0]; 
_posOutside set [2,0]; // because its not 0 before

_garbage = createVehicle ["MedicalGarbage_01_5x5_v1_F", _posOutside, [], 0, "CAN_COLLIDE"]; // create litter

church action ["useWeapon",_veh,_veh,0];

_grp = creategroup independent;

_dead = _grp createUnit ["RDS_Rocker1", _posOutside, [], 0, "CAN_COLLIDE"];
_dead addHeadgear "H_HeadBandage_bloody_F";
_dead setDamage 1;

_zombie = _grp createUnit ["GRAD_CivilianZed_rds_doctor_walker", _posInside, [], 0, "CAN_COLLIDE"];
_zombie2 = _grp createUnit ["GRAD_CivilianZed_rds_doctor_walker", _posInside, [], 0, "CAN_COLLIDE"];

_zombie setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_zombie2 setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];

_zombie2 setDir ((getDir _zombie2) -45);

[_zombie,_dead] spawn RZ_fnc_zombie_feedOnTarget;



[{
	_zombie = _this select 0;
	_zombie2 = _this select 1;
	_dead = _this select 2;

	_zombie addHeadgear "H_Cap_White_IDAP_F";
	_zombie addGoggles "G_Respirator_blue_F";
	_zombie2 addGoggles "G_Respirator_blue_F";

	[_zombie2,_dead] spawn RZ_fnc_zombie_feedOnTarget;
}, [_zombie, _zombie2,_dead], 0.5] call CBA_fnc_waitAndExecute;
