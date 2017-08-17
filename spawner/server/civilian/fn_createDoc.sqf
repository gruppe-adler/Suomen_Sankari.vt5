_pos = _this select 0;

_grp = creategroup independent;
_zombie = _grp createUnit ["GRAD_CivilianZed_rds_doctor", _pos, [], 0, "NONE"];

_zombie doMove (getMarkerPos "mrk_doc_target");