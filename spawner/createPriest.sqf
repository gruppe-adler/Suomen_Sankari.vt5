_pos = _this select 0;

_grp = creategroup independent;
_zombie = _grp createUnit ["nomi_civ_priest", _pos, [], 0, "NONE"];

_zombie doMove (getMarkerPos "mrk_priest_target");

_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_zombie,_chosenFace], "setCustomFace"] call BIS_fnc_MP;

_root = parsingNamespace getVariable "MISSION_ROOT";

playSound3D [_root + "sounds\organ.ogg", church, true, getPosASL church, 35, 1, 200];