params ["_target", "_radius"];


private ["_pos", "_fire", "_refract", "_smoke"];

_pos = getPosATL _target;

// if fire is small
if (!(_radius > 0)) then {

	_colorRed = 0.5;
	_colorGreen = 0.0;
	_colorBlue = 0.0;
	_effectSize = 0.1; // 0.05 molotov, 0.1 man
	_orientation = 5.4;
	_particleLifeTime = 1;
	_particleDensity = 25;
	_particleSize = 1;
	_particleSpeed = 1;

	_fire = "#particlesource" createVehicleLocal [0,0,0];
	//--- particle effect creation
	_fire setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32],"","billboard",1,_particleLifeTime,[0,0,0],[0,0,0.4*_particleSpeed],0,0.0565,0.05,0.03,[0.9*_particleSize,0],
							[[1*_colorRed,1*_colorGreen,1*_colorBlue,-0],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,0]],
							[1], 0.01, 0.02, "", "", "",_orientation,false,-1,[[3,3,3,0]]];
	_fire setParticleRandom [_particleLifeTime/4, [0.15*_effectSize,0.15*_effectSize,0], [0.2,0.2,0],  0.4,               0,  [0,0,0,0], 0, 0, 0.2];
							//[lifeTime,             position,                              moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity] 
	_fire setParticleFire [0.6, 0.25, 0.1];
	_fire setDropInterval (1/_particleDensity);
	_fire attachTo [_target,[0,0,1]];

	_refract = "#particlesource" createVehicleLocal _pos;
	_refract setParticleCircle [0, [0, 0, 0]];
	_refract setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1],"","billboard",1,_particleLifeTime,[0,0,0],[0,0,0.4*_particleSpeed],0,0.0565,0.05,0.03,[0.9*_particleSize,0],
							[[1*_colorRed,1*_colorGreen,1*_colorBlue,-0],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,-1],[1*_colorRed,1*_colorGreen,1*_colorBlue,0]],
							[1], 0.01, 0.02, "", "", "",_orientation,false,-1,[[3,3,3,0]]];
	_refract setDropInterval 0.1;


	//--- variables set by user
	_colorRed = 0.5;
	_colorGreen = 0.5;
	_colorBlue = 0.5;
	_colorAlpha = 0.5;
	_particleLifeTime = 2; //50, 5 is HUGE amount of smoke, so lower is more
	_particleDensity = 5; //10
	_particleSize = 0.5; //1
	_particleSpeed = 2; //1
	_particleLifting = 1;
	_windEffect = 1;
	_effectSize = .25; //1
	_expansion = .1;
	_smoke = "#particlesource" createVehicleLocal [0,0,0];

	//--- particle effect creation
	_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02",8,0,40,1],"","billboard",1,_particleLifeTime,[0,0,0],[0,0,2*_particleSpeed],0,0.05,0.04*_particleLifting,0.05*_windEffect,[1 *_particleSize + 1,1.8 * _particleSize + 1],
			[[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.7*_colorAlpha],[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.6*_colorAlpha],[0.7*_colorRed,0.7*_colorGreen,0.7*_colorBlue,0.45*_colorAlpha],
			[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.28*_colorAlpha],[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.16*_colorAlpha],[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.09*_colorAlpha],
			[0.84*_colorRed,0.84*_colorGreen,0.84*_colorBlue,0.06*_colorAlpha],[1*_colorRed,1*_colorGreen,1*_colorBlue,0.02*_colorAlpha],[1*_colorRed,1*_colorGreen,1*_colorBlue,0*_colorAlpha]],
			[1,0.55,0.35], 0.1, 0.08*_expansion, "", "", ""];
	_smoke setParticleRandom [_particleLifeTime/10, [0.1*_effectSize,0.1*_effectSize,0.1*_effectSize], [0.3,0.3,0.5], 1, 0, [0,0,0,0.06], 0, 0];
							//[lifeTime, position, moveVelocity, rotationVelocity, size, color, randomDirectionPeriod, randomDirectionIntensity] 
	_smoke setDropInterval (1/_particleDensity);
	_smoke attachTo [_fire, [0,0,0]];





	/*
		_fire = "#particlesource" createVehicleLocal _pos;
		_fire setParticleCircle [0, [-1, 1, -1]];
		_fire setParticleRandom [0.5, [0.25, 0.25, 0], [0.175, 0.175, 0.1], 5, 0.15, [0, 0, 0, 0.1], 0.5, 0];
		_fire setParticleParams [["\A3\data_f\cl_fire", 16, 0, 16], "", "Billboard", 1, 1.5, [0, 0, 0], [0.5,-0.5, 3], 50, 10, 7.9, 0.1, [2,1.5,0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [0, 0, 0, 0]], [0.02], 1, 0, "", "", _target];
		_fire setDropInterval 0.05;
		_fire setParticleFire [0.1, _radius/2, 1];

		_refract = "#particlesource" createVehicleLocal _pos;
		_refract setParticleCircle [0, [0, 0, 0]];
		_refract setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
		_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 5, [0, 0, 0], [0, 0, 0.75], 30, 10.5, 7.9, 0.2, [3,2,3], [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _target, 1,true,1,[[0,0,0,0]]];
		_refract setDropInterval 0.1;

		_smoke = "#particlesource" createVehicleLocal _pos;
		_smoke setParticleCircle [0, [-0.5, 0.5,-2]];
		_smoke setParticleRandom [7, [0.25, 0.25, 0], [0.175, 0.175, -1], 11, 0.15, [0, 0, 0, 0], 0, 0];
		_smoke setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 30, [0, 0, 1], [0.5, -0.5, 1.5], 50, 10, 7.9, 0.1, [3,7,11,17], [[0, 0, 0, 0.5], [0, 0, 0, 0.5], [0.05, 0.05, 0.05,0.5], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _target];
		_smoke setDropInterval 0.08;
		*/

} else {

	_lifeTime = 20;
	_lifeTimeRandom = 2;
	
	_fire = "#particlesource" createVehicleLocal _pos;
	_fire setParticleCircle [_radius-_radius/8, [-1, 1, -1]];
	_fire setParticleRandom [0.5, [0.25, 0.25, 0], [0.175, 0.175, 0.1], 5, 0.15, [0, 0, 0, 0.1], 0.5, 0];
	_fire setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 3, [0, 0, 0], [0.5,-0.5, 3], 50, 10, 7.9, 0.1, [_radius,_radius/2,_radius/4], [[1, 1, 1, 0], [1, 1, 1, 1], [0, 0, 0, 0]], [0.02], 1, 0, "", "", _target];
	_fire setDropInterval 0.05;
	_fire setParticleFire [0.03, _radius*1.2, 0.1];

	_refract = "#particlesource" createVehicleLocal _pos;
	_refract setParticleCircle [_radius+1, [0, 0, 0]];
	_refract setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0.75], 30, 10.5, 7.9, 0.2, [_radius/2+3,_radius/2+2,_radius/2+1], [[0.1, 0.1, 0.1, 0.1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _target,  1,true,1,[[0,0,0,0]]];
	_refract setDropInterval 0.1;

	_smoke = "#particlesource" createVehicleLocal _pos;
	_smoke setParticleCircle [_radius*1.2, [0, 0, 0]];
	_smoke setParticleRandom [_lifeTimeRandom, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
	_smoke setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, _lifeTime, [0, 0, 0], [0, 0, 1], 50, 10, 7.9, 0.1, [_radius/2,_radius/1.5,_radius,_radius*1.5,_radius*2,_radius*3], [[0, 0, 0, 0.5], [0, 0, 0, 1], [0.01, 0.01, 0.01, 0.8], [0, 0, 0, 0.9], [0.01, 0.01, 0.01, 0.5], [0, 0, 0, 0]], [0.08], 1, 0, "", "", _target];
	_smoke setDropInterval 0.1;
};

[_fire, _refract, _smoke]