params ["_zombie"];

if (unitpos _zombie in ["MIDDLE","AUTO"]) then {_zombie setunitpos "UP";};

private _oldTarget = _zombie getVariable "RZ_Target";
if((vehicle _oldTarget iskindof "man") && [_zombie,_oldTarget] call RZ_fnc_zombie_canAttackHuman) exitWith // don't bother doing expensive checks for new target, keep slashing god damnit!
{
	[_zombie,_oldTarget] call RZ_fnc_zombie_engageTarget;
};
if((count crew (vehicle _oldTarget) > 0) && [_zombie,vehicle _oldTarget,_zombie getVariable "RZ_TargetVehType"] call RZ_fnc_zombie_canAttackVehicle) exitWith // don't bother doing expensive checks for new target, keep wrecking that vehicle arr!
{
	[_zombie,_oldTarget] call RZ_fnc_zombie_engageTarget;
};	

private _target = objNull;
_maxAttempts = _zombie getVariable "RZ_maxAttempts";
_attempts = 0;
while {isNull _target && _attempts < _maxAttempts} do 
{
	if (unitpos _zombie in ["MIDDLE","AUTO"]) then {_zombie setunitpos "UP";};
	if(!alive _zombie) exitWith {};

	_target = _zombie call RZ_fnc_zombie_checkForNewTarget;
	
	if(isNull _target) then 
	{
		_attempts = _attempts + 1;
		sleep 1;
	};
};
if(!isNull _target) then 
{
	[_zombie,_target] call RZ_fnc_zombie_engageTarget;
};