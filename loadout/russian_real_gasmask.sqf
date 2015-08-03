_unit = _this select 0;

if (!local _unit) exitWith {};

removeAllWeapons _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

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
"rhs_sidor",
"",
"",
"",
""
] call BIS_fnc_selectRandom;



_unit forceAddUniform _randUniformRussian;
_unit addVest _randVestRussian;
_unit addHeadgear _randHeadGearRussian;

if (_randBackPackRussian != "") then {_unit addBackpack _randBackPackRussian;};

for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
_unit addWeapon "rhs_weap_m16a4_carryhandle";
_unit addWeapon "rhs_weap_pya";
for "_i" from 1 to 3 do {_unit addItemToVest "rhs_mag_9x19_17";};

_unit linkItem "Mask_M40_OD";

_unit addPrimaryWeaponItem "acc_flashlight"; 
group _unit enableGunLights "forceon";