params ["_truck", "_targetPosition", "_types"];

_truck setPilotLight true;
_getOutPosition = _truck modelToWorldVisual [0,-1.9,-0.7];
waitUntil { speed _truck < 1 };

for "_i" from 0 to 30 do {
	_grp = creategroup independent;
	_zombie = _grp createUnit [selectRandom _types, _getOutPosition, [], 0, "NONE"];
	_zombie enableDynamicSimulation true;
	_zombie setVariable ["RZ_isDemon", false];
	[_zombie] call suomen_spawner_fnc_getAmericanLoadout;

	_zombie doMove _targetPosition;

	sleep 0.5;

	// DEBUG
	if (DEBUG) then {
		_alongRoadsA = createMarker [str (getPos _zombie), getPos _zombie]; 
		_alongRoadsA setMarkerShape "ICON";
		_alongRoadsA setMarkerType "mil_dot";
		_alongRoadsA setMarkerColor "ColorBlue";
		_alongRoadsA setMarkerSizeLocal [0.5, 0.5];
	};
};