params ["_trigger", "_guard", "_vehicle", "_gate"];

_guard playMoveNow "Acts_PercMstpSlowWrflDnon_handup2c";

_guard setVariable ["suomen_guard_vehicle", _vehicle];
_guard setVariable ["suomen_guard_vehicle", _gate];


//(_this select 0) setDir ((_this select 0) getDir ((_this select 0) getVariable ["suomen_guard_vehicle", objNull]));
_guard addEventHandler ["AnimDone", {

	if ((_this select 1) == "Acts_PercMstpSlowWrflDnon_handup2c") then {
		(_this select 0) playMoveNow "Acts_listeningToRadio_In";
	};

	if ((_this select 1) == "Acts_listeningToRadio_In") then {
		(_this select 0) playMoveNow "Acts_listeningToRadio_Loop";
	};

	if ((_this select 1) == "Acts_listeningToRadio_Loop") then {
		(_this select 0) playMoveNow "Acts_listeningToRadio_Out";
	};

	if ((_this select 1) == "Acts_listeningToRadio_Out") then {
		{_x enableGunLights "forceOn"} foreach (units group (_this select 0));
		(_this select 0) playMoveNow "Acts_WalkingChecking";
	};

	if ((_this select 1) == "Acts_WalkingChecking") then {

		(_this select 0) playMove "Acts_ShowingTheRightWay_in";
		((_this select 0) getVariable ["suomen_guard_vehicle", objNull]) animate ["Door_1_rot", 1];
	};

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