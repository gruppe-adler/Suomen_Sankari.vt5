/*  written by DriftingNitro
*   modified by McDiod
*/

params ["_onOff"];

if (isNull (getAssignedCuratorLogic player)) exitWith {};
suomen_helpers_updateFPS = _onOff;

//stop
if !(suomen_helpers_updateFPS) then {
    suomen_helpers_drawFPS_running = false;
    removeMissionEventHandler ["Draw3D", missionNamespace getVariable ["suomen_helpers_drawFPSEH",-1]];

//run
} else {
    if (missionNamespace getVariable ["suomen_helpers_drawFPS_running",false]) exitWith {};

    suomen_helpers_drawFPS_running = true;
    suomen_helpers_drawFPSEH = addMissionEventHandler ["Draw3D", {
    	{
    		_distance = position curatorCamera distance _x;
    		if (_distance > 1200) exitWith {};

			_playerFPS = _x getVariable ["suomen_helpers_playerFPS",-1];
			_textSettings = if (_playerFPS < 20) then {[[1,0,0,0.7],0.04]} else {[[1,1,1,0.5],0.03]};
            _textSettings params ["_color","_size"];
			drawIcon3D ["",_color,position _x,1,2,0,format["%1 FPS: %2", name _x, str _playerFPS],0,_size,"RobotoCondensed","center"];

            false
    	} count allPlayers;
    }];
};
