params ["_target", "_radius", "_particles", "_light", "_persistent"];

private ["_isHumanOnFire"];

_isHumanOnFire = _target isKindOf "Man";


// make sounds
[{
    params ["_args", "_handle"];
    _args params ["_target", "_radius", "_isHumanOnFire"];
    
    if (!alive _target) exitWith { 
    	[_handle] call CBA_fnc_removePerFrameHandler;
    };

  	if (_isHumanOnFire) then {
  		_target say3d ["alias_fire_tipat",300];
  	} else {
  		_target say3d ["alias_fire_furnal",300];
  	};

},3.5,[_target, _radius, _isHumanOnFire]] call CBA_fnc_addPerFrameHandler;


if (_isHumanOnFire) exitWith {};

/*
// delete if necessary and flicker light
[{
    params ["_args", "_handle"];
    _args params ["_target", "_radius", "_particles", "_light", "_persistent"];
    
    if (!alive _target && !_persistent) exitWith { [_handle] call CBA_fnc_removePerFrameHandler;
    	{ deleteVehicle _x } forEach _particles;
      deleteVehicle _light;
    };

    if (_radius > 0) then {
      _light setLightBrightness 8+ random 1;
      _light setLightAttenuation [ _radius+random 0.5, 90+random 10,  290+random 10,  1, 1+random 0.5,500];
    } else {
      _light setLightBrightness 8+ random 1;
      _light setLightAttenuation [ _radius/4+random 0.5, 90+random 5,  290+random 5,  1, 1+random 0.5,500]; 
    };

},0.1,[_target, _radius, _particles, _light, _persistent]] call CBA_fnc_addPerFrameHandler;
*/