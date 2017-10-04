private ["_lightOne"];

params ["_vehicle", "_speed", "_isAmbulance", ["_lightColor", [0.1, 0.1, 20]], ["_intensity", 5], ["_sleep", 0.75]];

/*
worker ural
_lightposition1 = [0.3, 2.15, 0.71];
_lightposition2 = [0, 2.15, 0.71];
_lightposition3 = [-0.3, 2.15, 0.71];

_lightColor = [20, 20, 0.1];
*/

_lightposition = [0,0,0];

if (_isAmbulance) then {
    _lightposition = [0.25, 0.7, 0.5];
    _lightColor = [20, 0.1, 0.1];
} else {
    _lightposition = [0.0, 0.2, 0.24];
};


///////////

_lightOne = "#lightpoint" createVehicle getpos _vehicle;    
sleep (random 2); 
_lightOne setLightColor _lightColor;
_lightOne setLightBrightness 1;   
_lightOne setLightAmbient [0.1,0.1,1]; 
_lightOne lightAttachObject [_vehicle, _lightposition];  //exact position of _lightOne 
_lightOne setLightAttenuation [0.181, 0, 1000, 130];  
_lightOne setLightIntensity _intensity; 
_lightOne setLightFlareSize 0.38; 
_lightOne setLightFlareMaxDistance 150; 
_lightOne setLightUseFlare true; 

[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_lightOne", "_intensity"];
    
    _on = _vehicle getVariable ["suomen_fx_lightBlink", false];

    if (!alive _vehicle) exitWith { 
        [_handle] call CBA_fnc_removePerFrameHandler;
        deleteVehicle _lightOne;
    };

    if (_on) then {
        _vehicle setVariable ["suomen_fx_lightBlink", false];
        _lightOne setLightBrightness _intensity + 1;
    } else {
       _vehicle setVariable ["suomen_fx_lightBlink", true];
       _lightOne setLightBrightness _intensity - 1;
    };

},_speed,[_vehicle, _lightOne, _intensity]] call CBA_fnc_addPerFrameHandler;