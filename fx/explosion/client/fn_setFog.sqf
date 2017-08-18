params ["_delay","_params"];

_delay setFog _params;

[{setViewDistance 1000;}, [], _delay] call CBA_fnc_waitAndExecute;