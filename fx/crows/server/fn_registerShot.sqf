params ["_pos"];

private ["_nearest", "_markers", "_marker", "_markersAvailable", "_possibleTrees", "_selectedTree"];

_markers = missionNamespace getVariable ["GRAD_crows_startlingMarkers", []];
_markersAvailable = count _markers > 0;

if (_markersAvailable) then {
	_nearest = [_markers, _pos] call BIS_fnc_nearestPosition;
};

if (_markersAvailable && {(_pos distance (getMarkerPos _nearest)) < STARTLING_DISTANCE}) exitWith { diag_log format ["already clear of birds"]; };

_possibleTrees = [];

{
    if (str _x find ": t_" > -1) then {
        _possibleTrees pushBack _x;
    };
} forEach nearestObjects [_pos, [], STARTLING_DISTANCE/2];

[{
	_possibleTrees = _this select 0;

	if (count _possibleTrees > 0) then {
		for "_i" from 0 to (ceil (random 5)) do {
			_selectedTree = selectRandom _possibleTrees;
			[_selectedTree modelToWorld boundingCenter _selectedTree] remoteExec ["suomen_fx_fnc_startleBirds", allPlayers];
			[{[[random worldSize,random worldSize,100]] remoteExec ["suomen_fx_fnc_setBirdTarget"]; }, [], random 2] call CBA_fnc_waitAndExecute;
		};


		// todo make local after debugging
		_marker = createMarker [format["%1", toString _pos], _pos];
		_marker setMarkerShape "ELLIPSE";
		_marker setMarkerSize [STARTLING_DISTANCE/2,STARTLING_DISTANCE/2];
		_markers append [_marker];
		missionNamespace setVariable ["GRAD_crows_startlingMarkers", _markers];

	} else {
		diag_log format ["no trees"];
	};
}, [_possibleTrees], random 0.7] call CBA_fnc_waitAndExecute;