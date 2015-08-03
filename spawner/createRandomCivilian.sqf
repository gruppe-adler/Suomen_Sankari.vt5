_pos = _this select 0;

randomCivilian = [
"RyanZombie_Ziv1",
"RyanZombie_Ziv2",
"RyanZombie_Ziv3"
];

_grp = creategroup independent;
_zombie = _grp createUnit [randomCivilian call BIS_fnc_selectRandom, _pos, [], 0, "NONE"];

_zombie doMove (getMarkerPos "mrk_finland");

_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_zombie,_chosenFace], "setCustomFace"] call BIS_fnc_MP;