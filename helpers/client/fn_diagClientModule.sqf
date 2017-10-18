missionNamespace setVariable ["suomen_helpers_updateFPS",!(missionNamespace getVariable ["suomen_helpers_updateFPS",false]),true];

if (suomen_helpers_updateFPS) then {[suomen_helpers_updateFPS] remoteExec ["suomen_helpers_fnc_diagClientModule_updateFPS",0,false]};
[suomen_helpers_updateFPS] remoteExec ["suomen_helpers_fnc_diagClientModule_drawFPS",0,false];

[objNull, format ["Client FPS Anzeige für alle Zeuse %1.",if (suomen_helpers_updateFPS) then {"eingeschaltet"} else {"ausgeschaltet"}]] call bis_fnc_showCuratorFeedbackMessage;
