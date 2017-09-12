params ["_vehicle"];

_fakeJussi = (_vehicle getVariable ["suomen_fakeJussi", objNull]);
_face = face _fakeJussi;

_trunkposition = _vehicle modelToWorldVisual [0,-1,0.1];

_pos = getPos _vehicle;
_grp = creategroup independent;
_jussi = _grp createUnit ["GRAD_CivilianZed_rds_uniform_Woodlander4_crawler", _trunkposition, [], 0, "CAN_COLLIDE"];
[_jussi, ""] remoteExec ["switchMove", 0];
[_jussi] execVM "loadout\fake_jussi.sqf";
[_jussi, _face] remoteExecCall ["setFace"];

// _jussi setPos [_trunkposition select 0, _trunkposition select 1, 0.4];
// [_jussi, "AinvPercMstpSnonWnonDnon"] remoteExecCall ["fnc_RyanZombies_PlayMoveNow"];



deleteVehicle _fakeJussi;


["tsk_findComrades","SUCCEEDED",true] call BIS_fnc_taskSetState;