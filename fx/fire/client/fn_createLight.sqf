params ["_target", "_radius"];

private ["_light"];

_light = "#lightpoint" createVehicleLocal ([1,1,1]); 
_light lightAttachObject [_target, [0,0,-1]];
_light setLightAmbient [1,0.1,0];
_light setLightColor [1,0,0];
_light setLightUseFlare true;			
_light setLightDayLight true;

_light