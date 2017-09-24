params ["_car"];

private ["_sounds", "_root"];

_root = parsingNamespace getVariable "MISSION_ROOT";

_sounds = [
"sounds\bongs1.ogg",
"sounds\bongs2.ogg",
"sounds\bongs3.ogg",
"sounds\bongs4.ogg"
];


// loop bonking
[{
    params ["_args", "_handle"];
    _args params ["_root", "_car", "_sounds"];

    if (!alive _car || _car doorPhase "trunk" != 0) exitWith { 
    	[_handle] call CBA_fnc_removePerFrameHandler; 
    	[_car] call suomen_spawner_fnc_createFakeJussi;
    };

    if (random 1 > 0.7) then {
		_car setvelocity [random 0.5 * (sin (random 360)), random 0.5 * (cos (random 360)), random 0.2];
		playSound3D [_root + (selectRandom _sounds), _car, false, getPosATL _car, 20, 1, 75];
	};

},0.5,[_root, _car, _sounds]] call CBA_fnc_addPerFrameHandler;

// create flies
_trunkposition = _car modelToWorldVisual [0,-1,0.3];
[_trunkposition] remoteExec ["suomen_fx_fnc_flies", allPlayers];