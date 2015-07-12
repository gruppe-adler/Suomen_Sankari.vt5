private ["_me","_myZone","_finalTarget","_playerList","_playerNear","_nearestPlayers","_seenPlayers","_spotted","_totalP","_dist","_seen","_total","_round"];
if(isserver)then{
	_me=_this select 0;
	_myZone=_this select 1;
	_finalTarget=[];
	_playerList = missionNamespace getVariable [format ["%1_TargetList", _myZone],[]];
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
				//missionNamespace setVariable [format ["%1_isInVehicle", _finalTarget],[false,"nothing",_finalTarget]];
				if (!(alive _target))then
				{
					_finalTarget=[];
				};
			};
		};
	};
	_finalTarget;
};