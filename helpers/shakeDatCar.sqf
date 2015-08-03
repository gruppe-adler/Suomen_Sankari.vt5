_car = _this select 0;

[_car] spawn  {

	_target = _this select 0;

	_sound = [
	"sounds\bongs1.ogg",
	"sounds\bongs2.ogg",
	"sounds\bongs3.ogg",
	"sounds\bongs4.ogg"
	];

_root = parsingNamespace getVariable "MISSION_ROOT";

	while {true} do {

		if (JUSSI_FREE) exitWith {};

		_target setvelocity [random 0.5 * (sin (random 360)), random 0.5 * (cos (random 360)), random 0.2];
		playSound3D [_root + (_sound call BIS_fnc_selectRandom), _target, false, getPosASL _target, 10, 1, 50];
		sleep (random 3);
	};
};