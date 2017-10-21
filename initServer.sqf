[[transporter_1, transporter_2, transporter_3]] spawn suomen_mission_fnc_setTaskTrigger;
/*
[trg_border_finnish_out, finnish_gate_out, "mrk_guard_1", 213, "finnish"] call
suomen_spawner_fnc_border_createBorderCrossing;
*/
[car_ambulance,0.25,true] remoteExec ["suomen_fx_fnc_addBlueLight", allPlayers];

HEADLESS_CONNECTED = false;

GAS_EFFECTED = 0;
publicVariable "GAS_EFFECTED";

GASMASK_FOUND = false;
publicVariable "GASMASK_FOUND";

COMRADES_FOUND = false;
publicVariable "COMRADES_FOUND";

NUKE_DETONATE = false;
publicVariable "NUKE_DETONATE";

GASSTATION_ACTION = false;
publicVariable "GASSTATION_ACTION";

RADIO_PLAYING = false;
publicVariable "RADIO_PLAYING";

LIGHT_ON = false;
publicVariable "LIGHT_ON";

ALL_IN_CARS = false;
publicVariable "ALL_IN_CARS";

MISSION_FAILED = false;

MISSION_COMPLETED = false;
publicVariable "MISSION_COMPLETED";


sleep 1;
removeAIEventhandlers = {
	{
	_x removeAllEventHandlers "killed";
	_x removeAllEventHandlers "FiredNear";
	} forEach allUnits;
};

{
	if (!isPlayer _x) then {
		_x addEventHandler["killed", {if (isPlayer (_this select 1)) then { 
			[] call removeAIEventhandlers; [] call suomen_mission_fnc_setEnemiesDetected;
		};}];

		_x addEventHandler["FiredNear", {
			if (isPlayer (_this select 1)) then { 
				[] call removeAIEventhandlers; [] call suomen_mission_fnc_setEnemiesDetected; 
		};}];
	}
} forEach allUnits;

diag_log "killed eventhandler added for every ai unit";