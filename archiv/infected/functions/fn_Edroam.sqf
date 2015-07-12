private ["_me","_initialPos","_frozen","_targetPos"];
if(isserver)then{
	_me=_this select 0;
	_initialPos=_this select 1;
	_me joinAsSilent [infected, 1];
	_target=[];
	_frozen = false;
	
	investigating= {
		_asleep= random 1;
		sleep _asleep;
		_me = _this select 0;
		_target = _this select 1;
		_me removeAllEventHandlers "firedNear";
		_targetPos = getposATL _target;
		if(surfaceIsWater _targetPos) then
		{
			_targetPos = getposASL _target;
		};
		_me domove _targetPos;
		[[_me,"hurt"], "INF_fnc_NextSound"] call BIS_fnc_MP;
		sleep 15;
		_me addEventHandler ["firedNear",
		{
			
			if ((str (_this select 4)) in ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_H_MG"]) exitwith {};
			[_this select 0, _this select 1] spawn investigating;
		}];
	};
	_me addEventHandler ["firedNear",
	{
		
		if ((str (_this select 4)) in ["muzzle_snds_H","muzzle_snds_L","muzzle_snds_M","muzzle_snds_B","muzzle_snds_H_MG"]) exitwith {};
		[_this select 0, _this select 1] spawn investigating;
	}];
	while{(alive _me)&& (count _target == 0)}do
	{	
		if(unitReady _me)then
		{
			[_me,_initialPos] spawn INF_fnc_Roaming;
		};
		sleep 1;
		_target= _me call INF_fnc_EdNearestTarget;
		sleep 2;
	};
	if(!alive _me)then
	{
		_me removeAllEventHandlers "hit";
		sleep 120;
		deleteVehicle _me;
	}else{
		_me removeAllEventHandlers "firedNear";
		[_me,_target,_initialPos] spawn INF_fnc_EdAttack;
	};
};
