params ["_zombie","_target"];

_moveAttemptsSeconds = 0;
_feasted = false;

while {(_zombie distance _target < 80) && (alive _zombie) && !_feasted} do
{
	_newtarget = _zombie call RZ_fnc_zombie_checkForNewTarget;					
	if ((!(isnull _newtarget) && (_zombie distance _newtarget < _zombie distance _target))) exitWith {};
	if (_zombie distance _newtarget < 20) exitWith {};
	_zombie setVariable ["RZ_Target",_target]; // reset target

	
	if (_moveAttemptsSeconds in [0,5,10,15,20,25]) then 
	{
		if (!local _zombie) then 
		{
			[_zombie, getposATL _target] remoteExecCall ["fnc_RyanZombies_DoMoveLocalized"];
		} else {
			_zombie domove getposATL _target;
		};
	};
	
	sleep 1;

	_moveAttemptsSeconds = _moveAttemptsSeconds + 1;
	if (_moveAttemptsSeconds > 30) exitWith {};
	
	if (_zombie distance _target < 3) then // commence feasting, boisss
	{ 		
		_zombie disableAI "ANIM";
		_zombie setdir (_zombie getDir _target);
		[_zombie, "AinvPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
		
		sleep 1;
		while {alive _zombie} do
		{
			if (random 2 < 1) then 
			{
				_eatingSound = selectRandom ([_zombie,"eat"] call RZ_fnc_zombie_getZombieSoundArray); 
				playsound3d [_eatingSound, _zombie, false, getPosASL _zombie, 1, pitch _zombie, 80];
			};
			
			_target = _zombie call RZ_fnc_zombie_checkForNewTarget;
			sleep 1;
			if ((!(isnull _target) && (_zombie distance _target < 20))) exitwith
			{
				// stop eating
				_feasted = true;
				_zombie enableAI "ANIM";
				[_zombie, "AinvPercMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
			};
		};
		
	};
	
};