attachBluelight = { 
    Private ["_vehicle","_lightRed","_lightColor","_lightOne","_blinkStateBrighter"]; 
    // _this select 0 : objVehicle 
    // _this select 1 : blingspeed 
     
    _vehicle = _this select 0;   
    _isAmbulance = _this select 2;
    _lightColor = [0.1, 0.1, 20];
    _intensity = 5;
    _sleep = (random 0.5) + 0.5;

    _lightposition = [0,0,0];

    if (_isAmbulance) then {
        _lightposition = [0.25, 0.7, 0.5];
        _lightColor = [20, 0.1, 0.1];
    } else {
        _lightposition = [0.0, 0.0, 0.24];
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

     
    _blinkStateBrighter = true;   
    while{ (alive _vehicle)} do   
    {   

   
        if(_blinkStateBrighter) then   
         {   
            
            _intensity = _intensity + 3;

            _lightOne setLightBrightness _intensity;

           
            _blinkStateBrighter = false;    
            
        sleep _sleep;
          
         }   
     else   
     {   
            
            _intensity = _intensity - 3;

            _lightOne setLightBrightness _intensity;

            
            _blinkStateBrighter = true;    
           
        sleep _sleep;
     };   
      sleep (_this select 1);   
    };   
    deleteVehicle _lightOne;
};

attachYellowlight = { 
    Private ["_vehicle","_lightRed","_lightColor","_lightOne","_blinkStateBrighter"]; 
    // _this select 0 : objVehicle 
    // _this select 1 : blingspeed 
     
    _vehicle = _this select 0; 
    _lightColor = [20, 20, 0.1];
    _intensity = 5;
    _sleep = (random 0.5) + 0.5;

    _lightposition1 = [0.3, 2.15, 0.7];
    _lightposition2 = [0, 2.15, 0.7];
    _lightposition3 = [-0.3, 2.15, 0.7];
    

    
    ///////////

    _lightOne = "#lightpoint" createVehicle getpos _vehicle;    
    _lightTwo = "#lightpoint" createVehicle getpos _vehicle;    
    _lightThree = "#lightpoint" createVehicle getpos _vehicle;    
    sleep 1; 
    _lightOne setLightColor _lightColor;
    _lightOne setLightBrightness 4;   
    _lightOne setLightAmbient [0.1,0.1,1]; 
    _lightOne lightAttachObject [_vehicle, _lightposition1];  //exact position of _lightOne 
    _lightOne setLightAttenuation [0.181, 0, 1000, 130];  
    _lightOne setLightIntensity _intensity; 
    _lightOne setLightFlareSize 0.38; 
    _lightOne setLightFlareMaxDistance 150; 
    _lightOne setLightUseFlare true;

    _lightTwo setLightColor _lightColor;
    _lightTwo setLightBrightness 4;   
    _lightTwo setLightAmbient [0.1,0.1,1]; 
    _lightTwo lightAttachObject [_vehicle, _lightposition2];  //exact position of _lightTwo 
    _lightTwo setLightAttenuation [0.181, 0, 1000, 130];  
    _lightTwo setLightIntensity _intensity; 
    _lightTwo setLightFlareSize 0.38; 
    _lightTwo setLightFlareMaxDistance 150; 
    _lightTwo setLightUseFlare true;

    _lightThree setLightColor _lightColor;
    _lightThree setLightBrightness 4;   
    _lightThree setLightAmbient [0.1,0.1,1]; 
    _lightThree lightAttachObject [_vehicle, _lightposition3];  //exact position of _lightThree 
    _lightThree setLightAttenuation [0.181, 0, 1000, 130];  
    _lightThree setLightIntensity _intensity; 
    _lightThree setLightFlareSize 0.38; 
    _lightThree setLightFlareMaxDistance 150; 
    _lightThree setLightUseFlare true;

      
    while{ (alive _vehicle)} do   
    {   
      sleep (_this select 1);   
    };   
    deleteVehicle _lightOne;
    deleteVehicle _lightTwo;
    deleteVehicle _lightThree;
};  