_unit = _this select 0;


removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

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


_unit forceAddUniform (randUniformUSMC call BIS_fnc_selectRandom);
_unit addVest (randVestUSMC call BIS_fnc_selectRandom);
_unit addHeadgear (randHeadGearUSMC call BIS_fnc_selectRandom);
_unit addBackpack (randBackPackUSMC call BIS_fnc_selectRandom);

_unit addMagazines ["rhs_mag_30Rnd_556x45_Mk318_Stanag",2]; 
_unit addWeapon "rhs_weap_m16a4"; 
 
 
 _unit addPrimaryWeaponItem "acc_flashlight"; 
 group _unit enableGunLights "forceon";