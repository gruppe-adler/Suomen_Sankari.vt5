params ["_trawler"];

[getPos _trawler, 'normal','red'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];
sleep 0.5;
[getPos _trawler, 'normal','red'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];

sleep 2;
[getPos _trawler, 'normal','white'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];
sleep 0.5;
[getPos _trawler, 'normal','white'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];

sleep 2;
[getPos _trawler, 'fizzer','white'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];
sleep 0.5;
[getPos _trawler, 'fizzer','white'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];

sleep 10;	
[getPos _trawler, 'rain','white'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];
sleep 0.5;
[getPos _trawler, 'rain','white'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];
sleep 5;
[getPos _trawler, 'random','random'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];
sleep 3;
[getPos _trawler, 'random','random'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];
sleep 1;
[getPos _trawler, 'random','random'] remoteExec ["GRAD_fireworks_fnc_prepareFireworks", 2];