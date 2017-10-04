

if (DEBUG) then {hintSilent "Enemies detected: true";};


[] call suomen_mission_fnc_makeAllRedBlue;


{
	_x setBehaviour "AWARE";
} forEach allUnits;

nul = [] execVM "patrols\rusPatrolGaz.sqf";

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
