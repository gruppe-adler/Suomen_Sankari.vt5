params ["_vehicle", "_fakeJussi"];

private ["_face", "_trunkposition", "_jussi"];
// _face = selectRandom RZ_FaceArray;

_trunkposition = _vehicle modelToWorldVisual [0,-1,0.1];

_jussi = (creategroup independent) createUnit [
	"GRAD_CivilianZed_rds_uniform_Woodlander4_crawler",
 	[0,0,0], [], 0, "NONE"
 ];
// [_jussi, ""] remoteExec ["switchMove"];
// [_jussi] execVM "loadout\fake_jussi.sqf";
// [_jussi, _face] remoteExec ["setFace", allPlayers];

_jussi setPos [_trunkposition select 0, _trunkposition select 1, 0.5];
_jussi attachTo [_vehicle];
// [_jussi, "AinvPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];

deleteVehicle _fakeJussi;

[{
	["tsk_findComrades","SUCCEEDED",true] call BIS_fnc_taskSetState;
}, [], 5] call CBA_fnc_waitAndExecute;