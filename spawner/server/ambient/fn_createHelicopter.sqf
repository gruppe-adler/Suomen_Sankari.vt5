// takes marker positions 
//
// "mrk_heli_start"
// "mrk_heli_end"

if (!isServer) exitWith {};

params ["_start", "_end", "_type", "_speed"];
_spawn = getMarkerPos _start;
_despawn = getMarkerPos _end;
[_spawn,_despawn,30,_speed,_type,WEST] call BIS_fnc_ambientFlyby; 