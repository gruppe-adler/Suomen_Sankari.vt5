_pos = _this select 0;

_grp = creategroup independent;
_zombie = _grp createUnit ["GRAD_CivilianZed_rds_doctor_crawler", _pos, [], 0, "NONE"];
_zombie setVariable ["RZ_isDemon", false];
_zombie setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];

_zombie doMove (getMarkerPos "mrk_doc_target");