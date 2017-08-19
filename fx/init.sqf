SUOMEN_EXPLOSION_TIMER = 3;

[[3231.702, 3531.233],270] call suomen_fx_fnc_steamLeak;
[leakpos, 20, {NUKE_DETONATE}] call suomen_fx_fnc_gasEffectsAdd;

if (isServer) then {
	call suomen_fx_fnc_bombLoop;
	call suomen_fx_fnc_initCrows;
};