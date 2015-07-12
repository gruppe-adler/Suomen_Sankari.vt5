private ["_me","_myzone","_initialPos","_frozen","_targetPos","_playerInZone","_killCount"];
if(isserver)then{
	_me=_this select 0;
	_myzone=_this select 1;
	_initialPos=_this select 2;
	[_me] joinSilent infected;
	_me disableAI "FSM";
	_me disableConversation true;
	_me setVariable ["BIS_noCoreConversations", true];
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
		_playerInZone=missionNamespace getVariable [format ["%1_playerInZone", _myzone],[]];
		if(_playerInZone) then
		{
			if(_frozen)then
			{
				Frozen = Frozen - 1;
				_frozen = false;
				if(!T_MP)then
				{
					_me enableSimulation true;
				}else{
					_me enableSimulationGlobal true;
				};
				[_me] joinSilent infected;
			};
			if(unitReady _me)then
			{
				[_me,_initialPos] spawn INF_fnc_Roaming;
			};
			sleep 1;
			_target=[_me,_myzone] call INF_fnc_NearestTarget;
		}else{
			if(!_frozen)then
			{
				Frozen = Frozen + 1;
				_frozen = true;
				if(!T_MP)then
				{
					_me enableSimulation false;
				}else{
					_me enableSimulationGlobal false;
				};
				[_me] joinSilent infectedFrozen;
			};
			sleep 2;
		};
	};
	if(!alive _me)then
	{
		infectedkilled = infectedkilled + 1;
		_killCount = missionNamespace getVariable [format ["%1_killCount", _myzone], []];
		missionNamespace setVariable [format ["%1_killCount", _myzone], (_killCount + 1)];
		_me removeAllEventHandlers "hit";
		sleep 120;
		deleteVehicle _me;
	}else{
		_me removeAllEventHandlers "firedNear";
		[_me,_target,_myzone,_initialPos] spawn INF_fnc_Attack;
	};
};
