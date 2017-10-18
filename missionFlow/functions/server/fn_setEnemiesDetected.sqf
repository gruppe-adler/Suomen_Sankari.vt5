
[{

    if (DEBUG) then {hintSilent "Enemies detected: true";};


    [] call suomen_mission_fnc_makeAllRedBlue;

    ENEMIES_DETECTED = true; publicVariable "ENEMIES_DETECTED";

    {
    	_x setBehaviour "COMBAT";
        _x setCombatMode "RED";

        _randomUnit = selectRandom units _x;
        
        if (alive _randomUnit) then {
            _randomUnit say3D [selectRandom [
                "rus1", "rus2", "rus3", "rus4", "rus5", "rus6", "rus7", "rus8", "rus9", "rus10", "rus11"
            ], 100];
         };
         [{
            if (alive (_this select 0)) then {
                (_this select 0) say3D [selectRandom [
                "rus1", "rus2", "rus3", "rus4", "rus5", "rus6", "rus7", "rus8", "rus9", "rus10", "rus11"
            ], 100];
            };
         }, [_randomUnit], 3] call CBA_fnc_waitAndExecute;
         [{
            if (alive (_this select 0)) then {
                (_this select 0) say3D [selectRandom [
                "rus1", "rus2", "rus3", "rus4", "rus5", "rus6", "rus7", "rus8", "rus9", "rus10", "rus11"
            ], 100];
            };
         }, [_randomUnit], 4] call CBA_fnc_waitAndExecute;
    } forEach allGroups;

    nul = [] execVM "patrols\rusPatrolGaz.sqf";

    [{
        [   east,
             ["tsk_enemies_detected"],
                    [
                        "Russian and finnish defense forces are now aware there is something going on. Stay low!",
                        "Russian and finnish forces are alert. Be careful and stay hidden.",
                        ""
                    ],
                    "",
                    "CREATED",
                    2,
                    true
        ] call BIS_fnc_taskCreate;
        ["tsk_enemies_detected","danger"] call BIS_fnc_taskSetType;
        ["tsk_enemies_detected","ASSIGNED",true] call BIS_fnc_taskSetState;

    }, [], 3] call CBA_fnc_waitAndExecute;

}, [], 2] call CBA_fnc_waitAndExecute;