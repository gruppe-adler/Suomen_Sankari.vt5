params ["_trigger", "_gate"];

private ["_triggerVehicles", "_closestVehicles", "_nextVehicle"];

_triggerVehicles = [];
_closestVehicles = [];

{
	if (_x isKindOf "LandVehicle") then {
		_triggerVehicles append [_x];
	};
} count list _trigger;

// hintsilent format ["vehicles: %1", _triggerVehicles];

_allVehicles = nearestObjects [_gate, ["LandVehicle"], 100];

{
	if (_x in _triggerVehicles) then {
		_closestVehicles append [_x];
	};
} forEach _allVehicles;


if (count _closestVehicles > 0) then {
	_nextVehicle = _closestVehicles select 0;
} else {
	_nextVehicle = objNull;
};

_nextVehicle