randUniformUSMC = 
[
"rhs_uniform_FROG01_wd"
];

randVestUSMC = 
[
"rhsusf_spc",
"V_Rangemaster_belt",
"V_BandollierB_cbr",
"V_BandollierB_khk"
];

randHeadGearUSMC =
[
"rhsusf_mich_helmet_marpatwd_alt",
"rhsusf_mich_helmet_marpatwd",
"rhsusf_mich_helmet_marpatwd_norotos",
"rhsusf_mich_helmet_marpatwd_norotos_arc"
];

randBackPackUSMC = [
"B_AssaultPack_Kerry",
"B_Kitbag_mcamo",
"rhsusf_falconii",
"rhsusf_falconii"
];

_unit = _this select 0;

//_unit forceAddUniform (randUniformUSMC call BIS_fnc_selectRandom);
_unit addVest (randVestUSMC call BIS_fnc_selectRandom);
_unit addHeadgear (randHeadGearUSMC call BIS_fnc_selectRandom);
_unit addBackpack (randBackPackUSMC call BIS_fnc_selectRandom);

setZomboyFace = 
{ 
	_thisunit = _this select 0;
	_face = _this select 1;
	_thisunit setFace _face;
	_thisunit disableConversation true;
	enableSentences false;
	_thisunit setVariable ["BIS_noCoreConversations", true];
	_thisunit setObjectMaterial [0, "A3\Characters_F\Common\Data\basicbody_injury.rvmat"];
};
_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_unit,_chosenFace], "setZomboyFace"] call BIS_fnc_MP;

_selectZombFace= random 4;
if(_selectZombFace < 1) then
{
	[[_unit,"zomboy"], "setZomboyFace"] call BIS_fnc_MP;
};
if((_selectZombFace >= 1)and(_selectZombFace < 2)) then
{
	[[_unit,"zombi"], "setZomboyFace"] call BIS_fnc_MP;
};	
if((_selectZombFace >= 2)and(_selectZombFace < 3)) then
{
	[[_unit,"infected1"], "setZomboyFace"] call BIS_fnc_MP;
};
if(_selectZombFace >= 3) then
{
	[[_unit,"infected2"], "setZomboyFace"] call BIS_fnc_MP;
};		
