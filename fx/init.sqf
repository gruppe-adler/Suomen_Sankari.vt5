[leakpos,15,200] spawn suomen_fx_fnc_fogInitial;
[leakpos,20] execVM "gasmask\gas.sqf";
[[3231.702, 3531.233],270] call suomen_fx_fnc_steamLeak;

if (isServer) then {
	call suomen_fx_fnc_bombLoop;
	call suomen_fx_fnc_initCrows;
};