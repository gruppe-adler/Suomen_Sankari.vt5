/*
	
	[getMarkerPos "mrk_chaser_spawn", 242, getMarkerPos "mrk_chaser_target"] call
	suomen_spawner_fnc_createChaser;

*/

params ["_pos", ["_dir", 0], ["_targetPosition", [0,0,0]], "_index"];

_waypoints = [
getPos pos_chaser_1,
getPos pos_chaser_2,
getPos pos_chaser_3,
getPos pos_chaser_4,
getPos pos_chaser_5,
getPos pos_chaser_6,
getPos pos_chaser_7,
getPos pos_chaser_8,
getPos pos_chaser_9,
getPos pos_chaser_10,
getPos pos_chaser_11,
getPos pos_chaser_12,
getPos pos_chaser_13,
getPos pos_chaser_14,
getPos pos_chaser_15,
getPos pos_chaser_16,
getPos pos_chaser_17,
getPos pos_chaser_18,
getPos pos_chaser_19,
getPos pos_chaser_20,
getPos pos_chaser_21,
getPos pos_chaser_22,
getPos pos_chaser_23,
getPos pos_chaser_24,
getPos pos_chaser_25,
getPos pos_chaser_26,
getPos pos_chaser_27,
getPos pos_chaser_28,
getPos pos_chaser_29,
getPos pos_chaser_30,
getPos pos_chaser_31,
getPos pos_chaser_32,
getPos pos_chaser_33,
getPos pos_chaser_34,
getPos pos_chaser_35,
getPos pos_chaser_36,
getPos pos_chaser_37,
getPos pos_chaser_38
];

_truck = createVehicle ["rhsusf_M1232_usarmy_wd", _pos, [], 0, "NONE"];
_truck setDir _dir;
_truck enableDynamicSimulation false;

_crewGroup = createGroup civilian;
createVehicleCrew _truck;
[_truck] joinSilent _crewGroup;
crew _truck joinSilent _crewGroup;
{
	_x enableDynamicSimulation false;
	_face = selectRandom RZ_FaceArray;
	[_x, _face] remoteExec ["setFace", allPlayers];
} forEach crew _truck;


// set driving path
_truck setPilotLight true; 


_crewGroup setSpeedMode "FULL";
_crewGroup setBehaviour "CARELESS";
// create trigger for disembark
_lastPosition = _waypoints select (count _waypoints - _index);

_handle = [{
	params ["_args", "_handle"];
	_args params ["_truck", "_lastPosition", "_targetPosition"];

	if (_truck distance _lastPosition < 5) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
		doStop (driver _truck);
		{_truck deleteVehicleCrew _x} forEach crew _truck;

		_types = [
		"GRAD_SoldierZed_rhs_uniform_FROG01_wd_medium",
		"GRAD_SoldierZed_rhs_uniform_FROG01_wd_fast"
		];

		[_truck, _targetPosition, _types] spawn {
		params ["_truck", "_targetPosition", "_types"];
			_truck setPilotLight true;
			_getOutPosition = _truck modelToWorldVisual [0,-1.9,-0.7];

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
		};
	};
}, 1, [_truck, _lastPosition, _targetPosition]] call CBA_fnc_addPerFrameHandler;

_truck setDriveOnPath _waypoints;