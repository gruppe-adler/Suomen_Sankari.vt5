////////////////////////////////////////////////////////////
// teargas.sqf
// call from units INIT with: _null = [this, sourcepos, radius] execVM "teargas.sqf"
////////////////////////////////////////////////////////////

//if (isDedicated) exitWith {};

_unit = _this select 0;
_source = _this select 1;
_radius = _this select 2;

_coughing = 0;
_breathing = 0;

sleep 10;

coughs = [
"cough1",
"cough2",
"cough3",
"cough4"
];

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

	if (NUKE_DETONATE) exitWith {};
	if (player getvariable "isSpectator" == "true") exitWith {};

	// if player wears one of the masks, nothing happens but breathing sound
	if ((goggles player == "Mask_M40") || (goggles player == "Mask_M40_OD") || (goggles player == "Mask_M50")) then 
	{
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

	if ((player distance _source) < (_radius + 10)) then
 	{
 		if (!((goggles player == "Mask_M40") || (goggles player == "Mask_M40_OD") || (goggles player == "Mask_M50"))) then {

 			GAS_EFFECTED = GAS_EFFECTED + 1;
 			publicVariable "GAS_EFFECTED";

 			"filmGrain" ppEffectEnable true;
			"filmGrain" ppEffectAdjust [0.1, -1, 0.1, 0.05, 2, false];  
			"filmGrain" ppEffectCommit 1; 

			"colorCorrections" ppEffectEnable true; 
			"colorCorrections" ppEffectAdjust [0.75, 1, 0, [0.8,0.9,1,-0.1], [1,0.5,0.2,1], [-0.5,0,-1,5]]; 
			"colorCorrections" ppEffectCommit 2;


 			// if not so close, player still can see SOMETHING
 			if ((player distance _source) < _radius) then
 			{
			"dynamicBlur" ppEffectEnable true; // enables ppeffect
			"dynamicBlur" ppEffectAdjust [40/(player distance _source)]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred

			//[player, "HitHead", 0.5,  false] call ace_medical_fnc_setHitPointDamage;
 			} else {
			"dynamicBlur" ppEffectEnable true; // enables ppeffect
			"dynamicBlur" ppEffectAdjust [2]; // intensity of blur
			"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
 			};
			
			enableCamShake true;	// enables camera shake
			addCamShake [1, 7, 90];	// sets shakevalues
			//player setFatigue 1; // sets the fatigue to 100%
			5 fadeSound 0.1;	// fades the sound to 10% in 5 seconds

			playSound "ACE_heartbeat_fast_3"; // plays heart beating sound
			if (_coughing > 5) then {
				player say3d (coughs call BIS_fnc_selectRandom);
				_coughing = 0;
			} else {
			_coughing = _coughing+1;
			};
		};
	};

	sleep 1;

};


