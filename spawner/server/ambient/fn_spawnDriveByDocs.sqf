_veh = missionNamespace getVariable ['suomen_obj_ambulance', objNull];
(driver _veh) setDamage 1; // kill driver to hold veh

_veh animateDoor ['Door_4_source',1,true]; // open back door
_posInside = _veh modelToWorld [0,-4,0]; // inside of vehicle
_posOutside = _veh modelToWorld [0,-4.5,0]; // inside of vehicle
_posInside set [2,0]; 
_posOutside set [2,0]; // because its not 0 before

_garbage = createVehicle ["MedicalGarbage_01_5x5_v1_F", _posOutside, [], 0, "CAN_COLLIDE"]; // create litter

church action ["useWeapon",_veh,_veh,0];

_grp = creategroup independent;

_dead = _grp createUnit ["GRAD_CivilianZed_rds_uniform_Rocker1_slow", _posOutside, [], 0, "CAN_COLLIDE"];
_dead setDamage 1;

_zombie = _grp createUnit ["GRAD_CivilianZed_rds_doctor_walker", _posInside, [], 0, "CAN_COLLIDE"];
_zombie2 = _grp createUnit ["GRAD_CivilianZed_rds_doctor_walker", _posInside, [], 0, "CAN_COLLIDE"];

_zombie2 setDir ((getDir _zombie2) -45);

[_zombie,_dead] spawn RZ_fnc_zombie_feedOnTarget;

[{
	_zombie2 = _this select 0;
	_dead = _this select 1;

	[_zombie2,_dead] spawn RZ_fnc_zombie_feedOnTarget;
}, [_zombie2,_dead], 0.5] call CBA_fnc_waitAndExecute;
