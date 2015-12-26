_pos = _this select 0;

randomCivilian = [
"nomi_soldier_us_1",
"nomi_soldier_us_1",
"nomi_soldier_us_1"
];

_grp = creategroup independent;
_zombie = _grp createUnit [randomCivilian call BIS_fnc_selectRandom, _pos, [], 0, "NONE"];

_zombie doMove (getMarkerPos "mrk_finland");

_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_zombie,_chosenFace], "setCustomFace"] call BIS_fnc_MP;