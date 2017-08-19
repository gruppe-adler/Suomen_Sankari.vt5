class RscTitles{
    #include "define.hpp"

    class Default 
    {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    };
    
    class RscGasmaskEffect  {
        idd = -1;
        onLoad = "uiNamespace setVariable ['Gasmask_Display', _this select 0]";
        onUnload = "uiNamespace setVariable ['Gasmask_Display', displayNull]";
        fadeIn=0.5;
        fadeOut=0.5;
        movingEnable = false;
        duration = 10e10;
        name = "RscGasmaskEffect";
        class controls;
    };
    
    class RscGasmaskPicture:RscGasmaskEffect {
        idd = 1983;
        name = "RscGasmaskPicture"; 
        class controls{
            class gogglesImage: RscPicture{
                idc = 11111;
                text = "fx\gas\data\gasmask_texture2.paa";
            };
        };
    };
    
  
  };