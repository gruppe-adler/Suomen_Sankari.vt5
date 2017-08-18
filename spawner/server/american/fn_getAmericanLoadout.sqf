params ["_unit"];

_headgear = [
	"rhsusf_mich_helmet_marpatwd_alt",
	"rhsusf_mich_helmet_marpatwd",
	"rhsusf_mich_helmet_marpatwd_norotos",
	"rhsusf_mich_helmet_marpatwd_norotos_arc"
];

_vests = [
	"rhsusf_spc",
	"V_Rangemaster_belt",
	"V_BandollierB_cbr",
	"V_BandollierB_khk"
];


_backpacks = [
	"B_AssaultPack_Kerry",
	"B_Kitbag_mcamo",
	"rhsusf_falconii",
	"rhsusf_falconii"
];


_unit addHeadgear selectRandom _headgear;
_unit addVest selectRandom _vests;
_unit addBackpack selectRandom _backpacks;