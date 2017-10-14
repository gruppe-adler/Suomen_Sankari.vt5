
if (HEADLESS_CONNECTED) then {
	[25, "mrk_spawn_crowd"] remoteExec ["suomen_spawner_fnc_spawnAmericanZombieCrowd", suomen_headless];
	[15, "mrk_spawn_crowd2"] remoteExec ["suomen_spawner_fnc_spawnAmericanZombieCrowd", suomen_headless];
	[15, "mrk_spawn_crowd3"] remoteExec ["suomen_spawner_fnc_spawnAmericanZombieCrowd", suomen_headless];
} else {
	[25, "mrk_spawn_crowd"] spawn suomen_spawner_fnc_spawnAmericanZombieCrowd; 
	[15, "mrk_spawn_crowd2"] spawn suomen_spawner_fnc_spawnAmericanZombieCrowd; 
	[15, "mrk_spawn_crowd3"] spawn suomen_spawner_fnc_spawnAmericanZombieCrowd;
};