

if (DEBUG) then {hintSilent "Enemies alert: true";};


{
	_x setBehaviour "AWARE";
} forEach allUnits;