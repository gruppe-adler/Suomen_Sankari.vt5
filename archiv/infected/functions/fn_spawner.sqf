private ["_horde","_countThis","_myZone","_mkr","_totalInfected","_indoor","_probability","_infectedCount","_exclusionList","_mkrY","_mkrX","_distance","_houseList","_house","_buildingPos","_n","_object","_markPos","_mPosX","_mPosY","_count","_rX","_rY"];
if(isServer)then
{
	_horde= false;
	_autoCount=false;
	_countThis= count _this;
	_allcount=_this;
	//hint str (count _allcount);
	sleep 1;
	_myZone=_this select 0;
	_mkr=_this select 1;
	_totalInfected= _this select 2;
	_indoor= _this select 3;
	if(_countThis == 5)then{_horde=_this select 4;//hint "horde";sleep 1
	};
	if(_countThis == 6)then{_autoCount=_this select 5;//hint "auto";sleep 1
	};
	
	//_probability=25;
	_infectedCount=0;
	_exclusionList=["Land_Pier_F","Land_Pier_small_F","Land_NavigLight","Land_LampHarbour_F"];
	if(_indoor)then
	{
		//_mkr setmarkerAlpha 0;
		_pos=markerpos _mkr;
		_mkrY= getmarkerSize _mkr select 0;
		_mkrX= getmarkerSize _mkr select 1;

		_distance=_mkrX;
		if (_mkrY > _mkrX)then
		{
			_distance=_mkrY;
		};

		_houseList= _pos nearObjects ["House",_distance];
		_houseCount= count _houseList;
		if (_houseCount >=100)then{_probability=10};
		if ((_houseCount >=60)and(_houseCount<100))then{_probability=15};
		if ((_houseCount >=30)and(_houseCount<60))then{_probability=25};
		if ((_houseCount >10)and(_houseCount<30))then{_probability=40};
		if (_houseCount <=10)then{_probability=70};
		if(_autoCount)then{_totalInfected = _houseCount};
		while {_totalInfected >= _infectedCount}do
		{
			{
				_house=_X;
				if (_probability > random 100)then
				{
					if (!(typeOf _house in _exclusionList))then
					{
						for "_n" from 0 to 50 do {
							_buildingPos=_house buildingpos _n;
							if (str _buildingPos == "[0,0,0]") exitwith {};
							if (_infectedCount >= _totalInfected) exitwith {};
							if (_probability > random 100)then
							{
								if(_horde)then
								{
									_object=[_buildingPos, 180, "O_soldier_F", infectedattacker] call bis_fnc_spawnvehicle;
									[_object,_myZone] spawn INF_fnc_initHordeAttacker;
								}else{
									_object=[_buildingPos, 180, "O_soldier_F", infected] call bis_fnc_spawnvehicle;
									[_object,_myZone] spawn INF_fnc_infectedinit;
								};
							_infectedCount= _infectedCount + 1;
							sleep 0.3
							};	
						};
					};
				};
				//sleep 0.1;
			}foreach _houseList;
		};
	}else{
		_markPos=markerpos _mkr;
		_mPosX=_markPos select 0;
		_mPosY=_markPos select 1;
		_mkrY= getmarkerSize _mkr select 0;
		_mkrX= getmarkerSize _mkr select 1;
		_count= 0;
		while{_totalInfected>=_count}do
		{
			hint format ["poped 1%",_count];
			_rX= floor (random _mkrX);
			_rY= floor (random _mkrY);
			_markPos=[((_mPosX+_rX)-(_mkrX/2)),((_mPosY+_rY)-(_mkrY/2))];
			//_object=[_markPos, 180, "O_soldier_F", east] call bis_fnc_spawnvehicle;
			if(_horde)then
			{
				_object=[_markPos, 180, "O_soldier_F", infectedattacker] call bis_fnc_spawnvehicle;
				[_object,_myZone] spawn INF_fnc_initHordeAttacker;
			}else{
				_object=[_markPos, 180, "O_soldier_F", infected] call bis_fnc_spawnvehicle;
				[_object,_myZone] spawn INF_fnc_infectedinit;
			};
			_count= _count + 1;
			sleep 0.3;
		};
	};
};