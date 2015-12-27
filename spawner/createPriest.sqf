_pos = _this select 0;

_grp = creategroup independent;
_zombie1 = _grp createUnit ["nomi_civ_priestslow", _pos, [], 0, "NONE"];

_zombie2 = _grp createUnit ["nomi_civ_functionaryslow", _pos, [], 0, "NONE"];
_zombie3 = _grp createUnit ["nomi_civ_functionaryslow", _pos, [], 0, "NONE"];
_zombie4 = _grp createUnit ["nomi_civ_functionaryslow", _pos, [], 0, "NONE"];
_zombie5 = _grp createUnit ["nomi_civ_functionaryslow", _pos, [], 0, "NONE"];

_zombie1 doMove (getMarkerPos "mrk_procession_target");
_zombie2 doMove (getMarkerPos "mrk_procession_target");
_zombie3 doMove (getMarkerPos "mrk_procession_target");
_zombie4 doMove (getMarkerPos "mrk_procession_target");
_zombie5 doMove (getMarkerPos "mrk_procession_target");

_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_zombie1,_chosenFace], "setCustomFace"] call BIS_fnc_MP;
[[_zombie2,_chosenFace], "setCustomFace"] call BIS_fnc_MP;
[[_zombie3,_chosenFace], "setCustomFace"] call BIS_fnc_MP;
[[_zombie4,_chosenFace], "setCustomFace"] call BIS_fnc_MP;
[[_zombie5,_chosenFace], "setCustomFace"] call BIS_fnc_MP;

_root = parsingNamespace getVariable "MISSION_ROOT";

playSound3D [_root + "sounds\organ.ogg", church, true, getPosASL church, 35, 1, 200];
sleep 68;
playSound3D [_root + "sounds\organ.ogg", church, true, getPosASL church, 35, 1, 200];