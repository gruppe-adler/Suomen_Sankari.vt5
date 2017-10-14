_pos = _this select 0;

_grp = createGroup independent;
_zombie = _grp createUnit ["GRAD_CivilianZed_rds_doctor_walker", _pos, [], 0, "NONE"];
_zombie setVariable ["RZ_isDemon", false];
_zombie setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_zombie setVariable ["RZ_aggressiveSoundCount",round (random 5),true]; 

_zombie doMove (getMarkerPos "mrk_doc_target");


[{
	_zombie = _this select 0;

	_zombie addHeadgear "H_Cap_White_IDAP_F";
	_zombie addGoggles "G_Respirator_blue_F";

}, [_zombie], 0.5] call CBA_fnc_waitAndExecute;