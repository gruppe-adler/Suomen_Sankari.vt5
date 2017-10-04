/*
[trg_border_finnish_out, finnish_gate_out, "mrk_guard_1", 213, "finnish"] call
suomen_spawner_fnc_border_createBorderCrossing;
*/

params ["_trigger", "_gate", "_guardPositionMarker", "_dir", "_side"];

_pos = getMarkerPos _guardPositionMarker;

_guard = (createGroup east) createUnit ["rhs_vdv_efreitor", _pos, [], 0, "CAN_COLLIDE"];
doStop _guard;
_guard setVariable ["suomen_guard_busy", false];
_guard setVariable ["suomen_guard_firstdone", false];
_guard disableAI "ANIM";

if (_side == "finnish") then {
	[_guard] execVM "loadout\fake_usmc.sqf";
} else {
	[_guard] execVM "loadout\russian_real.sqf";
};
_guard setDir _dir;

[{
	params ["_args", "_handle"];
	 _args params ["_trigger", "_guard", "_gate"];

	 if (count list _trigger > 0 && !(_guard getVariable ["suomen_guard_busy", true])) then {
	 	// hintsilent format ["someone in trigger"];
	 	_guard setVariable ["suomen_guard_busy", true];


		_vehicle = [_trigger, _gate] call suomen_spawner_fnc_border_getBorderCrossingVehicle;
		if (!isNull _vehicle) then {
			if (_guard getVariable ["suomen_guard_firstdone", false]) then {
				[_trigger, _vehicle, _guard, _gate] call suomen_spawner_fnc_border_openBargate;
			} else {
				_guard setVariable ["suomen_guard_firstdone", true];
				[_trigger, _vehicle, _guard, _gate] call suomen_spawner_fnc_border_directVehicle;
			};
		};
	};

	if (NUKE_DETONATE) then {
		[_handle] call CBA_fnc_removePerFrameHandler;
	};

},1,[_trigger, _guard, _gate]] call CBA_fnc_addPerFrameHandler;

