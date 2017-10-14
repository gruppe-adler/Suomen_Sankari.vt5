params ["_veh"];

private ["_fake_jussi"];

_fake_jussi = (createGroup civilian) createUnit ["C_man_1", [0,0,0], [], 0, "NONE"];
[_fake_jussi] execVM "loadout\fake_jussi.sqf";

_fake_jussi moveInCargo [_veh,3];

_fake_jussi disableAI "MOVE"; 
_fake_jussi disableAI "ANIM"; 
_fake_jussi disableAI "FSM"; 
_fake_jussi disableAI "AUTOTARGET";
_fake_jussi disableAI "TARGET";

_fake_jussi setIdentity "jussi";

// TODO test
_fake_jussi addEventHandler ["Hit", {
	(_this select 0) removeAllEventHandlers "Hit";
	(vehicle (_this select 0)) removeAllEventHandlers "GetOut";
	[(vehicle (_this select 0)), (_this select 0)] call suomen_spawner_fnc_releaseJussi;
}];

_veh addEventHandler ["GetOut", 
{
	[(_this select 0), (_this select 2)] call suomen_spawner_fnc_releaseJussi;
}];
/*
[{
	
}, [_veh, _fake_jussi], 2] call CBA_fnc_waitAndExecute;
*/