params ["_truck", "_onFire"];

waitUntil { speed _truck < 1 };

_newGroup = createGroup independent;

_types = [
	"GRAD_SoldierZed_rhs_uniform_emr_patchless_slow",
	"GRAD_SoldierZed_rhs_uniform_emr_patchless_walker"
];

_getOutPosition = _truck modelToWorldVisual [0,-1.9,-0.7];

for "_i" from 0 to 10 do {

	_newUnit = _newGroup createUnit [selectRandom _types, _getOutPosition, [], 0, "NONE"];
	_newUnit setPos [getPos _newUnit select 0, getPos _newUnit select 1, 0];
	_newUnit setVariable ["RZ_isDemon", false];
	_newUnit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
	[_newUnit, ""] remoteExec ["switchMove"];
	[_newUnit] call suomen_spawner_fnc_getRussianLoadout;
	_newUnit setDir (floor (random 360));

	_randomPlayer = selectRandom (allPlayers);
	if (side _randomPlayer == east) then {
		[_newUnit] call RZ_fnc_zombie_engageTarget; 
	};
	sleep 0.1;
};