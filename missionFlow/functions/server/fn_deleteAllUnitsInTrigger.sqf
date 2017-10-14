params ["_trigger"];

_unitsToClean = allUnits inAreaArray _trigger;

{
	deleteVehicle _x;
	sleep 0.1;
} forEach _unitsToClean;