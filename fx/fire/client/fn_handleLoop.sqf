params ["_target", "_radius", "_particles", "_light"];

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


// delete if necessary and flicker light
[{
    params ["_args", "_handle"];
    _args params ["_target", "_radius", "_particles", "_light"];
    
    if (!alive _target) exitWith { [_handle] call CBA_fnc_removePerFrameHandler;
    	{ deleteVehicle _x } forEach _particles;
      deleteVehicle _light;
    };

    if (_radius > 0) then {
      _light setLightBrightness 8+ random 1;
      _light setLightAttenuation [/*start*/ _radius+random 0.5, /*constant*/90+random 10, /*linear*/ 290+random 10, /*quadratic*/ 1, /*hardlimitstart*/1+random 0.5,/* hardlimitend*/500];
    } else {
      _light setLightBrightness 8+ random 1;
      _light setLightAttenuation [/*start*/ _radius/4+random 0.5, /*constant*/90+random 5, /*linear*/ 290+random 5, /*quadratic*/ 1, /*hardlimitstart*/1+random 0.5,/* hardlimitend*/500]; 
    };

},0.05,[_target, _radius, _particles, _light]] call CBA_fnc_addPerFrameHandler;