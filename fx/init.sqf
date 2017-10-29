SUOMEN_EXPLOSION_TIMER = 25;

[getPos leakpos,270] call suomen_fx_fnc_steamLeak;


if (isServer) then {
	call suomen_fx_fnc_bombLoop;
	/* call suomen_fx_fnc_initCrows;*/ // todo: think of something more performant without fired EH
};