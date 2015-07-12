// effekt 1
// setParticleCircle [0, [0, 0, 0]];
// setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
// setParticleParams [["\A3\data_f\ParticleEffects\Universal\smoke.p3d", 1, 0, 1], "", "Billboard", 1, 2.5, [0, 0, 2], [0, -2.5, 0.3], 0, 10, 7.9, 0.075, [0.2, 3, 6], [[0.1, 0.1, 0.1, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
// setDropInterval 0.03;

// effekt 2
// setParticleCircle [0, [0, 0, 0]];
// setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
// setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 2], [0, -2.5, 0.3], 0, 10, 7.9, 0.075, [0.2, 3], [[0.7, 0.7, 0.7, 0.01], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", XXXOBJECTXXX];
// setDropInterval 0.05;

_position = getPos (_this select 0);
_angle = _this select 1;

_ps = "#particlesource" createVehicleLocal _position; 
_ps setParticleParams [["\A3\data_f\cl_basic.p3d", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 1.5],
 [-2, -2.5, -0.3], 0, 10, 7.9, 0.075, [0.2, 3], [[0.7, 0.7, 0.7, 0.01], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", "",_angle];
_ps setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ps setParticleCircle [0, [0, 0, 0]];
_ps setDropInterval 0.05;



[_ps] spawn {
_object = _this select 0;
_root = parsingNamespace getVariable "MISSION_ROOT";
while {true} do {
if (isServer) then {
	playSound3D [_root + "sounds\steam.ogg", _object];
};
sleep 4.05;
	if (NUKE_DETONATE) exitWith {deleteVehicle _object;};
	};
};