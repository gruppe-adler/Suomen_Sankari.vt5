params ["_target", "_radius"];


private ["_pos", "_fire", "_refract", "_smoke"];

_pos = getPosATL _target;

// if fire is small
if (!(_radius > 0)) then {
	_fire = "#particlesource" createVehicleLocal _pos;
	_fire setParticleCircle [0, [-1, 1, -1]];
	_fire setParticleRandom [0.5, [0.25, 0.25, 0], [0.175, 0.175, 0.1], 5, 0.15, [0, 0, 0, 0.1], 0.5, 0];
	_fire setParticleParams [["\A3\data_f\cl_fire", 16, 0, 16], "", "Billboard", 1, 1.5, [0, 0, 0], [0.5,-0.5, 3], 50, 10, 7.9, 0.1, [2,1.5,0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [0, 0, 0, 0]], [0.02], 1, 0, "", "", _target];
	_fire setDropInterval 0.05;
	_fire setParticleFire [0.1, _radius/2, 1];

	_refract = "#particlesource" createVehicleLocal _pos;
	_refract setParticleCircle [0, [0, 0, 0]];
	_refract setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 30, 10.5, 7.9, 0.2, [3,2,3], [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _target, /*angle*/ 1,true,/*bounce factor*/1,/*emissiveColor*/[[0,0,0,0]]];
	_refract setDropInterval 0.1;

	_smoke = "#particlesource" createVehicleLocal _pos;
	_smoke setParticleCircle [0, [-0.5, 0.5,-2]];
	_smoke setParticleRandom [7, [0.25, 0.25, 0], [0.175, 0.175, -1], 11, 0.15, [0, 0, 0, 0], 0, 0];
	_smoke setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 1], [0.5, -0.5, 1.5], 50, 10, 7.9, 0.1, [3,7,11,17], [[0, 0, 0, 0.5], [0, 0, 0, 0.5], [0.05, 0.05, 0.05,0.5], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _target];
	_smoke setDropInterval 0.08;

} else {
	_fire = "#particlesource" createVehicleLocal _pos;
	_fire setParticleCircle [_radius-_radius/8, [-1, 1, -1]];
	_fire setParticleRandom [0.5, [0.25, 0.25, 0], [0.175, 0.175, 0.1], 5, 0.15, [0, 0, 0, 0.1], 0.5, 0];
	_fire setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 3, [0, 0, 0], [0.5,-0.5, 3], 50, 10, 7.9, 0.1, [_radius,_radius/2,_radius/4], [[1, 1, 1, 0], [1, 1, 1, 1], [0, 0, 0, 0]], [0.02], 1, 0, "", "", _target];
	_fire setDropInterval 0.1;
	_fire setParticleFire [0.03, _radius*1.2, 0.1];

	_refract = "#particlesource" createVehicleLocal _pos;
	_refract setParticleCircle [_radius+1, [0, 0, 0]];
	_refract setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.75], 30, 10.5, 7.9, 0.2, [_radius/2+3,_radius/2+2,_radius/2+1], [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _target, /*angle*/ 1,true,/*bounce factor*/1,/*emissiveColor*/[[0,0,0,0]]];
	_refract setDropInterval 0.1;

	_smoke = "#particlesource" createVehicleLocal _pos;
	_smoke setParticleCircle [_radius*1.2, [0, 0, 0]];
	_smoke setParticleRandom [30, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_smoke setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 8, [0, 0, 0], [0, 0, 0.75], 50, 10, 7.9, 0.1, [_radius/2,_radius/1.5,_radius,_radius*1.5,_radius*2,_radius*3], [[0, 0, 0, 0.5], [0, 0, 0, 1], [0.01, 0.01, 0.01, 0.8], [0, 0, 0, 0.9], [0.01, 0.01, 0.01, 0.5], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _target];
	_smoke setDropInterval 0.1;
};

[_fire, _refract, _smoke]