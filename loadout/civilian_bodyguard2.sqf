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
_unit forceAddUniform "U_I_G_resistanceLeader_F";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_9x21_Mag";};
_unit addVest "V_I_G_resistanceLeader_F";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_9x21_Mag";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_9x18_12_57N181S";};
for "_i" from 1 to 3 do {_unit addItemToVest "Chemlight_green";};
_unit addHeadgear "H_Hat_Boonie_Cowboy";
_unit addGoggles "G_Aviator";

comment "Add weapons";
_unit addWeapon "hgun_PDW2000_F";
_unit addWeapon "rhs_weap_makarov_pmm";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "tf_anprc148jem_3";

comment "Set identity";
_unit setFace "GreekHead_A3_02";
_unit setSpeaker "Male01AFK";