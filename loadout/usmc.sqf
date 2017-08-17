randUniformUSMC = 
[
"rhs_uniform_FROG01_wd"
];

randVestUSMC = 
[
"rhsusf_spc",
"V_Rangemaster_belt",
"V_BandollierB_cbr",
"V_BandollierB_khk"
];

randHeadGearUSMC =
[
"rhsusf_mich_helmet_marpatwd_alt",
"rhsusf_mich_helmet_marpatwd",
"rhsusf_mich_helmet_marpatwd_norotos",
"rhsusf_mich_helmet_marpatwd_norotos_arc"
];

randBackPackUSMC = [
"B_AssaultPack_Kerry",
"B_Kitbag_mcamo",
"rhsusf_falconii",
"rhsusf_falconii"
];

_unit = _this select 0;

//_unit forceAddUniform (randUniformUSMC call BIS_fnc_selectRandom);
_unit addVest (randVestUSMC call BIS_fnc_selectRandom);
_unit addHeadgear (randHeadGearUSMC call BIS_fnc_selectRandom);
_unit addBackpack (randBackPackUSMC call BIS_fnc_selectRandom);