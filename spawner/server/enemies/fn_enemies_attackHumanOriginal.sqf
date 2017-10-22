
params ["_zombie","_target"]; 
_dir = _zombie getDir _target;
_zombie setdir _dir;
[_zombie, "AwopPercMstpSgthWnonDnon_throw"] remoteExecCall ["fnc_RyanZombies_SwitchMove"];

_attackSound = selectRandom ([_zombie,"attack"] call RZ_fnc_zombie_getZombieSoundArray);
playsound3d [_attackSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie, 100];


_target allowfleeing 1;
sleep 0.3;
_attackSpeed = [Ryanzombiesattackspeed,0.5] select (_zombie getVariable "RZ_isDemon");
if ([_zombie,_target] call RZ_fnc_zombie_canAttackHuman) then
{
	_hitSound = selectRandom ([_zombie,"hit"] call RZ_fnc_zombie_getZombieSoundArray);
	playsound3d [_hitSound, _target, false, getPosASL _target, 1, pitch _zombie, 100];	
	
	if (isnil "ryanzombiesdisablebleeding") then 
	{ 
		[_target, 10] remoteExecCall ["fnc_RyanZombies_Bleeding"]; 
	};

	_aceDamageType = ["manNormal","manDemon"] select (_zombie getVariable "RZ_isDemon");
	_normalDamage = [2,0.3] select (isPlayer _target);
	if (isClass(configFile >> "CfgPatches" >> "ace_medical")) then 
	{
		// [_target,_aceDamageType] execVM "\ryanzombies\acedamage.sqf";
		[_target, _normalDamage] call suomen_spawner_fnc_enemies_aceDamage;
	} else {
		_target setdamage (damage _target + _normalDamage);
	};
	
	if (!(alive _target) && !(isnil "Ryanzombiesinfection")) then 
	{
		[_target, side (group _zombie)] execVM "\ryanzombies\resurrection.sqf";
	};
	if ((alive _target) && !(isnil "ryanzombiesinfectedchance") && (_target getvariable ["ryanzombiesinfected",0] == 0)) then 
	{
		[_target,  side (group _zombie)] execVM "\ryanzombies\infected.sqf";
	};
	

	_scream = selectRandom RZ_HumanScreamArray;
	[_target, [_scream,100]] remoteExecCall ["say3d"];

	_vel = velocity _target;
	_dir = direction _zombie;
	_strength = _zombie call RZ_fnc_zombie_getHumanVelocityStrength;
	[_target, [(_vel select 0) + (sin _dir * _strength), (_vel select 1) + (cos _dir * _strength), (_vel select 2) + random 1]] remoteExecCall ["fnc_RyanZombies_Velocity"];
};
sleep _attackSpeed;