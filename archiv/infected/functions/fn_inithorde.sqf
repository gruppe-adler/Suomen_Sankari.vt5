/*
use it to create infected pack, they will attack the player and his group.
you can use multiple markers to create multiple pawning zones.
horde Script usage:
Exemple in "on Act" box: 
null= [thistrigger,		["pop000","pop001"],	15,					false] spawn INF_fnc_initHorde;
	[thistrigger,	array of "marker name", count for each marker,	in building]
*/
private ["_myZone","_this","_spawnZone","_SpawnCount","_indoor","_myzone","_targetList","_x","_playerList","_target","_targetGroup","_groupCount"];
if(isServer)then
{
	if(isNil "infected_init")then {call INF_fnc_infinit;};
	_myZone = _this select 0;
	_spawnZone = _this select 1;
	_SpawnCount = _this select 2;
	_indoor = _this select 3;
	_horde= true;
	//_myzone say3D "zhorde";
	//_targetList= units (group playa1);
	if (!isMultiplayer) then {_targetList=switchableUnits;} else {_targetList=playableUnits;};
	
	missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
	
	{
		  //if (isPlayer _x && (alive _x) ) then { _playerList = _playerList + [_x] };		//List BLUFOR players only
		//if (str _x in ["heli00","heli01","heli02"]) exitwith {};//exclusion list
		if (alive _x ) then //List BLUFOR players & IA
		{
			_targetList = _targetList + [_x];
		};
	} forEach list _myzone;
	_target= _targetList select 0;
	_targetGroup= units (group _target);
	_groupCount = count _targetGroup;
	_targetList = _targetGroup;
	missionNamespace setVariable [format ["%1_TargetList", _myzone], _targetList];
	
	{
		[_myZone,_x,_SpawnCount,_indoor,_horde] spawn INF_fnc_spawner;
	}foreach _spawnZone
};
