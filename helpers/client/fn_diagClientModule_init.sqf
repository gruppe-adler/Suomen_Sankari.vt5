if !(missionNamespace getVariable ["suomen_helpers_updateFPS",false]) exitWith {};

[true] call suomen_helpers_fnc_diagClientModule_updateFPS;
[true] call suomen_helpers_fnc_diagClientModule_drawFPS;