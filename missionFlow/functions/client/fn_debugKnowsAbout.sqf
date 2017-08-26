
{
	_array = missionNamespace getVariable ["GRAD_suomen_debugKnowsAboutUnitArray", []];

	_name = format ["GRAD_suomen_debugKnowsAboutUnit_%1", name _unit];

	missionNamespace setVariable ["GRAD_suomen_debugKnowsAboutUnit_%1", _name];
	missionNamespace setVariable ["GRAD_suomen_debugKnowsAboutUnitArray", (_array append [_unit])];

	["debugKnowsAboutSEH", "onEachFrame", 
	{
		{
		    drawIcon3D [
		        "",
		        [1,1,1,1],
		        visiblePosition (missionNamespace getVariable ["GRAD_suomen_debugKnowsAboutUnit_%1", _x])
		        ,
		        1,
		        1,
		        45,
		        str (missionNamespace getVariable ["GRAD_suomen_debugKnowsAboutUnit_%1", _x] knowsAbout player),
		        1,
		        0.03, 
		        "PuristaMedium",
		        "center",
		        false
		    ];
		} forEach (missionNamespace getVariable ["GRAD_suomen_debugKnowsAboutUnitArray", []]);
	}] call BIS_fnc_addStackedEventHandler;

} forEach allUnits;