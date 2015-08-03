_randUniformRussian = 
[
"rhs_uniform_flora"
] call BIS_fnc_selectRandom;

_randVestRussian = 
[
"rhs_6b13_Flora",
"rhs_6b13_Flora_6sh92",
"rhs_6b13_Flora_6sh92_headset_mapcase",
"rhs_6b13_Flora_6sh92_radio",
"rhs_6b13_Flora_6sh92_vog",
"rhs_6b13_Flora_crewofficer",
"rhs_6sh46"
] call BIS_fnc_selectRandom;

_randHeadGearRussian =
[
"rhs_6b26",
"rhs_6b26_ess",
"rhs_6b27m_green"
] call BIS_fnc_selectRandom;

_randHeadGearRussianOfficer =
[
"rhs_fieldcap_digi",
"rhs_fieldcap_helm_digi"
] call BIS_fnc_selectRandom;

_randBackPackRussian = [
"rhs_sidor",
"B_Carryall_oli",
"rhs_assault_umbts",
"rhs_assault_umbts_demo",
"rhs_rpg_empty",
"RHS_M2_Tripod_Bag",
"",
"",
"",
"",
""
] call BIS_fnc_selectRandom;


_unit = _this select 0;

//_unit forceAddUniform _randUniformRussian;
_unit addVest _randVestRussian;
_unit addHeadgear _randHeadGearRussian;
_unit addBackpack _randBackPackRussian;


_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_unit,_chosenFace], "setCustomFace"] call BIS_fnc_MP;