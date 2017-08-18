_grp = creategroup independent;
_jussi = _grp createUnit ["GRAD_CivilianZed_rds_uniform_Woodlander4_crawler", _pos, [], 0, "NONE"];

_jussi setPos [(getMarkerPos "mrk_jussi_spawn") select 0, (getMarkerPos "mrk_jussi_spawn") select 1, 0.4];
deleteVehicle fake_jussi;

JUSSI_FREE = true; 
publicVariable "JUSSI_FREE";