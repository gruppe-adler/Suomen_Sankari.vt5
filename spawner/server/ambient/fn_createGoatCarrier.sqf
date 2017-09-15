params ["_type", "_animal", "_spawnMarker", "_targetMarker"];
private ["_attachPosition", "_yaw", "_pitch", "_roll"];

switch (_animal) do {
	case "Goat_random_F": { 
		_attachPosition = [0.3,0.2,-0.05];
		_yaw = -90; _pitch = 0; _roll = -90;
	};
	case "Sheep_random_F": { 
		_attachPosition = [0.3,0.4,-0.25];
		_yaw = -90; _pitch = 0; _roll = -90;
	};
	case "Cock_random_F": { 
		_attachPosition = [0.4,0.05,-0.1];
		_yaw = -90; _pitch = 0; _roll = -90;
	};
	case "Hen_random_F": { 
		_attachPosition = [0.2,0.05,-0.15];
		_yaw = -90; _pitch = 10; _roll = -90;
	};
	case "Rabbit_F": { 
		_attachPosition = [0.1,-0.1,-0.68];
		_yaw = -90; _pitch = 45; _roll = -90;
	};
	default {
		_attachPosition = [0,0,0];
		_yaw = -90; _pitch = 0; _roll = -90;
	};
};

_pos = getMarkerPos _spawnMarker;
_targetPos = getMarkerPos _targetMarker;

_grpUnit = createGroup independent;
_unit = _grpUnit createUnit [_type, _pos, [], 0, "NONE"];

_unit enableDynamicSimulation true;
_unit setVariable ["RZ_isDemon", false];
_unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
_unit setVariable ["suomen_overwriteRZ", true];

_targetUnit = createAgent [_animal, [0,0,0], [], 0, "NONE"];
_targetUnit setDamage 1;

_targetUnit attachTo [_unit, _attachPosition, "Head"];

_targetUnit setVectorDirAndUp [
	[ sin _yaw * cos _pitch,cos _yaw * cos _pitch,sin _pitch],
	[ [ sin _roll,-sin _pitch,cos _roll * cos _pitch],-_yaw] call BIS_fnc_rotateVector2D
];

_unit doMove _targetPos;