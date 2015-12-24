_ikarusLocal = _this select 0;

[_ikarusLocal] spawn {
	_ikarus = _this select 0;
	_real_radio = "Land_FMradio_F" createVehicleLocal (getPos _ikarus);
	_real_radio attachTo [ikarus, [0,0,-0.5]];
	while {true} do {

		if (!alive _ikarus) exitWith {};
		waitUntil {sleep 0.3;(RADIO_PLAYING);};

		_radio = "Land_PenBlack_F" createVehicleLocal (getPos _ikarus);
		
		_radio attachTo [_ikarus, [0,0,2]];

		_radio say3D "music_smells";
		if (!alive _ikarus) exitWith {};
		waitUntil {sleep 0.3;!(RADIO_PLAYING);};
		deleteVehicle _radio;
	};
};

[_ikarusLocal] spawn {
	_ikarus = _this select 0;
	
	while {true} do {

		if (!alive _ikarus) exitWith {};
		waitUntil {sleep 0.3;(LIGHT_ON);};

		_light="#lightpoint"createVehicleLocal(getPos _ikarus);  
		_light setLightBrightness 0.5;  
		_light setLightAmbient[0.3,0.3,0.3];  
		_light setLightColor[1.0,1.0,1.0];  
		_light setLightUseFlare true;
		_light setLightFlareSize 0.1;
		_light setLightAttenuation [2,15,40,400];
		_light attachTo [_ikarus,[0,0,1.1]];  

		_light2="#lightpoint"createVehicleLocal(getPos _ikarus);  
		_light2 setLightBrightness 0.5;  
		_light2 setLightAmbient[0.3,0.3,0.3];  
		_light2 setLightColor[1.0,1.0,1.0];  
		_light2 setLightUseFlare true;
		_light2 setLightFlareSize 0.1;
		_light2 setLightAttenuation [2,15,40,400];
		_light2 attachTo [_ikarus,[0,3,1.1]];  

		_light3="#lightpoint"createVehicleLocal(getPos _ikarus);  
		_light3 setLightBrightness 0.5;  
		_light3 setLightAmbient[0.3,0.3,0.3];  
		_light3 setLightColor[1.0,1.0,1.0];  
		_light3 setLightUseFlare true;
		_light3 setLightFlareSize 0.1;
		_light3 setLightAttenuation [2,15,40,400];
		_light3 attachTo [_ikarus,[0,-3,1.1]];  

		
		if (!alive _ikarus) exitWith {};
		waitUntil {sleep 0.3;!(LIGHT_ON);};
		deleteVehicle _light;
		deleteVehicle _light2;
		deleteVehicle _light3;
	};
};