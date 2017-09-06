tapes = 
	[
	tape1,
	tape2,
	tape3,
	tape4,
	tape5,
	tape6,
	tape7,
	tape8,
	tape9,
	tape10,
	tape11
	];

{deleteVehicle _x} forEach tapes;

private ["_root"];

_root = parsingNamespace getVariable "MISSION_ROOT";
[nukepos, ["fat_explosion", 500]] remoteExec ["say3D", allPlayers];
playSound3D [_root + "sounds\windsound.ogg", nukepos, false, getPosASL nukepos, 15, 0.5, 500];
[25] call suomen_spawner_fnc_spawnAmericanZombiesAlongRoads;


deleteVehicle explosion_target_top;
explosion_target_bottom setPos [getPos explosion_target_bottom select 0, getPos explosion_target_bottom select 1, -9.5];

// debris

_orepile1 = createVehicle ["Land_SY_01_stockpile_02_F", [3263.5,3495.05,0.0163422], [], 0, "CAN_COLLIDE"];
_orepile2 = createVehicle ["Land_SY_01_stockpile_02_F", [3263.29,3495.28,0], [], 0, "CAN_COLLIDE"];
_orepile2 setDir 80;


_jussiCar = [getMarkerPos "mrk_jussi"] call suomen_spawner_fnc_createJussiCar;


[{
_this doorPhase "trunk" == 1
}, 
{
	[_this] call suomen_spawner_fnc_releaseJussi;
}, 
_jussiCar
] call CBA_fnc_waitUntilAndExecute;

[{
	EXTRACTION_IMMINENT
}, 
{
	[getMarkerPos "mrk_doc"] call suomen_spawner_fnc_createDoc;
}, 
[]
] call CBA_fnc_waitUntilAndExecute;

[{
	EXTRACTION_IMMINENT
}, 
{
	MISSION_COMPLETED = true; 
	publicVariable "MISSION_COMPLETED"; 
	60 setFog [0,0,0];

	[   east,
            ["tsk_evacuate"],
            [
                "This is hell... try to find a boat and escape. Check the angling club.",
                "This is hell... try to find a boat and escape.",
                ""
            ],
            "",
            "CREATED",
            2,
            true
	] call BIS_fnc_taskCreate;
	["tsk_evacuate","boat"] call BIS_fnc_taskSetType;
	["tsk_evacuate","ASSIGNED",true] call BIS_fnc_taskSetState;
}, 
[]
] call CBA_fnc_waitUntilAndExecute;



[{
	END_MISSION
}, 
{
	["tsk_evacuate","SUCCEEDED",true] call BIS_fnc_taskSetState;
}, 
[]
] call CBA_fnc_waitUntilAndExecute;



[   east,
            ["tsk_extract"],
            [
                "Wow, that explosion! Retreat back to your hideout.",
                "Wow, that explosion! Retreat back to your hideout.",
                ""
            ],
            "",
            "CREATED",
            2,
            true
] call BIS_fnc_taskCreate;
["tsk_extract","run"] call BIS_fnc_taskSetType;
["tsk_extract","ASSIGNED",true] call BIS_fnc_taskSetState;