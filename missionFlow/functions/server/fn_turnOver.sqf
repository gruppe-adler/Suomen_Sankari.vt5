params ["_truck", "_onFire"];

_newGroup = createGroup independent;

_types = [
	"GRAD_SoldierZed_rhs_uniform_emr_patchless_slow",
	"GRAD_SoldierZed_rhs_uniform_emr_patchless_walker"
];

_getOutPosition = _truck modelToWorldVisual [0,-1.9,-0.7];

_newUnit = _newGroup createUnit [selectRandom _types, _getOutPosition, [], 0, "NONE"];
_newUnit setVariable ["RZ_isDemon", false];
_newUnit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
[_newUnit] call suomen_spawner_fnc_getRussianLoadout;
_newUnit setDir _dir;

_randomPlayer = selectRandom (allPlayers);
if (side _randomPlayer == east) then {
	[_newUnit] call RZ_fnc_zombie_engageTarget; 
};

if (_onFire) then {
	[_newUnit, 0, true] call suomen_fx_fnc_createFire;
};