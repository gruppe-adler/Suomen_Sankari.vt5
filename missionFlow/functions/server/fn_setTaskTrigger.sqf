params ["_vehicleArray"];

// CREATE TASKS
// _owner,_taskid,_texts,_destination,_state,_priority,_showNotification,_taskType,_alwaysVisible


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

    if (_playersInVehicles == count allPlayers) then {
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
            "",
            "CREATED",
            2,
            true
        ] call BIS_fnc_taskCreate;
        ["tsk_findGasmasks","search"] call BIS_fnc_taskSetType;
        ["tsk_findGasmasks","ASSIGNED",true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;

[{
    params ["_args", "_handle"];
    
    if (GASMASK_FOUND) then {
        ["tsk_findGasmasks","SUCCEEDED",true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;


// FIND JUSSI
[{
    params ["_args", "_handle"];
    
    if (NUKE_DETONATE) then {
        ["tsk_findComrades","CANCELED",true] call BIS_fnc_taskSetState;
        ["tsk_extract", "ASSIGNED", true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_args", "_handle"];
    
    if (MISSION_COMPLETED) then {
        ["tsk_extract","SUCCEEDED",true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;


[{
    params ["_args", "_handle"];
    
    if (FIGHT) then {
        ["tsk_evacuate","ASSIGNED",true] call BIS_fnc_taskSetState;

        [_handle] call CBA_fnc_removePerFrameHandler;
    };

},3,[]] call CBA_fnc_addPerFrameHandler;
