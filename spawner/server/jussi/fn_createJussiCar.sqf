params ["_pos"];

_veh = "RDS_Gaz24_Civ_03" createVehicle _pos;
_veh setDir 284;

_fake_jussi = (createGroup civilian) createUnit ["C_man_1", _pos, [], 0, "NONE"];
[_fake_jussi] execVM "loadout\fake_jussi.sqf";
_face = selectRandom RZ_FaceArray;
[_fake_jussi, _face] remoteExecCall ["setFace"];

_fake_jussi moveInCargo [_veh,3];
_veh lockCargo true;
_veh setVehicleLock "LOCKED";

_fake_jussi disableAI "MOVE"; 
_fake_jussi disableAI "ANIM"; 
_fake_jussi disableAI "FSM"; 
_fake_jussi disableAI "AUTOTARGET";
_fake_jussi disableAI "TARGET";
_veh setVariable ["suomen_fakeJussi", _fake_jussi];

[_veh, _fake_jussi] call suomen_spawner_fnc_shakeDatCar;

_veh