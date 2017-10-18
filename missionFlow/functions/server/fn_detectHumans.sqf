

[{
    params ["_args", "_handle"];

    if (ENEMIES_DETECTED) exitWith {
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };

	_seenByPatrol = [];
    
    { 
    diag_log format ["_x = %1", _x];
    	if ((rus_patrol_camp targetKnowledge _x) select 0) then { 
    		_seenByPatrol = _seenByPatrol + [_x];
    		diag_log format ["_seenByPatrol = %1", _seenByPatrol];
    	};
    } forEach allPlayers;

	if (count _seenByPatrol > 0) exitWith {

    	 {(group rus_patrol_camp) reveal [_x,4];} forEach _seenByPatrol;

    	 [] call suomen_mission_fnc_setEnemiesDetected;
    	 _randomUnit = (selectRandom units group rus_patrol_camp);
    	 if (alive _randomUnit) then {
    	 	_randomUnit say3D [selectRandom [
    	 		"rus1", "rus2", "rus3", "rus4", "rus5", "rus6", "rus7", "rus8", "rus9", "rus10", "rus11"
    	 	], 100];
    	 };
    	 [{
    	 	if (alive (_this select 0)) then {
    	 		(_this select 0) fireAtTarget [(_this select 0) findNearestEnemy (_this select 0)];
    	 	};
    	 }, [(selectRandom units group rus_patrol_camp)], 3] call CBA_fnc_waitAndExecute;
    	
    };

    /*
    if (count (rus_patrol_factory1 targetsQuery [objNull, sideUnknown, "O_Survivor_F", position rus_patrol_factory1, 60]) > 0) exitWith {
    	 [] call suomen_mission_fnc_setEnemiesDetected;
    	 [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (count (rus_patrol_factory2 targetsQuery [objNull, sideUnknown, "O_Survivor_F", position rus_patrol_factory2, 60]) > 0) exitWith {
    	 [] call suomen_mission_fnc_setEnemiesDetected;
    	 [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (count (civilian_specialist targetsQuery [objNull, sideUnknown, "O_Survivor_F", position civilian_specialist, 60]) > 0) exitWith {
    	 [] call suomen_mission_fnc_setEnemiesDetected;
    	 [_handle] call CBA_fnc_removePerFrameHandler;
    };

    if (count (civilian_doc targetsQuery [objNull, sideUnknown, "O_Survivor_F", position civilian_doc, 60]) > 0) exitWith {
    	 [] call suomen_mission_fnc_setEnemiesDetected;
    	 [_handle] call CBA_fnc_removePerFrameHandler;
    };
    */

},3,[]] call CBA_fnc_addPerFrameHandler;