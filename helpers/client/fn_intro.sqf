

"overlay" cutText ["<t size='3' color='#FFFFFF'>S U O M E N   S A N K A R I</t>", "BLACK FADED",5,true,true];
0 fadeSound 0;

waitUntil {!isNull player};
waitUntil {time > 7};

playMusic "AmbientTrack02_F_Orange";
sleep 7;
"overlay" cutFadeOut 10; 
10 fadeSound 1;
"dynamicBlur" ppEffectEnable true; 
"dynamicBlur" ppEffectAdjust [0]; 
"dynamicBlur" ppEffectCommit 0; 

[ 
		["SOMEWHERE NEAR","font = 'PuristaSemiBold'"],
		["","<br/>"],
		["THE FINNISH-RUSSIAN","font = 'PuristaSemiBold'"],
		["","<br/>"],
		["BORDER...","font = 'PuristaSemiBold'"]
]  execVM "\a3\missions_f_bootcamp\Campaign\Functions\GUI\fn_SITREP.sqf";

sleep 20;
[leakpos, 20, {NUKE_DETONATE}] call suomen_fx_fnc_gasEffectsAdd;