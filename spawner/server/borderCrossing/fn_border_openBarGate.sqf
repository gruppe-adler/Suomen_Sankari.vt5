params ["_trigger", "_vehicle", "_guard", "_gate"];

_guard setVariable ["suomen_guard_vehicle", _vehicle];
_guard setVariable ["suomen_guard_vehicle", _gate];

_guard playMoveNow "Acts_ShowingTheRightWay_in";
_gate animate ["Door_1_rot", 1];
//(_this select 0) setDir ((_this select 0) getDir ((_this select 0) getVariable ["suomen_guard_vehicle", objNull]));
_guard addEventHandler ["AnimDone", {

	if ((_this select 1) == "Acts_ShowingTheRightWay_in") then {
		(_this select 0) playMoveNow "Acts_ShowingTheRightWay_loop";
	};

	if ((_this select 1) == "Acts_ShowingTheRightWay_loop") then {
		(_this select 0) playMove "Acts_ShowingTheRightWay_loop";
	};
}];

[{
	!((_this select 2) in list (_this select 0))
},
{
	(_this select 1) removeAllEventHandlers "AnimDone";
	(_this select 1) playMoveNow "Acts_ShowingTheRightWay_out";
	(_this select 1) setVariable ["suomen_guard_busy", false];
	(_this select 3) animate ["Door_1_rot", 0];
		
}, [_trigger, _guard, _vehicle, _gate]] call CBA_fnc_waitUntilAndExecute;