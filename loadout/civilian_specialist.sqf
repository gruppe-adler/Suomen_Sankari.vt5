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
_unit forceAddUniform "rhs_uniform_gorka_r_y";
_unit addBackpack "B_TacticalPack_oli";
for "_i" from 1 to 2 do {_unit addItemToBackpack "CameraMagazine";};
_unit addHeadgear "SMA_Helmet_Green";
_unit addGoggles "Mask_M40";

comment "Add weapons";
_unit addWeapon "Launch_Camera";
