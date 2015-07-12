////////////////////////////////////////////////////////////
// teargas.sqf
// call from units INIT with: _null = [this, sourcepos, radius] execVM "teargas.sqf"
////////////////////////////////////////////////////////////

//if (isDedicated) exitWith {};


_coughing = 0;
_breathing = 0;

While{true} do {
	"dynamicBlur" ppEffectEnable true; // enables ppeffect
	"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
	"dynamicBlur" ppEffectCommit 5; // time it takes to normal
	"filmGrain" ppEffectEnable true;
	"filmGrain" ppEffectAdjust [0]; // enables normal vision
	"filmGrain" ppEffectCommit 5;
	"colorCorrections" ppEffectEnable true;
	"colorCorrections" ppEffectAdjust [1, 1, 0, [1,1,1,0], [1,1,1,1], [0,0,0,0]]; 
	"colorCorrections" ppEffectCommit 5;
	
	resetCamShake; // resets the shake
	3 fadeSound 1;	//fades the sound back to normal

	// if player wears one of the masks, nothing happens but breathing sound
	if ((goggles player == "Mask_M40") || (goggles player == "Mask_M40_OD") || (goggles player == "Mask_M50")) then 
	{
		//playsound3d ["A3\sounds_f\characters\human-sfx\other\diver-breath-2.wss", player,false,getposASL player, 0.8,1,15];
		if (_breathing > 10) then {
			_breathing = 0;
		playsound ["A3\sounds_f\characters\human-sfx\other\diver-breath-1.wss", player,false,getposASL player, 0.8,1,15];
		} else {_breathing + _breathing + 1;};

		if (!(player getVariable ["player_has_gasmask",true])) then {
			cutRsc ["RscGasmaskPicture","PLAIN"];
			player setVariable ["player_has_gasmask",true];
			GASMASK_FOUND = true; publicVariable "GASMASK_FOUND";
		};
	} else {
		cutRsc ["Default", "PLAIN"];
		player setVariable ["player_has_gasmask", false];
	};

	
 		if (!((goggles player == "Mask_M40") || (goggles player == "Mask_M40_OD") || (goggles player == "Mask_M50"))) then {

 			GAS_EFFECTED = GAS_EFFECTED + 1;
 			publicVariable "GAS_EFFECTED";

 			"filmGrain" ppEffectEnable true;
			"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];  
			"filmGrain" ppEffectCommit 1; 

			"colorCorrections" ppEffectEnable true; 
			"colorCorrections" ppEffectAdjust [0.75, 1, 0, [0.8,0.9,1,-0.1], [1,0.5,0.2,1], [-0.5,0,-1,5]]; 
			"colorCorrections" ppEffectCommit 2;


 			
			"dynamicBlur" ppEffectEnable true; // enables ppeffect
			"dynamicBlur" ppEffectAdjust [2]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
 			
			enableCamShake true;	// enables camera shake
			addCamShake [1, 7, 90];	// sets shakevalues
			//player setFatigue 1; // sets the fatigue to 100%
			5 fadeSound 0.1;	// fades the sound to 10% in 5 seconds

			playSound "ACE_heartbeat_fast_3"; // plays heart beating sound
			if (_coughing > 15) then {
				player say3d "coughing";
				_coughing = 0;
			} else {
			_coughing = _coughing+1;
			};
		
	};

	sleep 1;

};


