params ["_radius", "_angle"];

private ["_particleEmitter"];

_pos = (getPosATL (vehicle player));
_particleEmitter = "#particlesource" createVehicleLocal _pos; 
_particleEmitter setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 15, [0, 0, -5], [0, 0.2, -0.03], 1, 1.275, 1, 0, [4], [[1, 1, 1, 0], [1, 1, 1, 0.08], [1, 1, 1, 0]], [1000], 1, 0, "", "", "",_angle];
//_particleEmitter setParticleRandom [3, [40, 40, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_particleEmitter setParticleRandom [3, [_radius, _radius, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_particleEmitter setParticleCircle [1, [0, 0, 0]];
_particleEmitter setDropInterval 0.02;


[{
    params ["_args", "_handle"];
    _args params ["_particleEmitter"];

    // if (!alive player) exitWith { [_handle] call CBA_fnc_removePerFrameHandler; };

    _particleEmitter setpos (getPosATL (vehicle player));

},2,[_particleEmitter]] call CBA_fnc_addPerFrameHandler;