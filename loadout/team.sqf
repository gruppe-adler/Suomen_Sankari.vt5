_unit = _this select 0;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;


switch (str _unit) do {
	case "tommi":	{
		_unit forceAddUniform "rds_uniform_citizen2";
		_unit addHeadgear "H_Cap_khaki_specops_UK";
		_unit addGoggles "G_Aviator";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_unit addWeapon "rhsusf_weap_m1911a1";
	};

	case "kalle":	{
		_unit forceAddUniform "rds_uniform_citizen1";
		_unit addHeadgear "rhs_Booniehat_m81";
		_unit addGoggles "L_Shemagh_Red";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_unit addWeapon "rhsusf_weap_m1911a1";
	
	};

	case "marek":	{
		_unit forceAddUniform "rds_uniform_citizen3";
		_unit addHeadgear "rds_Profiteer_cap1";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_unit addWeapon "rhsusf_weap_m1911a1";
	};
	
	case "santeri": {
		_unit forceAddUniform "rds_uniform_citizen4";
		_unit addHeadgear "rds_worker_cap2";
		_unit addGoggles "NeckTight_WhiteCLR";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_unit addWeapon "rhsusf_weap_m1911a1";
	};
	
	case "esa":	{
		_unit forceAddUniform "U_BG_Guerrilla_6_1";
		_unit addHeadgear "rds_worker_cap3";
		_unit addGoggles "L_Shemagh_Red";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_unit addWeapon "rhsusf_weap_m1911a1";
	};
	
	case "mari":	{
		_unit forceAddUniform "U_BG_Guerilla2_2";
		_unit addHeadgear "H_Bandanna_gry";
		_unit addGoggles "L_Shemagh_Tan";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_unit addWeapon "rhsusf_weap_m1911a1";
	};

	case "pekka":	{
		_unit forceAddUniform "U_BG_Guerilla2_3";
		_unit addHeadgear "H_Bandanna_sgg";
		_unit addGoggles "L_Shemagh_OD";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_unit addWeapon "rhsusf_weap_m1911a1";
	};

	case "ville":	{
		_unit forceAddUniform "U_BG_Guerilla3_1";
		_unit addHeadgear "H_Watchcap_blk";
		_unit addGoggles "L_Shemagh_Gry";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhsusf_mag_7x45acp_MHP";};
		_unit addWeapon "rhsusf_weap_m1911a1";
	};

	case "marco":	{
		_unit forceAddUniform "rds_uniform_Profiteer4";
		_unit addHeadgear "H_Beret_blk";
		_unit addGoggles "L_Shemagh_OD";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
		_unit addWeapon "rhs_weap_makarov_pmm";
	};

	case "emppu":	{
		_unit forceAddUniform "rds_uniform_schoolteacher";
		_unit addHeadgear "rhs_beanie_green";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
		_unit addWeapon "rhs_weap_makarov_pmm";
	};

	case "janne":	{
		_unit forceAddUniform "rds_uniform_Villager3";
		_unit addHeadgear "rds_Villager_cap4";
		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
		_unit addWeapon "rhs_weap_makarov_pmm";
	};

	default {
		

		_uniforms = [
		"rds_uniform_Woodlander1",
		"rds_uniform_Woodlander2",
		"rds_uniform_Woodlander3",
		"rds_uniform_Woodlander4",
		"rds_uniform_Profiteer1",
		"rds_uniform_Profiteer2",
		"rds_uniform_Profiteer3",
		"LOP_U_AFR_Fatigue_02"
		];

		_headgears = [
		"rds_worker_cap1",
		"rds_worker_cap2",
		"rds_worker_cap3",
		"rds_Woodlander_cap1",
		"rds_Woodlander_cap2",
		"rds_Woodlander_cap3",
		"rds_Woodlander_cap4",
		"H_Booniehat_khk"
		];

		_goggles = [
		"L_Shemagh_Gry",
		"L_Shemagh_OD",
		"L_Shemagh_Red",
		"L_Shemagh_Tan"
		];

		_unit forceAddUniform (_uniforms call BIS_fnc_selectRandom);
		_unit addHeadgear (_headgears call BIS_fnc_selectRandom);

		if (random 2 > 1) then {_unit addGoggles (_goggles call BIS_fnc_selectRandom);};

		for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_9x18_12_57N181S";};
		_unit addWeapon "rhs_weap_makarov_pmm";

	};
};

sleep (random 1);
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "tf_rf7800str";