//From "Delaying the Bear"
//if (isDedicated) exitWith {};
params ["_obj", "_radius", "_angle"];
_pos = getPos _obj;

_ps = "#particlesource" createVehicleLocal _pos; 
_ps setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 12, [0, 0, -6], [0, 0.2, -0.03], 1, 1.275, 1, 0, [4], [[1, 1, 1, 0], [1, 1, 1, 0.08], [1, 1, 1, 0]], [1000], 1, 0, "", "", "",_angle];
//_ps setParticleRandom [3, [40, 40, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_ps setParticleRandom [5, [_radius, _radius, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
_ps setParticleCircle [1, [0, 0, 0]];
_ps setDropInterval 0.1;

waitUntil {NUKE_DETONATE};

deleteVehicle _ps;
nul1 = [300,270] call suomen_fx_fnc_fogMoving;
nul2 = [] execVM "gasmask\gas_secondary.sqf";