_pos = _this select 0;

private ["_root", "_zombie1", "_zombie2", "_zombie3", "_zombie4", "_zombie5", "_grp"];

_grp = creategroup independent;
_zombie1 = _grp createUnit ["GRAD_CivilianZed_rds_uniform_priest_spider", _pos, [], 0, "NONE"];

_zombie2 = _grp createUnit ["GRAD_CivilianZed_rds_Functionary1_slow", _pos, [], 0, "NONE"];
_zombie3 = _grp createUnit ["GRAD_CivilianZed_rds_Functionary1_slow", _pos, [], 0, "NONE"];
_zombie4 = _grp createUnit ["GRAD_CivilianZed_rds_Functionary1_slow", _pos, [], 0, "NONE"];
_zombie5 = _grp createUnit ["GRAD_CivilianZed_rds_Functionary1_slow", _pos, [], 0, "NONE"];

{
	_x setVariable ["RZ_isDemon", false];
	_x doMove (getMarkerPos "mrk_procession_target");
} forEach [_zombie1, _zombie2, _zombie3, _zombie4, _zombie5];


_root = parsingNamespace getVariable "MISSION_ROOT";

playSound3D [_root + "sounds\organ.ogg", church, true, getPosASL church, 50, 0.8, 500];