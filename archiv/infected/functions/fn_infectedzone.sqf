/*
use it to populate large area.
the trigger keep infecteds alive until all players leave the zone,
and unfreezing when players came back.
so make the trigger bigger than the marker.
Infected Script usage:
Exemple  in "on Act" box: 
null= 	[thistrigger,	"zone02",		100, 	false, 		true] spawn INF_fnc_infectedzone; 
		[thistrigger,	"marker name", 	count,	in building, respawn]	]
*/
private ["_myZone","_this","_spawnZone","_SpawnCount","_indoor","_repop","_killCount","_myzone","_playerInZone","_targetList","_x","_playerList","_targetCount"];
if (isServer)then
{
	if(isNil "infected_init")then {call INF_fnc_infinit;};
	_myZone = _this select 0;
	_spawnZone = _this select 1;
	_SpawnCount = _this select 2;
	_indoor = _this select 3;
	_repop =_this select 4;
	_roamingGroup = format["%1infected",_myzone];
	_roamingGroup = createGroup independent;
	_roamingGroup setSpeedMode "LIMITED";
	_attackGroup = format["%1infectedattacker",_myzone];
	_attackGroup = createGroup independent;
	_attackGroup setSpeedMode "FULL";
	
	{
		[_myZone,_x,_SpawnCount,_indoor] spawn INF_fnc_spawner;
	}forEach _spawnzone;
	
	_killCount=0;
	missionNamespace setVariable [format ["%1_killCount", _myzone], _killCount];
	_playerInZone=true;
	missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
	_targetList=[];
	missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
	// Zone player list , check toutes les 5s///////////////////////////////////////////////////////////////
	while {_playerInZone or Infected_Switch} do
	{
		_targetList= [];
		{
			  //if (isPlayer _x && (alive _x) ) then { _playerList = _playerList + [_x] };		//List BLUFOR players only
			if ((alive _x )and( side _x != east )and (typeof _x !="Snake_random_F")) then //List players & IA for all other factions
			{
				_targetList = _targetList + [_x];
			};
			
		
		} forEach list _myzone;
		_targetCount= count _targetList;
		if (_targetCount<1)then
		{
			_playerInZone=false;
			missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
			_killCount = missionNamespace getVariable [format ["%1_killCount", _myzone], []];
			if (_repop && (_killCount != 0))then
			{
				if(_indoor)then
				{
					[_myZone,_spawnZone,_killCount] spawn INF_fnc_spawner;
				}else{
					[_myZone,_spawnZone,_killCount] spawn INF_fnc_popinfectedOutdoor;
				};
				_killCount=0;
				missionNamespace setVariable [format ["%1_killCount", _myzone], _killCount];
			};
		}else{
			_playerInZone=true;
			missionNamespace setVariable [format ["%1_playerInZone", _myzone], _playerInZone];
			missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
		};
		sleep 5;
	};
};