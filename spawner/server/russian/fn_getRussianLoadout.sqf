params ["_unit"];

_headgear = [
	"rhs_fieldcap_digi",
	"rhs_fieldcap_helm_digi",
	"rhs_6b26",
	"rhs_6b26_ess",
	"rhs_6b27m_green"
];

_vests = [
	"rhs_6b13_Flora",
	"rhs_6b13_Flora_6sh92",
	"rhs_6b13_Flora_6sh92_headset_mapcase",
	"rhs_6b13_Flora_6sh92_radio",
	"rhs_6b13_Flora_6sh92_vog",
	"rhs_6b13_Flora_crewofficer",
	"rhs_6sh46"
];

_backpacks = [
	"rhs_sidor",
	"B_Carryall_oli",
	"rhs_assault_umbts",
	"rhs_assault_umbts_demo",
	"rhs_rpg_empty",
	"RHS_M2_Tripod_Bag",
	"",
	"",
	"",
	"",
	""
];

_unit addHeadgear selectRandom _headgear;
_unit addVest selectRandom _vests;
_unit addBackpack selectRandom _backpacks;
