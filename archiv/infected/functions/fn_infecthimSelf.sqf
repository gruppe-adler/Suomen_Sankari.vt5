/*
use this to create an infected in the editor.
exemple in the init box:
null = this spawn INF_fnc_infecthim
*/
private ["_me","_initialPos","_nextTarget"];
if(isserver)then{

	
	
	if(isNil "infected_init")then {call INF_fnc_infinit;};
	_me=_this select 0;
	_initialPos=getPos _me;
	_me disableAI "FSM";
	_me disableAI "AUTOTARGET";
	_me disableAI "TARGET";
	_me setBehaviour "CARELESS";
	_me enableFatigue false;
	_me setVariable ["BIS_noCoreConversations", true];
	[_me] spawn INF_fnc_Stuff;
	_me addEventHandler ["hit",{
		[[_this select 0,"hurt"], "INF_fnc_NextSound"] call BIS_fnc_MP;
		(_this select 0) lookAt (_this select 1);
		_nextTarget = [] + [_this select 1];
		missionNamespace setVariable [format ["%1_nextTarget",_this select 0], _nextTarget];
	}];
	infectedCount = infectedCount + 1;
	
	[_me,_initialPos] spawn INF_fnc_Edroam;
};
