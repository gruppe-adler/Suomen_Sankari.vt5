// takes marker positions 
//
// "mrk_heli_start"
// "mrk_heli_end"

if (!isServer) exitWith {};

// marker, marker, type, speed

_start = getMarkerPos (_this select 0);
_end = getMarkerPos (_this select 1);
_type = _this select 2;
_speed = _this select 3;


_heli = createVehicle [_type,_start,[],0,"FLY"];
// RHS_Mi8AMT_vvs
//_veh = createVehicle ["C_Heli_Light_01_civil_F",position player,[],0,"NONE"];


_crew = createVehicleCrew _heli;

_heli setBehaviour "CARELESS";

_heli action ["lightOn", _heli];

_heli doMove _end;

_heli setSpeedMode _speed;

_heli flyInHeight 20;

[_start,_end,_heli] spawn {

	_s = _this select 0;
	_e = _this select 1;
	_t = _this select 2;
	
	while {true} do {
		// hinflug
		if (_e distance _t < 200) exitWith {

			_t doMove _s;
			[_s,_t] spawn {
			_s1 = _this select 0;
			_t1 = _this select 1;
			
				while {true} do {
					// rückflug
					if ((_this select 0) distance _t1 < 200) exitWith { 
						{deleteVehicle _x;}forEach crew _t1;
						deleteVehicle _t1;
						
					};
					_t1 flyInHeight 20;
					sleep 3;
				};
			};
		};
		_t flyInHeight 20;
		sleep 3;
	};
};