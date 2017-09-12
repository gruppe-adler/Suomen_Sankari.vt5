/*
	Author: Zozo
	
	Description:
	Earthquake simulation - now just camera shake and sound
	
	Parameter(s):
	_this select 0:	INT - intensity {1,2,3,4}	
	
	Returns:
	NONE
	
*/
private ["_magnitude", "_power", "_duration", "_frequency", "_offset", "_compensation", "_eqsound", "_fatiguedefault", "_fatigue"];
_magnitude = _this param [0, 2, [0]];   
_power = 0.3;
_duration = 20;
_frequency = 100;  
_offset = 1;
_eqsound = "Earthquake_01";
_compensation = 0;


switch( _magnitude ) do
{
	case 1: 
	{
		_power = 0.5;
		_duration = 13;
		_compensation = 4;
		_frequency = 200;
		_eqsound = "Earthquake_01";
	};
	case 2: 
	{
		_power = 0.8;
		_duration = 20;
		_compensation = 8.5;
		_frequency = 50;
	};
	case 3: 
	{
		_power = 1.5;
		_duration = 20;
		_compensation = 7;
		_frequency = 40;
	};
	case 4: 
	{
		_power = 2.1;
		_duration = 20;
		_compensation = 6;
		_frequency = 30;	
	};
	default { [ "EarthQuake: number not defined, using default shake" ] call BIS_fnc_Log; }
};	
enableCamShake true;
addCamShake [_power, _duration, _frequency];