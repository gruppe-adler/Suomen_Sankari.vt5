params ["_trigger"];

_size = triggerArea _trigger;

if  (!({_x distance position _trigger < (_size + 100)} count allPlayers > 0)) exitWith {
	diag_log format ["player still in trigger %1, cant delete objects", _trigger];
};

{
	deleteVehicle _x;
} forEach list _trigger;