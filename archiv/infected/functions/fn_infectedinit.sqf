private ["_me","_myzone","_initialPos","_nextTarget"];
if(isserver)then{
	_me=(_this select 0)select 0;
	_myzone=_this select 1;
	_initialPos=getPos _me;
	//[_me] joinSilent infected;
	infectedCount = infectedCount + 1;
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
	[_me,_myzone,_initialPos] spawn INF_fnc_roam;
};
