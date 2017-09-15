params ["_trigger", "_vehicle", "_guard", "_gate"];
{_x enableGunLights "forceOff"} foreach (units group _guard);
_guard setDir (_guard getDir _vehicle);
_guard playMoveNow "Acts_ShieldFromSun_in";
_guard playMove "Acts_ShieldFromSun_loop";

_guard addEventHandler ["AnimDone", {
	(_this select 0) playMove "Acts_ShieldFromSun_loop";
}];

[{
	(_this select 1) distance (_this select 2) < 35
},
{
	(_this select 1) removeAllEventHandlers "AnimDone";
	(_this select 1) playMoveNow "Acts_ShieldFromSun_out";
	[(_this select 0), (_this select 1), (_this select 2), (_this select 3)] call suomen_spawner_fnc_border_checkVehicle;
		
}, [_trigger, _guard, _vehicle, _gate]] call CBA_fnc_waitUntilAndExecute;

/*
["Acts_ShieldFromSun_in",1.166]
["Acts_ShieldFromSun_loop",5]
["Acts_ShieldFromSun_out",1.82]

["Acts_ShowingTheRightWay_in",1.799]
["Acts_ShowingTheRightWay_loop",1.832]
["Acts_ShowingTheRightWay_out",1.9]

["Acts_WalkingChecking", 26.178]
*/