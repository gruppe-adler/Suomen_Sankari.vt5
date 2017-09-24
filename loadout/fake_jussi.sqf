_unit = _this select 0;

if (!local _unit) exitWith {};

comment "Exported from Arsenal by nomisum";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
//removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "LOP_U_ChDKZ_Fatigue_Bardak";
//for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_fieldDressing";};
//_unit addItemToUniform "ACE_morphine";
//_unit addItemToUniform "rhs_30Rnd_762x39mm";
_unit addBackpack "rhs_assault_umbts_engineer_empty";
_unit addHeadgear "LOP_H_ChDKZ_Beret";

comment "Add weapons";
//_unit addWeapon "rhs_weap_akm";
//_unit addWeapon "rhs_weap_rsp30_red";

comment "Add items";
//_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
//_unit linkItem "tf_anprc152_1";

comment "Set identity"; 
_unit setSpeaker "ACE_NoVoice";
_unit setIdentity "Jussi";