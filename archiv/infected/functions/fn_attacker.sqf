private ["_me","_this","_myzone","_initialPos","_imHere","_targetList","_targetCount","_target","_isInVehicle","_targetPos","_distance","_asleep"];
if(isServer)then
{
	_me=_this select 0;
	_myzone=_this select 1;
	_initialPos=_this select 2;
	_me joinAsSilent [infectedattacker, 1];
	_imHere=false;
	Attacking = Attacking + 1;
	_targetList= missionNamespace getVariable [format ["%1_TargetList", _myzone], []];
	_targetCount= count _targetList;
	_target= _targetList select (floor(random (_targetCount - 1))) ;
	_asleep= 1+(random 1);
	while{alive _me}do
	{
		if(!alive _target)then
		{
			_targetList= _targetList - [_target];
			_targetCount= count _targetList;
			//_target= _targetList select (floor(random (_targetCount - 1))) ;
			if (_targetCount<1)then
			{
				if ((_me distance _initialPos)<3)then
				{
					
					_me removeAllEventHandlers "hit";
					sleep 10;
					deleteVehicle _me;
					infectedCount = infectedCount - 1;
				}else{
					_me doMove _initialPos;
				};
			}else{
				_target= _targetList select (floor(random (_targetCount - 1))) ;
			};
		}else{
			if(!(vehicle _target isKindOf "man"))then
			{
				_isInVehicle=missionNamespace getVariable [format ["%1_playerIn", _target],[]];
				if(!(_isInVehicle select 0))then
				{
					_target=_isInVehicle select 1;
				};
			};
			_targetPos = getposATL _target;
			/*if(surfaceIsWater _targetPos) then
			{
				_targetPos = getposASL _target;
			};*/
			_distance=(_targetPos distance _me);
			(_me)doMove(_targetPos);
			_me setSpeedMode "FULL";
			if(_distance>30)then{sleep 5;};
			if((_distance<=20)and(!_imHere))then
			{
				_imHere=true;
				//[_me, "idle"] spawn INF_fnc_NextSound;
				[[_me,"idle"], "INF_fnc_NextSound"] call BIS_fnc_MP;
				sleep 1;
			};
			
			if(_distance<=2.5)then
			{	
				if ((alive _me) and (alive _target))then
				{
					if (unitPos _me == "UP") then {
					_me switchMove "AwopPercMstpSgthWnonDnon_throw";
					sleep 0.2;
					};

					if (unitPos _me == "MIDDLE") then {
					_me switchMove "AwopPknlMstpSgthWrflDnon_End";
					sleep 0.2;
					};

					if (unitPos _me == "DOWN") then {
					_me switchMove "AwopPpneMstpSgthWrflDnon_End";
					sleep 0.2;
					};
					_target setDamage (damage _target + 0.34);
					//[_me, "punch"] spawn INF_fnc_NextSound;
					[[_me,"punch"], "INF_fnc_NextSound"] call BIS_fnc_MP;
					sleep 2;
				};
			};
		};
		
		sleep _asleep;
		
	};

	if(!alive _me)then
	{
		infectedCount = infectedCount - 1;
		_me removeAllEventHandlers "hit";
		sleep 120;
		deleteVehicle _me;
	};
};