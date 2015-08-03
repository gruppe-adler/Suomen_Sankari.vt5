_box = _this select 0;

clearWeaponCargoGlobal _box; clearItemCargoGlobal _box; clearMagazineCargoGlobal _box; clearBackpackCargoGlobal _box; 

// weapons
_box addWeaponCargoGlobal ["rhs_weap_m16a4",10];
_box addWeaponCargoGlobal ["rhs_weap_m16a4_carryhandle",5];
_box addWeaponCargoGlobal ["rhs_weap_m16a4_grip",5];

// flashlight and scope
_box addItemCargoGlobal ["acc_flashlight",15];
_box addItemCargoGlobal ["FHQ_optic_AC12136",15];

// magazines
_box addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_Mk318_Stanag",400];

_box addMagazineCargoGlobal ["rhs_rpg7_TBG7V_mag",3];
_box addMagazineCargoGlobal ["rhs_rpg7_PG7VR_mag",3];
_box addMagazineCargoGlobal ["rhs_rpg7_OG7V_mag",3];
_box addMagazineCargoGlobal ["rhs_rpg7_PG7VL_mag",3];


// flare
_box addWeaponCargoGlobal ["rhs_weap_rsp30_white",15];

_box addWeaponCargoGlobal ["rhs_weap_rpg7",2];
_box addWeaponCargoGlobal ["rhs_weap_rpg7",2];

_box addItemCargoGlobal ["ACE_Earplugs",20];