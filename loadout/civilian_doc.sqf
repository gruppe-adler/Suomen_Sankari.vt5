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
_unit forceAddUniform "rds_uniform_doctor";
_unit addBackpack "ARC_Common_Backpack_compact_ATACS_LE";
_unit addHeadgear "ARC_Common_ATACS_LE_M_Helmet";
_unit addGoggles "Mask_M50";