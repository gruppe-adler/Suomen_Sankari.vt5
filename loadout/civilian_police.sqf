_unit = _this select 0;

if (!local _unit) exitWith {};

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
_unit forceAddUniform "rds_uniform_Policeman";
for "_i" from 1 to 3 do {_unit addItemToUniform "8Rnd_762x25_TT33";};
_unit addHeadgear "rds_police_cap";
_unit addGoggles "Mask_M40_OD";

comment "Add weapons";
_unit addWeapon "Pstl762x25_TT33";