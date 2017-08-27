params ["_target", "_radius"];

private ["_light"];


_light = createVehicle ["#lightpoint", (getPos _target), [], 0, "CAN_COLLIDE"];
//_light setLightUseFlare true;
_light lightAttachObject [_target, [0,0,1]];
_light setLightColor [1,0.65,0.4];
_light setLightUseFlare false;			
_light setLightDayLight true;
_light setLightFlareMaxDistance 200; 

_light setLightFlareSize 0.5;  // flareSize 50 makes awesome heavenly light ball
_light setLightAttenuation [1,0,0,0]; 
_light setLightIntensity 20;

_light setLightBrightness 2+ random 1;
_light setLightAttenuation [/*start*/ _radius+random 0.5, /*constant*/90+random 10, /*linear*/ 290+random 10, /*quadratic*/ 1, /*hardlimitstart*/1+random 0.5,/* hardlimitend*/500];

_light