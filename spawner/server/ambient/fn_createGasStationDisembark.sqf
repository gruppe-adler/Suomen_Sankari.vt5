params ["_truck", "_isBombie"];

_grp = group (driver _truck);

(driver _truck) disableAI "AUTOTARGET";
(driver _truck) disableAI "TARGET";

_grp leaveVehicle _truck;
{ unassignVehicle _x; } forEach crew _truck;

waitUntil {sleep 0.5; speed _truck < 0.5};

_truck setPilotLight true;
_grp setCombatMode "RED";

if (_isBombie) then {
	_newGroup = createGroup independent;
	[_truck] joinSilent _newGroup;
	_getOutPosition = _truck modelToWorldVisual [0,-2,-0.5];
	for "_i" from 0 to 16 do 
	{
		_types = [
				"GRAD_SoldierZed_rhs_uniform_FROG01_wd_walker",
				"GRAD_SoldierZed_rhs_uniform_FROG01_wd",
				"GRAD_SoldierZed_rhs_uniform_FROG01_fast"
			];

		_unit = _newGroup createUnit [selectRandom _types, _getOutPosition, [], 0, "NONE"];
		[_unit,""] remoteExec ["switchMove",0];
		_unit enableDynamicSimulation false;
		_unit setVariable ["RZ_isDemon", false];
		_unit setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];
		sleep 0.1;
	};
} else {
	{
		if (random 1 > 0.5) then {
			_x setDamage 1;
		};
	} forEach units _grp;
};


{
	_x doMove (getPos gasstation_truck);
	if (!(_isBombie)) then {
		_x linkItem "Mask_M40_OD";
	};
} forEach units _grp;