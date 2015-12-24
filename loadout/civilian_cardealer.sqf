_unit = _this select 0;

if (!local _unit) exitWith {};

comment "Exported from Arsenal by nomisum";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "ARC_Common_Shirt_TAN_Uniform";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
_unit addHeadgear "H_Bandanna_gry";
_unit addGoggles "TRYK_Beard";

comment "Add weapons";
_unit addWeapon "rhs_weap_makarov_pmm";