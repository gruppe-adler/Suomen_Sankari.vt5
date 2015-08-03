_pos = _this select 0;

_grp = creategroup independent;
_zombie = _grp createUnit ["RyanZombie_Doc", _pos, [], 0, "NONE"];

_zombie doMove (getMarkerPos "mrk_doc_target");


_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_zombie,_chosenFace], "setCustomFace"] call BIS_fnc_MP;