SUOMEN_EXPLOSION_TIMER = 3;

[getPos leakpos,270] call suomen_fx_fnc_steamLeak;
[leakpos, 20, {NUKE_DETONATE}] call suomen_fx_fnc_gasEffectsAdd;

if (isServer) then {
	call suomen_fx_fnc_bombLoop;
	/* call suomen_fx_fnc_initCrows;*/ // todo: think of something more performant without fired EH
};