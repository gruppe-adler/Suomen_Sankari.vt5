_startPosition = [2579.38,2022.46,-0.00600052];

_path = [
[2608.76,2020.77,0.00660706],
[2738.72,1970.31,0.00250149],
[2746.04,1968.31,0.00135231],
[2751.23,1968.19,0.00122261],
[2756.65,1970.47,0.00127316],
[2761.61,1974.84,0.00127506],
[2768.35,1983.19,0.00128746],
[2771.2,1991.16,0.00128269],
[2772.08,2000.27,0.00124645],
[2773.24,2006.97,0.00127411],
[2778.3,2017.48,0.00121975],
[2784.99,2019.45,0.0012722],
[2791.41,2020.62,0.000871658],
[2801.29,2030.57,-0.00288582],
[2807.53,2041.7,-0.00272942],
[2810.55,2055.05,-0.00288677],
[2812.41,2065.15,-0.00288486],
[2821.42,2080.63,-0.00339222],
[2828.74,2086.34,-0.00275326],
[2840.63,2091.63,0],
[2857.33,2111.11,-0.00296497],
[2861.98,2127.1,-0.0125933],
[2864.96,2141.77,-0.0125332],
[2877.67,2161.71,-0.0124855],
[2887.28,2167.22,-0.0124035],
[2896.69,2169.85,-0.0129108],
[2904.18,2180.16,4.76837e-007],
[2903.55,2187.83,-0.0137668],
[2891.79,2192.26,0],
[2885.52,2195.12,4.76837e-007]
];

_veh = createVehicle ["C_Van_02_medevac_F",_startPosition,[],0,"NONE"];

[
	_veh,
	["CivAmbulance",1], 
	["lights_em_hide",1,"sidesteps_hide",0,"front_protective_frame_hide",0,"beacon_front_hide",0,"beacon_rear_hide",0]
] call BIS_fnc_initVehicle;

createVehicleCrew _veh;

missionNamespace setVariable ["suomen_obj_ambulance", _veh];

[_veh] call suomen_helpers_fnc_clearCargo;

{
	_veh addItemCargoGlobal [_x select 0, _x select 1];
} forEach [
	["GRAD_ALK",2],
	["ACE_elasticBandage",20],
	["ACE_quikclot",20],
	["ACE_bloodIV",10],
	["ACE_epinephrine",20],
	["ACE_morphine",20],
	["ACE_packingBandage",20],
	["ACE_plasmaIV",10],
	["ACE_salineIV",10]
];


_driver = (driver _veh);
_driver allowDamage false;
_driver disableAI "AUTOTARGET";
_driver disableAI "TARGET";
_driver disableAI "FSM";
_driver setCombatMode "BLUE";
_driver allowFleeing 0;

_veh setVehicleLock "UNLOCKED";
_veh setPilotLight true; 
_veh setDriveOnPath _path;

_driver forceWeaponFire ["AmbulanceHorn", "AmbulanceHorn"];
_veh forceSpeed 100;

_lastPosition = _path select (count _path - 2);

/*
_trg = createTrigger ["EmptyDetector", _lastPosition];
_trg setTriggerArea [8, 8, 0, false];
_trg setTriggerActivation ["CIV", "PRESENT", true];
_trg setTriggerStatements [
"this && missionNamespace getVariable ['suomen_obj_ambulance', objNull] in thislist", 
"call suomen_spawner_fnc_spawnDriveByDocs;", 
""];
*/

_veh addEventHandler ["Hit", {
	(_this select 0) removeAllEventHandlers "Hit";
	(_this select 0) setVariable ["suomen_gogogo", true];
}];

_handle = [{
	params ["_args", "_handle"];
	_args params ["_veh", "_lastPosition"];

	/*
	if (!(alive (driver _veh))) exitWith {
		[_handle] call CBA_fnc_removePerFrameHandler;
		[_veh] call suomen_mission_fnc_disembarkAndTurn;
	};
	*/

	if (_veh distance _lastPosition < 15 || _veh getVariable ["suomen_gogogo", false]) then {
		doStop _veh;
		(driver _veh) forceWeaponFire ["AmbulanceHorn", "AmbulanceHorn"];
		[_veh] spawn suomen_spawner_fnc_spawnDriveByDocs;
		_veh setHit ["engine", 1];
		[_handle] call CBA_fnc_removePerFrameHandler;
	};
}, 1, [_veh, _lastPosition]] call CBA_fnc_addPerFrameHandler;

// (driver ambulance) forceWeaponFire ["AmbulanceHorn", "AmbulanceHorn"];