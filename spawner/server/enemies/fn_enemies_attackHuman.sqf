params ["_unit","_target", ["_damageDealt",0.005]]; // default damage is 0.05 on easy
_dir = _unit getDir _target;
_unit setdir _dir;
[_unit, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

_attackSound = selectRandom ([_unit,"attack"] call RZ_fnc_zombie_getZombieSoundArray);
playsound3d [_attackSound, _unit, false, getPosASL _unit, 1, pitch _unit, 100];


//_target allowfleeing 1;
sleep 0.3;
_attackSpeed = [Ryanzombiesattackspeed,0.3] select (_unit getVariable "RZ_isDemon");
if ([_unit,_target] call RZ_fnc_zombie_canAttackHuman) then
{
	_hitSound = selectRandom ([_unit,"hit"] call RZ_fnc_zombie_getZombieSoundArray);
	playsound3d [_hitSound, _target, false, getPosASL _target, 1, pitch _unit, 100];	
	
	if (isnil "ryanzombiesdisablebleeding") then 
	{ 
		[_target, 10] remoteExecCall ["fnc_RyanZombies_Bleeding"]; 
	};

	if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then 
	{
		[_target,_damageDealt] call suomen_spawner_fnc_enemies_aceDamage;
	} else {
		_target setdamage (damage _target + _damageDealt);
	};


	_scream = selectRandom RZ_HumanScreamArray;
	[_target, [_scream,100]] remoteExecCall ["say3d"];

	_vel = velocity _target;
	_dir = direction _unit;
	_strength = 0.5;
	[_target, [(_vel select 0) + (sin _dir * _strength), (_vel select 1) + (cos _dir * _strength), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
};
sleep _attackSpeed;