params ["_target", "_radius"];

private ["_light"];

_brightness	= 1.0;
_color	= [1,0.65,0.4]; // [1,0.65,0.4]; // [1,0.85,0.6];
_ambient	= [1,0.65,0.4];
_intensity	= 1000;
_attenuation = [0.5,_radius,0,1.6];

_light = createVehicle ["#lightpoint", (getPos _target), [], 0, "CAN_COLLIDE"];
//_light setLightUseFlare true;
_light lightAttachObject [_target, [0,0,1]];
_light setLightUseFlare false;			
_light setLightDayLight true;

_light setLightBrightness _brightness;
_light setLightColor _color;
_light setLightAmbient _ambient;
_light setLightIntensity _intensity;
_light setLightAttenuation _attenuation;

_light