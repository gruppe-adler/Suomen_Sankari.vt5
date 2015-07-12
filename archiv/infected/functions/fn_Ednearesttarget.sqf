private ["_me","_finalTarget","_playerList","_targetList","_playerNear","_nearestPlayers","_seenPlayers","_spotted","_totalP","_dist","_seen","_total","_round"];
if(isserver)then{
	_me=_this ;
	_finalTarget=[];
	_playerList=[];
	_targetList = _me nearEntities [["Car", "Man"], 75];
	{
		  //if (isPlayer _x && (alive _x) ) then { _playerList = _playerList + [_x] };		//List BLUFOR players only
		if ((alive _x )and( side _x != independent )) then //List BLUFOR players & IA
		{
			_playerList = _playerList + [_x];
		};
		
	
	} forEach _targetList;
	_playerNear=false;
	_nearestPlayers =[];
	_seenPlayers =[];
	_spotted=false;
	
	_totalP= count _playerList;
	if (_totalP==0)then{
		_finalTarget=[];
	}else{
		{
			_dist = _me distance _x;
			if (_dist < 75) then { 
				_nearestPlayers = _nearestPlayers + [_x];
				_playerNear=true;
			};
		} foreach _playerList;
		if (_playerNear) then {
			{
				_target= _x;
				_seen=[_me,_target]call INF_fnc_Contact;
				if (_seen) then { _seenPlayers = _seenPlayers + [_x]};
				//_spotted=true;
			} forEach _nearestPlayers;
			_total= count _seenPlayers;
			
			if (_total==0)then{
				_finalTarget=[];
			}else{
				_round = floor (random (_total-1));
				_finalTarget= [_seenPlayers select _round];
				if (!(alive _target))then
				{
					_finalTarget=[];
				};
			};
		};
	};
	_finalTarget;
};