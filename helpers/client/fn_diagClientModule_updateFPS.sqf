/*  written by DriftingNitro
*   modified by McDiod
*/

params ["_onOff"];

suomen_helpers_updateFPS = _onOff;
if !(suomen_helpers_updateFPS) exitWith {};

if (missionNamespace getVariable ["suomen_helpers_updateFPS_running",false]) exitWith {};
suomen_helpers_updateFPS_running = true;

[{
    params ["_args","_handle"];
    if !(suomen_helpers_updateFPS) exitWith {suomen_helpers_updateFPS_running = false; [_handle] call CBA_fnc_removePerFrameHandler};

    player setVariable ["suomen_helpers_playerFPS", round diag_fps, true];
} , 1, []] call CBA_fnc_addPerFrameHandler;
