//////////////////////////////////////////////////////////////
// heavily modified moerderhoschi explosion by nomisum
//////////////////////////////////////////////////////////////


[4] call suomen_fx_fnc_earthquake;

_nukepos = getPos nukepos;


_light4 = "#lightpoint" createVehicleLocal _nukepos;
_light4 setLightAmbient[.8, .3, .1];
_light4 setLightColor[.8, .3, .1];
_light4 setLightBrightness 100;
_light4 setLightAttenuation [/*start*/ 4, /*constant*/90, /*linear*/ 290, /*quadratic*/ 1, /*hardlimitstart*/15,/* hardlimitend*/35]; 





_smoke = "#particlesource" createVehicleLocal _nukepos;
_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 60], 0, 1.7, 1, 0, [40,15,120], 
				[[1, 1, 1, 0.4],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[1, 1, 1, 0.7],[0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]]
				, [0.5, 0.1], 1, 1, "", "", nukepos];
_smoke setParticleRandom [0, [10, 10, 15], [15, 15, 7], 0, 0, [0, 0, 0, 0], 0, 0, 360];
_smoke setDropInterval 0.002;

_wave = "#particlesource" createVehicleLocal _nukepos;
_wave setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 20, [0, 0, 0],
				[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
				[0.5, 0.5, 0.5, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [1,0.5], 0.1, 1, "", "", nukepos];
_wave setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
_wave setParticleCircle [50, [-80, -80, 2.5]];
_wave setDropInterval 0.0002;


_maxLightBrightness = 25;

/* _wave setDropInterval 0.001;*/
_light = "#lightpoint" createVehicleLocal [((_nukepos select 0)),(_nukepos select 1),((_nukepos select 2)+500)];
_light setLightAmbient[1500, 1200, 1000];
_light setLightColor[1500, 1200, 1000];
_light setLightBrightness _maxLightBrightness;

[_light, _maxLightBrightness] spawn {
	params ["_light", "_maxLightBrightness"];
	_i = 0;
	_loops = 50;
	while {_i < _loops} do
	{
		_light setLightBrightness _maxLightBrightness - (_i *_maxLightBrightness/_loops);
		_i = _i + 1;
		sleep 0.01;
	};
	deleteVehicle _light;
};

[nukepos,10, true] call suomen_fx_fnc_createFire;

_light2 = "#lightpoint" createVehicleLocal ([1,1,1]); 
_light2 setLightAmbient [1,0.1,0];
_light2 setLightColor [1,0,0];
_light2 setLightUseFlare false;			
_light2 setLightDayLight true;

[{
    params ["_args", "_handle"];
    _args params ["_light2", "_smoke"];
    
    if (!alive _smoke) exitWith { 
    	[_handle] call CBA_fnc_removePerFrameHandler;
      	deleteVehicle _light2;
    };

    if (_radius > 0) then {
      _light2 setLightBrightness 8+ random 1;
      _light2 setLightAttenuation [/*start*/ _radius+random 0.5, /*constant*/90+random 10, /*linear*/ 290+random 10, /*quadratic*/ 1, /*hardlimitstart*/1+random 0.5,/* hardlimitend*/500];
    } else {
      _light2 setLightBrightness 8+ random 1;
      _light2 setLightAttenuation [/*start*/ _radius/4+random 0.5, /*constant*/90+random 5, /*linear*/ 290+random 5, /*quadratic*/ 1, /*hardlimitstart*/1+random 0.5,/* hardlimitend*/500]; 
    };

},0.1,[ _light2, _smoke]] call CBA_fnc_addPerFrameHandler;


sleep 0.2;

_light3 = "#lightpoint" createVehicleLocal [((_nukepos select 0)),(_nukepos select 1),((_nukepos select 2)+500)];
_light3 setLightAmbient[1500, 1200, 1000];
_light3 setLightColor[1500, 1200, 1000];
_light3 setLightBrightness _maxLightBrightness;

[_light3, _maxLightBrightness] spawn {
	params ["_light3", "_maxLightBrightness"];
	_i = 1;
	_loops = 50;
	while {_i < 100} do
	{
		_light3 setLightBrightness _maxLightBrightness - (_i *_maxLightBrightness/_loops);
		_i = _i + 1;
		sleep 0.01;
	};
	deleteVehicle _light3;
};


_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 45], 0, 1.7, 1, 0, [40,25,80], 
				[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", _nukepos];

_smoke setDropInterval 0.006;
_wave setDropInterval 0.001;

sleep 2;

_smoke setParticleParams [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48, 1], "", "Billboard", 1, 25, [0, 0, 0],
				[0, 0, 30], 0, 1.7, 1, 0, [40,25,80], 
				[[1, 1, 1, 0.2],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0.3],[1, 1, 1, 0]]
				, [0.5, 0.1], 1, 1, "", "", _nukepos];
_smoke setDropInterval 0.012;
_wave setDropInterval 0.01;

sleep 15;
deleteVehicle _wave;
deleteVehicle _smoke;

_refract = "#particlesource" createVehicleLocal _nukepos;
_refract setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 1, 3, [0, 0, 0],
				[0, 0, 0], 0, 1.5, 1, 0, [50, 100], [[0.1, 0.1, 0.1, 0.5], 
				[0.5, 0.5, 0.5, 0.5], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [1,0.5], 0.1, 1, "", "", nukepos];
_refract setParticleRandom [2, [20, 20, 20], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0];
_refract setParticleCircle [50, [-80, -80, 2.5]];
_refract setDropInterval 0.5;

sleep 10;
deleteVehicle _refract;