params ["_truck", "_isBombie"];

_grp = group (driver _truck);

_truck setFuel 0; // prevent ai from enter/exit fuckup
_grp leaveVehicle _truck;

{
	if (!(_isBombie)) then {
		_x linkItem "Mask_M40_OD";
	};
} forEach units _grp;

_truck setPilotLight true;
_grp setCombatMode "RED";

if (_isBombie) then {
	_newGroup = createGroup independent;
	[_truck] joinSilent _newGroup;
	{
		[_x, _newGroup] spawn {
			params ["_unit", "_newGroup"];
			waitUntil { isTouchingGround _unit };
			sleep 1;
			_pos = getPos _unit;
			_headgear = headgear _unit;
			_dir = getDir _unit;
			_backpack = backpack _unit;
			deleteVehicle _unit;

			_types = [
				"GRAD_SoldierZed_rhs_uniform_FROG01_wd_walker",
				"GRAD_SoldierZed_rhs_uniform_FROG01_wd"
			];

			_unit = _newGroup createUnit [selectRandom _types, _pos, [], 0, "NONE"];
			[_unit,""] remoteExec ["switchMove",0];
			_unit enableDynamicSimulation false;
			_unit setVariable ["RZ_isDemon", false];
			_unit setDir _dir;
			_unit addHeadgear _headgear;

			if (_backpack != "") then {
				_unit addBackpackGlobal _backpack;
			};
		};
		
	} forEach units _grp;
} else {
	{
		if (random 1 > 0.5) then {
			_x setDamage 1;
		};
	} forEach units _grp;
};


{
	_x doMove (getPos gasstation_truck);
} forEach units _grp;