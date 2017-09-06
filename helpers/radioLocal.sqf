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