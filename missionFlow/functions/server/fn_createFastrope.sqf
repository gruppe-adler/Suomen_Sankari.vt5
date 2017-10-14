
if (HEADLESS_CONNECTED) then {
	[getPos pos_helifastrope_start, 
	pos_helifastrope_rope, 
	getPos pos_helifastrope_target
	] remoteExec ["suomen_spawner_fnc_createHelifastrope", suomen_headless];
} else {
	[getPos pos_helifastrope_start, pos_helifastrope_rope, getPos pos_helifastrope_target] spawn suomen_spawner_fnc_createHelifastrope;
};