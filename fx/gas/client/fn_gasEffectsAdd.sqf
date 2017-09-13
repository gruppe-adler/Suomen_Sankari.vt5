params ["_pos", "_distance", "_condition"];

_coughs = [
	"cough1",
	"cough2",
	"cough3",
	"cough4"
];

_gas_breathing = [
	"gas_breathing1",
	"gas_breathing2",
	"gas_breathing3",
	"gas_breathing4"
];


_protectingGoggles = [
	"Mask_M40",
	"Mask_M40_OD",
	"Mask_M50"
];

// delete if necessary and flicker light
[{
    params ["_args", "_handle"];
    _args params ["_coughs", "_gas_breathing", "_protectingGoggles", "_pos", "_distance", "_condition"];
    
    if (NUKE_DETONATED) then {
    	_distance = 5000;
    };

    if (!alive player || MISSION_COMPLETED) exitWith { 
    	[_handle] call CBA_fnc_removePerFrameHandler;
    	call suomen_fx_fnc_gasEffectsReset;
    };

   	// call suomen_fx_fnc_gasEffectsReset;

	if (player getvariable "isSpectator" == "true") exitWith {};

	// if player wears one of the masks, nothing happens but breathing sound
	if (goggles player in _protectingGoggles) then {
		
			_breathing = player getVariable ["GRAD_fx_breathingCounter",0];

			if (_breathing > 10) then {
				_breathing = 0;
				playsound (selectRandom gas_breathing);
			} else {
				_breathing = _breathing + 1;
				 player setVariable ["GRAD_fx_breathingCounter",_breathing];
			};


			if (!(player getVariable ["player_has_gasmask",false])) then {
				cutRsc ["RscGasmaskPicture","PLAIN"];
				player setVariable ["player_has_gasmask",true];
				GASMASK_FOUND = true; 
				publicVariableServer "GASMASK_FOUND";
			};

	} else {
			cutRsc ["Default", "PLAIN"];

			if (player distance _pos < _distance) then {
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

				_coughing = player getVariable ["GRAD_fx_coughingCounter",0];

				if (_coughing > 5) then {
					player say3d [selectRandom _coughs, 20];
					_coughing = 0;
				} else {
					_coughing = _coughing + 1;
					player setVariable ["GRAD_fx_coughingCounter",_coughing];
				};
			};
	};

},1,[_coughs, _gas_breathing, _protectingGoggles, _pos, _distance, _condition]] call CBA_fnc_addPerFrameHandler;