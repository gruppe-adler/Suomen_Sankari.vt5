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