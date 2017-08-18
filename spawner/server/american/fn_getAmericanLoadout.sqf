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

_unit setUnitLoadout [[],[],["rhs_weap_makarov_pmm","","","",["rhsusf_mag_7x45acp_MHP",7],[],""],[],
[selectRandom _vests,[]],
[selectRandom _backpacks,[]],
selectRandom _headgear,"",["Binocular","","","",[],[],""],
["ItemMap","","","ItemCompass","",""]];
