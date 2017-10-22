params ["_zombie","_target", ["_maxEatingTime",999999]];

_eatingSeconds = 0;
// _maxEatingTime = _time + random 25;

if !(isnil "ryanzombiesinfectiontimer") then 
{
	_maxEatingTime = ryanzombiesinfectiontimer - 3;
};

_moveAttemptsSeconds = 0;
_feasted = false;

while {(_zombie distance _target < 80) && (alive _zombie) && !_feasted} do
{
	_newtarget = _zombie call RZ_fnc_zombie_checkForNewTarget;					
	if ((!(isnull _newtarget) && (_zombie distance _newtarget < _zombie distance _target))) exitWith {};
	if ((_zombie distance _newtarget < 20) OR (_eatingSeconds > _maxEatingTime)) exitWith {};
	_zombie setVariable ["RZ_Target",_target]; // reset target
	
	if !(isnil "ryanzombiesinfectiontimer") then {_eatingSeconds = _eatingSeconds + 1};

	
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
	_damage = damage _zombie;
	
	if ((_zombie distance _target < 3) && (_eatingSeconds < _maxEatingTime)) then // commence feasting, boisss
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
			_eatingSeconds = _eatingSeconds + 1;
			if ((_eatingSeconds > _maxEatingTime) OR (!(isnull _target) && (_zombie distance _target < 20)) OR (_damage != damage _zombie)) exitwith
			{
				// stop eating
				_feasted = true;
				_zombie enableAI "ANIM";
				[_zombie, "AinvPercMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];
			};
		};
		
	};
	
};