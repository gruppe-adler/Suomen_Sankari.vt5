params ["_unit","_target"];
_unit setVariable ["RZ_TargetVehType",""];

if (_unit getVariable ["suomen_ignoreTargets", false]) exitWith {};

if (!isNull _target) then
{
	if (_target getVariable ["suomen_smells", false]) exitWith {};
	if (_target getvariable ["isSpectator", "false"] == "true") exitWith {};
			
	if (((getPosATL _target select 2) > 20) AND (_target iskindof "AIR")) exitwith {sleep 2};
	if (animationState _unit == "UNCONSCIOUS") exitwith {sleep 2};
	// if (_unit distance _target > Ryanzombieslimit) exitwith {sleep 2}; //
	
	if (!(vehicle _target iskindof "man") && (count crew (vehicle _target) == 0)) exitWith // if target is an empty vehicle
	{
		(vehicle _target) call RZ_fnc_NeutralizeVehicle;
	};

	if (local _unit) then 
	{
		_unit domove getposATL _target;
	} else {
		[_unit, getposATL _target] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
	};
	
	if (surfaceIsWater getposATL _target) then 
	{
		[_unit, "AmovPercMwlkSnonWnonDf"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
	};
	_unit dowatch _target;
	
	_feedModuleName = ["Ryanzombiesfeed","Ryanzombiesfeeddemon"] select (_unit getVariable "RZ_isDemon");
	_jumpModuleName = ["Ryanzombiesjump","Ryanzombiesjumpdemon"] select (_unit getVariable "RZ_isDemon");
	_throwCarModuleName = ["Ryanzombiescanthrow","Ryanzombiescanthrowdemon"] select (_unit getVariable "RZ_isDemon");
	_throwTankModuleName = ["Ryanzombiescanthrowtank","Ryanzombiescanthrowtankdemon"] select (_unit getVariable "RZ_isDemon");

	_exit = false;
	if ((vehicle _target iskindof "man") && [_unit,_target] call RZ_fnc_zombie_canAttackHuman) then
	{
		[_unit,_target] call suomen_spawner_fnc_enemies_attackHuman;
		
		if((alive _target) OR (isnil _feedModuleName)) then 
		{
			_exit = true;
		};	
	};
	
	if(_exit) exitWith {};
	
	if(isNull _target || !alive _unit) exitWith {};	
	// although I don't like how messy these conditions look, they allow for rapid target re-acquirement if the old target becomes a null & also quick exit of script upon zombie death

	if ((vehicle _target iskindof "car") && _unit distance _target < 7) exitWith
	{
		[_unit,_target,vehicle _target,"car"] call RZ_fnc_zombie_attackVehicle;
	};

	if ((vehicle _target iskindof "tank") && _unit distance _target < 8) exitWith
	{
		[_unit,_target,vehicle _target,"tank"] call RZ_fnc_zombie_attackVehicle;
	};

	if ((vehicle _target iskindof "air") && (_unit distance _target < 10) && ((getPosATL _target select 2) < 1.8)) exitWith
	{
		[_unit,_target,vehicle _target,"air"] call RZ_fnc_zombie_attackVehicle;
	};

	if ((vehicle _target iskindof "staticweapon") && _unit distance _target < 4.5) exitWith
	{
		[_unit,_target,vehicle _target,"static"] call RZ_fnc_zombie_attackVehicle;
	};

	if ((vehicle _target iskindof "ship") && _unit distance _target < 4.5) exitWith
	{
		[_unit,_target,vehicle _target,"ship"] call RZ_fnc_zombie_attackVehicle;
	};
		
	_unit call RZ_fnc_zombie_AggressiveSound;

	_interval = (0.5 + ((_unit distance _target)/50)) min 4;
	sleep _interval;
	
	if(isNull _target || !alive _unit) exitWith {};		

	if (!alive _target) exitWith
	{
		[_unit,_target] call RZ_fnc_zombie_feedOnTarget;
	};

};
	