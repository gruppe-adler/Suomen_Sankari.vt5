_box = _this select 0;

clearWeaponCargoGlobal _box; clearItemCargoGlobal _box; clearMagazineCargoGlobal _box; clearBackpackCargoGlobal _box; 

// uniform
_box addItemCargoGlobal ["LOP_U_US_Fatigue_03",20];

// vests
_box addItemCargoGlobal ["LOP_V_6Sh92_OLV",5];
_box addItemCargoGlobal ["LOP_V_6B23_Rifleman_OLV",5];
_box addItemCargoGlobal ["LOP_V_6B23_CrewOfficer_OLV",5];
_box addItemCargoGlobal ["LOP_V_6B23_6Sh92_OLV",5];

// backpacks
_box addBackpackCargoGlobal ["rhs_sidor",5];