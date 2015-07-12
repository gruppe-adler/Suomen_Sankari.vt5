_randUniformRussian = 
[
"rhs_uniform_emr_patchless"
] call BIS_fnc_selectRandom;

_randVestRussian = 
[
"rhs_6b23_digi",
"rhs_6b23_digi_6sh92",
"rhs_6b23_digi_6sh92_headset_mapcase",
"rhs_6b23_digi_6sh92_radio",
"rhs_6b23_digi_6sh92_vog",
"rhs_6b23_digi_6sh92_vog_headset",
"rhs_6b23_digi_crewofficer",
"rhs_6b23_digi_crew",
"rhs_6b23_digi_engineer",
"rhs_6b23_digi_unitdic",
"rhs_6b23_digi_rifleman",
"rhs_6b23_digi_sniper"
] call BIS_fnc_selectRandom;

_randHeadGearRussian =
[
"rhs_6b27m_digi",
"rhs_6b27m_digi_bala",
"rhs_6b27m_digi_ess",
"rhs_6b27m_digi_ess_bala"
] call BIS_fnc_selectRandom;

_randHeadGearRussianOfficer =
[
"rhs_fieldcap_digi",
"rhs_fieldcap_helm_digi"
] call BIS_fnc_selectRandom;

_randBackPackRussian = [
"rhs_sidor",
"B_Carryall_oli",
"rhs_assault_umbts",
"rhs_assault_umbts_demo",
"rhs_rpg_empty"
] call BIS_fnc_selectRandom;

_unit = _this select 0;

//_unit forceAddUniform _randUniformRussian;
_unit addVest _randVestRussian;
_unit addHeadgear _randHeadGearRussian;
_unit addBackpack _randBackPackRussian;

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
