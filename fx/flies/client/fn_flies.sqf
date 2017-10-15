/*
	Author: Karel Moricky & Tomas Pavlis

	Description:
	Spawns flies around position.

	Parameter(s):
	_this select 0: ARRAY - Position of flies
	_this select 1 (Optional): NUMBER - interval
	_this select 2 (Optional): NUMBER - size

	Returns:
	ARRAY - spawned particle and sound source
*/

private ["_pos", "_source", "_sounds"];
params ["_target", ["_interval",0.1], ["_size",1], ["_scale",0.75]];

if (typeName _target == "OBJECT") then {
	_pos = getPos _target;
} else {
	_pos = _target;
};

// FIXED PARAMS
_source = "#particlesource" createVehicleLocal _pos;
_source setParticleParams [
/*Sprite*/		["\A3\animals_f\fly.p3d", 1, 0, 1, 0], "", // File, Ntieth, Index, Count, Loop(Bool)
/*Type*/ 		"spaceObject",
/*TimmerPer*/ 		1,
/*Lifetime*/ 		4,
/*Position*/		[0, 0, 0],
/*MoveVelocity*/	[0, 0, 0.5],
/*Simulation*/		0, 1.40, 1, 0, //rotationVel, weight, volume, rubbing
/*Scale*/		[_scale, _scale, _scale, 0],
/*Color*/		[[1, 1, 1, 1],[1, 1, 1, 1]],
/*AnimSpeed*/		[1.5,0.5],
/*randDirPeriod*/	0.01,
/*randDirIntesity*/	0.08,
/*onTimerScript*/ 	"",
/*DestroyScript*/ 	"",
/*Follow*/ 		""
];

if (typeName _target == "OBJECT" && {_target isKindOf "Man"}) then {
	_source attachTo [_target, [0,0,0],"Pelvis"];
};

// RANDOM / TOLERANCE PARAMS
_source setParticleRandom [
/*LifeTime*/ 		2,
/*Position*/		[_size, _size, 0.3],
/*MoveVelocity*/	[0, 0, 0],
/*rotationVel*/ 	1, 
/*Scale*/		0, 
/*Color*/		[0, 0, 0, 0.1],
/*randDirPeriod*/	0.01,
/*randDirIntesity*/	0.04,
/*Angle*/ 		10
];

_source setDropInterval _interval;

_sounds = [
	"fly_1",
	"fly_2",
	"fly_3",
	"fly_4"
];

// playSound3D ["A3\Sounds_F\environment\animals\insect\fly_3.wss", player];
if (typeName _target == "OBJECT") then {
		[{
			params ["_args", "_handle"];
			_args params ["_source", "_target", "_sounds"];

			if (random 1 > 0.9) then {
				_target say3D (selectRandom _sounds);
			};
		}, 2, [_source, _target,_sounds]] call CBA_fnc_addPerFrameHandler;
};
// _sound = createSoundSource["Sound_Flies",_pos,[],0];
// _sound = objnull;

_source