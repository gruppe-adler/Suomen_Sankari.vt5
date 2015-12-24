//From "Delaying the Bear"
//if (isDedicated) exitWith {};

_position = getPos (_this select 0);
_radius = _this select 1;
_angle = _this select 2;

sleep 10;

	//_pos = position vehicle player;
	_pos = _position;
	_ps = "#particlesource" createVehicleLocal _pos; 
	_ps setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d" , 16, 12, 13, 0], "", "Billboard", 1, 12, [0, 0, -6], [0, 0.2, -0.03], 1, 1.275, 1, 0, [4], [[1, 1, 1, 0], [1, 1, 1, 0.08], [1, 1, 1, 0]], [1000], 1, 0, "", "", "",_angle];
	//_ps setParticleRandom [3, [40, 40, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
	_ps setParticleRandom [3, [_radius, _radius, 0], [0, 0, 0], 2, 0.5, [0, 0, 0, 0.1], 0, 0];
	_ps setParticleCircle [1, [0, 0, 0]];
	_ps setDropInterval 0.1;


	[_ps] spawn {
	_object = _this select 0;
	while {true} do {

		if (NUKE_DETONATE) exitWith {
			deleteVehicle _object;
			nul1 = [300,270] execVM "fog\fog_secondary.sqf";
			nul2 = [] execVM "gasmask\gas_secondary.sqf";

			};
			sleep 4;
		};
	};

	/*	while {overCast > FOG} do
	{
		waituntil {vehicle player == player};
		_ps setpos position vehicle player;
		sleep 1;
	};
	
	deleteVehicle _ps;*/
