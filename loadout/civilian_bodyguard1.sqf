_unit = _this select 0;


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
_unit forceAddUniform "U_Hipster_B";
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
for "_i" from 1 to 3 do {_unit addItemToUniform "rhs_30Rnd_545x39_AK";};
_unit addVest "V_PlateCarrier_medium_C";
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_9x18_12_57N181S";};
for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
_unit addHeadgear "H_Watchcap_blk";
_unit addGoggles "TRYK_Beard_BW";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m_desert_folded";
_unit addPrimaryWeaponItem "rhs_acc_2dpZenit";
_unit addWeapon "rhs_weap_makarov_pmm";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

comment "Set identity";
_unit setFace "GreekHead_A3_08";
_unit setSpeaker "Male01AFK";
