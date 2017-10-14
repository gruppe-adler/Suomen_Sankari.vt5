params ["_vehicleArray"];

// CREATE TASKS
// _owner,_taskid,_texts,_destination,_state,_priority,_showNotification,_taskType,_alwaysVisible

sleep 10;
// jussi
[   east,
    ["tsk_findComrades"],
    [
        "Find your comrade Jussi",
        "Find Jussi and bring him back",
        ""
    ],
    objNull,
    "ASSIGNED",
    2,
    true
] call BIS_fnc_taskCreate;
["tsk_findComrades","search"] call BIS_fnc_taskSetType;

sleep 20;
[   east,
    ["tsk_ikarus"],
    [
        "Meet Kalle and the others and get in the Vans to drive over the border in disguise.",
        "Meet Kalle and the others and get in the Vans.",
        ""
    ],
    objNull,
    "ASSIGNED",
    2,
    true
] call BIS_fnc_taskCreate;
["tsk_ikarus","meet"] call BIS_fnc_taskSetType;
   
// ALL DEAD
[{
    params ["_args", "_handle"];
    
    _allDead = (({side _x != civilian} count playableUnits) + ({side _x != civilian} count switchableUnits) == 0);

    // hintSilent format ["%1", _playersInVehicles];

    if (_allDead) then {
        MISSION_FAILED = true;

        ["tsk_evacuate","FAILED",true] call BIS_fnc_taskSetState;
        ["tsk_extract","FAILED",true] call BIS_fnc_taskSetState;
        ["tsk_findComrades","CANCELED",true] call BIS_fnc_taskSetState;
        ["tsk_findGasmasks","CANCELED",true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;

// GET IN VANS
[{
    params ["_args", "_handle"];
    _args params ["_vehicleArray"];
    
    _playersInVehicles = 0;
   	{
    	_vehicle = _x;
    	_playersInVehicles = _playersInVehicles + ({_x in _vehicle} count allPlayers);
    } forEach _vehicleArray;

    // hintSilent format ["%1", _playersInVehicles];

    if (_playersInVehicles == east countSide allPlayers) then {
    	["tsk_ikarus","SUCCEEDED",true] call BIS_fnc_taskSetState;

    	[
    		"mrk_civheli_start",
    		"mrk_civheli_end",
    		"C_Heli_Light_01_civil_F",
    		"NORMAL"
    	] 
    	call suomen_spawner_fnc_createHelicopter;


    	[_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[_vehicleArray]] call CBA_fnc_addPerFrameHandler;


// FIND GASMASKS assign
[{
    params ["_args", "_handle"];
    
    if (GAS_EFFECTED > 3) then {
        [   east,
            ["tsk_findGasmasks"],
            [
                "Find gasmasks to protect yourself. They must be stored somewhere.",
                "Find gasmasks to protect yourself",
                ""
            ],
            objNull,
            "CREATED",
            2,
            true
        ] call BIS_fnc_taskCreate;
        ["tsk_findGasmasks","search"] call BIS_fnc_taskSetType;
        ["tsk_findGasmasks","ASSIGNED",true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;


// FIND GASMASKS SUCCEED
[{
    params ["_args", "_handle"];
    
    if (GASMASK_FOUND) then {
        ["tsk_findGasmasks","SUCCEEDED",true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;


// EXTRACT ASSIGNED
[{
    params ["_args", "_handle"];
    
    if (NUKE_DETONATE) then {
        [   east,
            ["tsk_extract"],
            [
                "Wow, that explosion! Retreat back to your hideout.",
                "Wow, that explosion! Retreat back to your hideout.",
                ""
            ],
            "",
            "ASSIGNED",
            2,
            true
        ] call BIS_fnc_taskCreate;
        ["tsk_extract","run"] call BIS_fnc_taskSetType;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},5,[]] call CBA_fnc_addPerFrameHandler;




// FIND JUSSI CANCEL
[{
    params ["_args", "_handle"];
    
    if (NUKE_DETONATE) then {
        ["tsk_findComrades","CANCELED",true] call BIS_fnc_taskSetState;
        ["tsk_extract", "ASSIGNED", true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;


// EXTRACT SUCCEED
[{
    params ["_args", "_handle"];
    
    if (MISSION_COMPLETED) then {
        ["tsk_extract","SUCCEEDED",true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;

// EVACUATE CREATE
[{
    params ["_args", "_handle"];
    
    if (FIGHT) then {
         [   east,
                    ["tsk_evacuate"],
                    [
                        "This is hell... try to find a boat and escape. Check the angling club.",
                        "This is hell... try to find a boat and escape.",
                        ""
                    ],
                    objNull,
                    "ASSIGNED",
                    2,
                    true
            ] call BIS_fnc_taskCreate;
        ["tsk_evacuate","boat"] call BIS_fnc_taskSetType;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;


// CREATE DOC
[{
    params ["_args", "_handle"];

    if (EXTRACTION_IMMINENT) then {
        [getMarkerPos "mrk_doc"] call suomen_spawner_fnc_createDoc;
        ["mrk_trawler_spawn", "mrk_trawler_target"] spawn suomen_spawner_fnc_createGMan;
        MISSION_COMPLETED = true; 
        publicVariable "MISSION_COMPLETED"; 
        60 setFog [0,0,0];
        [getMarkerPos "mrk_lightHouseFeed"] call suomen_spawner_fnc_createLightHouseFeed;
          
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;


// EVACUATE SUCCEEDED
[{
    params ["_args", "_handle"];
    
    _jussiCar = (missionNamespace getVariable ["suomen_obj_jussiCar", objNull]);

    if (END_MISSION) then {
        ["tsk_evacuate","SUCCEEDED",true] call BIS_fnc_taskSetState;

        [] remoteExec ["suomen_mission_fnc_endMission", allPlayers, true];

        [_handle] call CBA_fnc_removePerFrameHandler;

    };

},3,[]] call CBA_fnc_addPerFrameHandler;