[trg_areaCleaner_3] spawn suomen_mission_fnc_deleteAllUnitsInTrigger;

if (HEADLESS_CONNECTED) then {

	[getMarkerPos "mrk_priest"] remoteExec ["suomen_spawner_fnc_createPriest", suomen_headless];
	[40] remoteExec ["suomen_spawner_fnc_createCivilianCrowd", suomen_headless];
	
	["GRAD_CivilianZed_rds_uniform_citizen1_walker", 
	"Rabbit_F", 
	"mrk_carrier_spawn", 
	"mrk_carrier_target"] remoteExec ["suomen_spawner_fnc_createGoatCarrier", suomen_headless];

	["GRAD_CivilianZed_rds_uniform_citizen2_slow", 
	"Cock_random_F", 
	"mrk_carrier_spawn", 
	"mrk_carrier_target"] remoteExec ["suomen_spawner_fnc_createGoatCarrier", suomen_headless];
} else {
	[getMarkerPos "mrk_priest"] call suomen_spawner_fnc_createPriest; 
	[40] spawn suomen_spawner_fnc_createCivilianCrowd;

	["GRAD_CivilianZed_rds_uniform_citizen1_walker", 
	"Rabbit_F", 
	"mrk_carrier_spawn", 
	"mrk_carrier_target"] call suomen_spawner_fnc_createGoatCarrier; 

	["GRAD_CivilianZed_rds_uniform_citizen2_slow", 
	"Cock_random_F", 
	"mrk_carrier_spawn", 
	"mrk_carrier_target"] call suomen_spawner_fnc_createGoatCarrier;
};