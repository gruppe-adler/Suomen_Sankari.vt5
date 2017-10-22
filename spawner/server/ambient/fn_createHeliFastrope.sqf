/*

	[getPos pos_helifastrope_start, pos_helifastrope_rope, getPos pos_helifastrope_target] spawn suomen_spawner_fnc_createHelifastrope;

*/

params ["_pos", "_ropingPos", "_targetPos"];

_airPos = [_pos select 0, _pos select 1, 30];

_veh = createVehicle ["RHS_UH60M2_d",_pos,[],0,"FLY"];
[
	_veh,
	["LOP_RACS",1], 
	["Holder",0,"AddCargoHook_COver",0]
] call BIS_fnc_initVehicle;

createVehicleCrew _veh;

[_veh] call ace_fastroping_fnc_equipFRIES;

_veh setBehaviour "CARELESS";
_veh flyInHeight 20; 
_veh disableAI "TARGET";
_veh disableAI "AUTOTARGET";
_veh disableAI "AUTOCOMBAT";
_veh setCombatMode "BLUE";
_veh allowfleeing 0;
_veh setSpeedMode "LIMITED";
_veh setCaptive true;




_veh animateDoor ['DoorLB', 1]; 
_veh animateDoor ['DoorRB', 1]; 

_group = createGroup west;
_groupCargo = createGroup west;

[_veh] joinSilent _group;
{[_x] joinSilent _group;} forEach (crew _veh);

for "_i" from 0 to 10 do {
 	_unit = _groupCargo createUnit ["B_GEN_Commander_F", [0,0,0], [], 0, "CARGO"];
 	_unit setUnitLoadout [["SMG_05_F","","","",["30Rnd_9x21_Mag_SMG_02",2],[],""],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["rhs_uniform_g3_blk",[["ACE_fieldDressing",1],["ACE_packingBandage",1],["ACE_morphine",1],["ACE_tourniquet",1],["30Rnd_9x21_Mag_SMG_02",1,30],["immersion_pops_poppack",3,1],["murshun_cigs_cigpack",1,20],["murshun_cigs_lighter",1,100]]],["V_Chestrig_blk",[]],["B_ViperLightHarness_blk_F",[]],"rhssaf_helmet_m97_black_nocamo","Mask_M40",["Binocular","","","",[],[],""],["ItemMap","","ItemRadio","ItemCompass","ItemWatch",""]];
 	_unit assignAsCargo _veh;
 	_unit moveInCargo _veh;
 	_unit addPrimaryWeaponItem "acc_flashlight"; 
   	_unit setUnitPos "UP";
};

_groupCargo enableGunLights "forceon";

_veh doMove (getPos _ropingPos);
_veh setPilotLight true;
_veh flyInHeight 20;

_veh animateDoor ['DoorLB', 1]; 
_veh animateDoor ['DoorRB', 1]; 

(driver _veh) action ["lightOn",  _veh];
waitUntil {_veh distance2D _ropingPos < 100};
_veh flyInHeight 7;
_veh doMove (getPos _ropingPos);
waitUntil { getPosATL _veh select 2 < 10 };
[_veh,false,false] spawn ace_fastroping_fnc_deployAI;

waitUntil {!((_veh getVariable ["ace_fastroping_deployedRopes", []]) isEqualTo [])};
waitUntil {(_veh getVariable ["ace_fastroping_deployedRopes", []]) isEqualTo []};
_veh flyInHeight 50;
_veh doMove _targetPos;
_veh flyInHeight 50;
_wp =_groupCargo addWaypoint [getPos pos_ropeground_target, 0];
_wp setWaypointType "MOVE";
_groupCargo setSpeedMode "FULL";
_groupCargo setCombatMode "YELLOW";

waitUntil {_veh distance2D _targetPos < 100 || !alive _veh};

if (alive _veh) then {
	deleteVehicle _veh;
};

/*
_wp2 = _group addWaypoint [_targetPos,2];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointStatements["true",""];
*/
// waitUntil {_wpDone};
/*
if (alive _veh) then {
	_veh doMove _targetPos;
};
*/