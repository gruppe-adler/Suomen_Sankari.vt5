params ["_delay","_value"];

[{setViewDistance (_this select 0);}, [_value], _delay] call CBA_fnc_waitAndExecute;