// rewrittten version of alias fire script

params ["_target", "_radius"];

_particles = [_target, _radius] call suomen_fx_fnc_createParticles;
_light = [_target, _radius] call suomen_fx_fnc_createLight;

[_target, _radius, _particles, _light] call suomen_fx_fnc_handleLoop;