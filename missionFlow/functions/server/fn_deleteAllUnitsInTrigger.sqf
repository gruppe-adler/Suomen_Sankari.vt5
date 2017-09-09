params ["_trigger"];

_size = triggerArea _trigger;

if  ({_x inArea _trigger} count allPlayers > 0) exitWith {
	diag_log format ["player still in trigger %1, cant delete objects", _trigger];
};

{
	deleteVehicle _x;
} forEach list _trigger;