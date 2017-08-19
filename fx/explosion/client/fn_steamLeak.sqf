params ["_pos", "_angle"];

private ["_steamLeak", "_steamClouds", "_root", "_radius"];

_radius = 15;

_steamLeak = "#particlesource" createVehicleLocal _pos; 
_steamLeak setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 1.5],
 [-2, -2.5, -0.3], 0, 10, 7.9, 0.075, [0.2, 3], [[0.7, 0.7, 0.7, 0.01], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", "",_angle];
_steamLeak setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_steamLeak setParticleCircle [0, [0, 0, 0]];
_steamLeak setDropInterval 0.05;

_steamClouds = "#particlesource" createVehicleLocal _pos; 
_steamClouds setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 12, [0, 0, -6], [0, 0.2, -0.03], 1, 1.275, 1, 0, [4], [[1, 1, 1, 0], [1, 1, 1, 0.5], [1, 1, 1, 0]], [1000], 1, 0, "", "", "",_angle];
_steamClouds setParticleRandom [5, [_radius, _radius, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_steamClouds setParticleCircle [1, [0, 0, 0]];
_steamClouds setDropInterval 0.1;


_root = parsingNamespace getVariable "MISSION_ROOT";

[{
    params ["_args", "_handle"];
    _args params ["_steamLeak", "_steamClouds", "_root"];

    if (isServer) then {
		playSound3D [_root + "sounds\steam.ogg", _steamLeak];
	};

    if (NUKE_DETONATE) exitWith {
    	deleteVehicle _steamLeak;
    	deleteVehicle _steamClouds;
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };

},4.05,[_steamLeak, _steamClouds, _root]] call CBA_fnc_addPerFrameHandler;