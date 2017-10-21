
class Loadouts {
perPlayerDelay = 0;
baseDelay = 0;
handleRadios = 1;

class Type {
	class O_Survivor_F {
		binoculars = "Binocular";
		map = "ItemMap";
		compass = "ItemCompass";
		watch = "ItemWatch";
		primaryWeapon = "";

		handgunWeapon = "rhs_weap_makarov_pmm";
		handgunWeaponMagazine = "rhs_mag_9x18_12_57N181S";
		addItemsToUniform[] = {"rhs_mag_9x18_12_57N181S", "rhs_mag_9x18_12_57N181S"};
		nvgoggles = "";
		gps = "";
		vest = "";
	};
};

class Name {
		/* studenten */
		class santeri {
			uniform = "rds_uniform_citizen1";
			headgear = "rds_worker_cap2";
			goggles = "NeckTight_WhiteCLR";
			backpack = "B_Messenger_Coyote_F";
			addItemsToUniform[] = {
			    "ACE_surgicalKit"
			};
			addItemsToBackpack[] = {
			    LIST_4("ACE_salineIV"),
			    LIST_8("ACE_salineIV_500"),
			    LIST_20("ACE_elasticBandage"),
			    LIST_20("ACE_packingBandage"),
			    LIST_20("ACE_quikclot"),
			    LIST_8("ACE_tourniquet"),
			    LIST_25("ACE_morphine"),
			    LIST_25("ACE_epinephrine")
			};
		};

		class marek {
			uniform = "rds_uniform_citizen2";
			headgear = "rds_Profiteer_cap1";
			backpack = "B_Messenger_Olive_F";
			addItemsToUniform[] = {
			    "ACE_surgicalKit"
			};
			addItemsToBackpack[] = {
			    LIST_4("ACE_salineIV"),
			    LIST_8("ACE_salineIV_500"),
			    LIST_20("ACE_elasticBandage"),
			    LIST_20("ACE_packingBandage"),
			    LIST_20("ACE_quikclot"),
			    LIST_8("ACE_tourniquet"),
			    LIST_25("ACE_morphine"),
			    LIST_25("ACE_epinephrine")
			};
		};

		class fritjof {
			uniform = "rds_uniform_citizen3";
			headgear = "rds_Profiteer_cap1";
			backpack = "B_Messenger_Black_F";
			addItemsToUniform[] = {
			    "ACE_surgicalKit"
			};
			addItemsToBackpack[] = {
			    LIST_4("ACE_salineIV"),
			    LIST_8("ACE_salineIV_500"),
			    LIST_20("ACE_elasticBandage"),
			    LIST_20("ACE_packingBandage"),
			    LIST_20("ACE_quikclot"),
			    LIST_8("ACE_tourniquet"),
			    LIST_25("ACE_morphine"),
			    LIST_25("ACE_epinephrine")
			};
		};

		class lenni {
			uniform = "rds_uniform_citizen4";
			headgear = "rds_Profiteer_cap1";
			backpack = "B_Messenger_Gray_F";
			addItemsToUniform[] = {
			    "ACE_surgicalKit"
			};
			addItemsToBackpack[] = {
			    LIST_4("ACE_salineIV"),
			    LIST_8("ACE_salineIV_500"),
			    LIST_20("ACE_elasticBandage"),
			    LIST_20("ACE_packingBandage"),
			    LIST_20("ACE_quikclot"),
			    LIST_8("ACE_tourniquet"),
			    LIST_25("ACE_morphine"),
			    LIST_25("ACE_epinephrine")
			};
		};


		/* arbeiter */
		class tommi {
			uniform = "rds_uniform_Profiteer1";
	        headgear = "H_Cap_khaki_specops_UK";
			goggles = "G_Aviator";
			primaryWeapon = "rhs_weap_M590_5RD";
			addItemsToUniform[] = {
				"rhsusf_5Rnd_00Buck",
				"rhsusf_5Rnd_00Buck",
				"rhsusf_5Rnd_00Buck"
			};
		};

		class mari {
			uniform = "rds_uniform_Profiteer2";
			headgear = "H_Bandanna_gry";
			goggles = "L_Shemagh_Tan";
			primaryWeapon = "rhs_weap_M590_5RD";
			addItemsToUniform[] = {
				"rhsusf_5Rnd_00Buck",
				"rhsusf_5Rnd_00Buck",
				"rhsusf_5Rnd_00Buck"
			};
		};

		class antti {
			uniform = "rds_uniform_Profiteer3";
			headgear = "rds_Woodlander_cap1";
			goggles = "";
			primaryWeapon = "rhs_weap_M590_8RD";
			addItemsToUniform[] = {
				"rhsusf_5Rnd_00Buck",
				"rhsusf_5Rnd_00Buck",
				"rhsusf_5Rnd_00Buck"
			};
		};

		class pekka {
			uniform = "rds_uniform_Profiteer4";
			headgear = "H_Bandanna_sgg";
			goggles = "L_Shemagh_OD";
			primaryWeapon = "rhs_weap_M590_8RD";
			addItemsToUniform[] = {
				"rhsusf_5Rnd_00Buck",
				"rhsusf_5Rnd_00Buck",
				"rhsusf_5Rnd_00Buck"
			};
		};


		/* bikergang */
		class henrik {
			uniform = "rds_uniform_Rocker1";
	        headgear = "rds_rocker_hair1";
			goggles = "G_Aviator";
			handgunWeapon = "hgun_Pistol_heavy_02_F";
			handGunWeaponPointer = "acc_flashlight_pistol";
			addItemsToUniform[] = {
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder"
			};
		};

		class toini {
			uniform = "rds_uniform_Rocker2";
			headgear = "rds_rocker_hair2";
			goggles = "L_Shemagh_Tan";
			handgunWeapon = "hgun_Pistol_heavy_02_F";
			handGunWeaponPointer = "acc_flashlight_pistol";
			addItemsToUniform[] = {
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder"
			};
		};

		class mikael {
			uniform = "rds_uniform_Rocker3";
			headgear = "rds_rocker_hair3";
			goggles = "";
			handgunWeapon = "hgun_Pistol_heavy_02_F";
			handGunWeaponPointer = "acc_flashlight_pistol";
			addItemsToUniform[] = {
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder"
			};
		};

		class rasmus {
			uniform = "rds_uniform_Rocker4";
			headgear = "rds_rocker_hair1";
			goggles = "L_Shemagh_OD";
			handgunWeapon = "hgun_Pistol_heavy_02_F";
			handGunWeaponPointer = "acc_flashlight_pistol";
			addItemsToUniform[] = {
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder"
			};
		};

		class samu {
			uniform = "rhs_uniform_gorka_r_g";
	        headgear = "H_Bandanna_sgg";
			goggles = "TRYK_Beard_BK";
			handgunWeapon = "hgun_Pistol_heavy_02_F";
			handGunWeaponPointer = "acc_flashlight_pistol";
			addItemsToUniform[] = {
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder"
			};
		};

		class ukko {
			uniform = "rhs_uniform_gorka_r_y";
			headgear = "L_Shemagh_OD";
			goggles = "L_Shemagh_Tan";
			handgunWeapon = "hgun_Pistol_heavy_02_F";
			handGunWeaponPointer = "acc_flashlight_pistol";
			addItemsToUniform[] = {
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder"
			};
		};

		class jani {
			uniform = "U_I_C_Soldier_Para_4_F";
			headgear = "rds_rocker_hair3";
			goggles = "TRYK_Beard";
			handgunWeapon = "hgun_Pistol_heavy_02_F";
			handGunWeaponPointer = "acc_flashlight_pistol";
			addItemsToUniform[] = {
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder"
			};
		};

		class herkko {
			uniform = "U_B_GEN_Commander_F";
			headgear = "rds_rocker_hair2";
			goggles = "TRYK_Beard_BW";
			handgunWeapon = "hgun_Pistol_heavy_02_F";
			handGunWeaponPointer = "acc_flashlight_pistol";
			addItemsToUniform[] = {
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder",
				"6Rnd_45ACP_Cylinder"
			};
		};



		
		
		/* azubis */
		class ville {
			uniform = "rds_uniform_Woodlander1";
			headgear = "H_Watchcap_blk";
			goggles = "";
			addItemsToUniform[] = {"rhs_mag_9x18_12_57N181S", "murshun_cigs_lighter", "murshun_cigs_cigpack"};
			nvgoggles = "SAN_Headlamp_v2";
		};

		class marco {
			uniform = "rds_uniform_Woodlander2";
			headgear = "H_Beret_blk";
			goggles = "";
			addItemsToUniform[] = {"rhs_mag_9x18_12_57N181S", "murshun_cigs_lighter", "murshun_cigs_cigpack"};
			nvgoggles = "SAN_Headlamp_v2";
		};

		class esa {
			uniform = "rds_uniform_Woodlander3";
			headgear = "H_Hat_Safari_olive_F";
			goggles = "";
			addItemsToUniform[] = {"rhs_mag_9x18_12_57N181S", "murshun_cigs_lighter", "murshun_cigs_cigpack"};
			nvgoggles = "SAN_Headlamp_v2";
		};

		class emppu {
			uniform = "rds_uniform_Woodlander4";
			headgear = "rhs_beanie_green";
			goggles = "";
			addItemsToUniform[] = {"rhs_mag_9x18_12_57N181S", "murshun_cigs_lighter", "murshun_cigs_cigpack"};
			nvgoggles = "SAN_Headlamp_v2";
		};


		/* nerds */
		class kimmo {
			uniform = "U_C_Mechanic_01_F";
			headgear = "H_Booniehat_khk";
			radio = "tf_rf7800str";
			goggles = "G_EyeProtectors_F";
			gps = "ItemGPS";
		};

		class janne {
			uniform = "U_BG_Guerrilla_6_1";
			headgear = "rds_Villager_cap4";
			goggles = "immersion_pops_pop0";
			radio = "tf_rf7800str";
			gps = "ItemGPS";
		};

		class eino {
			uniform = "U_BG_Guerilla2_2";
			headgear = "rds_worker_cap3";
			goggles = "rhs_ess_black";
			radio = "tf_rf7800str";
			gps = "ItemGPS";
		};
		
		class hemmo {
			uniform = "U_BG_Guerilla3_1";
			headgear = "rds_worker_cap3";
			radio = "tf_rf7800str";
			goggles = "G_Sport_Greenblack";
			gps = "ItemGPS";
		};
		

		/* proleten */
		class sampo {
			uniform = "rds_uniform_Worker1";
			headgear = "H_Bandanna_gry";
			addItemsToUniform[] = {"murshun_cigs_lighter", "murshun_cigs_cigpack"};
		};

		class tuomas {
			uniform = "rds_uniform_Worker2";
			headgear = "rhs_Booniehat_m81";
			addItemsToUniform[] = {"murshun_cigs_lighter", "murshun_cigs_cigpack"};
		};

		class ilpo {
			uniform = "rds_uniform_Worker3";
			headgear = "H_Booniehat_khk";
			addItemsToUniform[] = {"murshun_cigs_lighter", "murshun_cigs_cigpack"};
		};

		class ossi {
			uniform = "rds_uniform_Worker4";
			headgear = "rds_Woodlander_cap4";
			addItemsToUniform[] = {"murshun_cigs_lighter", "murshun_cigs_cigpack"};
		};

		

		/* bauer */
		class frederik {
			uniform = "rds_uniform_Villager1";
			headgear = "rhs_Booniehat_m81";
			primaryWeapon = "rhs_weap_kar98k";
			addItemsToUniform[] = {
				"rhsgref_5Rnd_792x57_kar98k",
				"rhsgref_5Rnd_792x57_kar98k",
				"rhsgref_5Rnd_792x57_kar98k"
			};
		};

		class pasi {
			uniform = "rds_uniform_Villager2";
			headgear = "rhs_Booniehat_m81";
			goggles = "L_Shemagh_Red";
			primaryWeapon = "rhs_weap_kar98k";
			addItemsToUniform[] = {
				"rhsgref_5Rnd_792x57_kar98k",
				"rhsgref_5Rnd_792x57_kar98k",
				"rhsgref_5Rnd_792x57_kar98k"
			};
		};


		/* bus drivers */

		class kalle {
			uniform = "U_B_GEN_Soldier_F";
			headgear = "H_Cap_blu";
			goggles = "";
			 addItemsToUniform[] = {"murshun_cigs_matches", "murshun_cigs_cigpack"};
		};

		class emil {
			uniform = "U_B_GEN_Soldier_F";
			headgear = "H_Cap_red";
			goggles = "L_Shemagh_Red";
		};

		class klaus {
			uniform = "U_B_GEN_Soldier_F";
			headgear = "H_MilCap_blue";
			goggles = "";
		};
	};
};