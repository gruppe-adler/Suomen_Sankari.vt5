if (isServer)then
{
	if(isNil "infected_init")then {call INF_fnc_infinit;};
	_myzone= _this;
	_markPos=getpos _myzone;
	_mkrY= (triggerArea _myzone) select 0;
	_mkrX= (triggerArea _myzone) select 1;
	_markName = format ["mrk%1",_myzone];
	_marker = createMarkerLocal [_markName, _markPos ];
	_markName setMarkerShape "ELLIPSE";
	_markName setMarkerSize [_mkrX, _mkrY];
	_playerInZone=true;
	_killCount=0;
	[_myZone,_markName,0,true,false,true] spawn INF_fnc_spawner;
	missionNamespace setVariable [format ["%1_killCount", _myzone], _killCount];
	missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
	_targetList=[];
	missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
	// Zone player list , check toutes les 5s///////////////////////////////////////////////////////////////
	while {_playerInZone or Infected_Switch} do
	{
		_targetList= [];
		{
			  //if (isPlayer _x && (alive _x) ) then { _playerList = _playerList + [_x] };		//List BLUFOR players only
			if ((alive _x )and( side _x != east )) then //List BLUFOR players & IA
			{
				_targetList = _targetList + [_x];
			};
			
		
		} forEach list _myzone;
		_targetCount= count _targetList;
		if (_targetCount<1)then
		{
			_playerInZone=false;
			missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
		}else{
			_playerInZone=true;
			missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
			missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
		};
		sleep 5;
	};
};