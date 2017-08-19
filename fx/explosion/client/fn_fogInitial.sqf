params ["_obj", "_radius", "_angle"];
_pos = getPos _obj;

private ["_radius", "_initialFog"];

_initialFog = "#particlesource" createVehicleLocal _pos; 
_initialFog setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 12, [0, 0, -6], [0, 0.2, -0.03], 1, 1.275, 1, 0, [4], [[1, 1, 1, 0], [1, 1, 1, 0.5], [1, 1, 1, 0]], [1000], 1, 0, "", "", "",_angle];
_initialFog setParticleRandom [5, [_radius, _radius, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_initialFog setParticleCircle [1, [0, 0, 0]];
_initialFog setDropInterval 0.1;

waitUntil {NUKE_DETONATE};

deleteVehicle _initialFog;
// nul1 = [150,150] call suomen_fx_fnc_fogMoving;
[] execVM "gasmask\gas_secondary.sqf";