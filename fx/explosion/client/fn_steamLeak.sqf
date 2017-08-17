params ["_position", "_angle"];

private ["_particleEmitter", "_root", "_particleEmitter"];

_particleEmitter = "#particlesource" createVehicleLocal _position; 
_particleEmitter setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 1.5],
 [-2, -2.5, -0.3], 0, 10, 7.9, 0.075, [0.2, 3], [[0.7, 0.7, 0.7, 0.01], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", "",_angle];
_particleEmitter setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_particleEmitter setParticleCircle [0, [0, 0, 0]];
_particleEmitter setDropInterval 0.05;

_root = parsingNamespace getVariable "MISSION_ROOT";

[{
    params ["_args", "_handle"];
    _args params ["_root", "_particleEmitter"];

    if (isServer) then {
		playSound3D [_root + "sounds\steam.ogg", _particleEmitter];
	};

    if (NUKE_DETONATE) exitWith {
    	deleteVehicle _particleEmitter;
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };

},4.05,[_root, _particleEmitter]] call CBA_fnc_addPerFrameHandler;