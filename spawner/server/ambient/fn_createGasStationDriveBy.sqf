 /*
 cursorObject reveal gasstation_truck;
 cursorObject setSkill 1; 
 cursorObject setSkill ["aimingAccuracy",1]; 
 cursorObject setSkill ["aimingShake",1]; 
 cursorObject selectWeapon (secondaryWeapon cursorObject);  
 cursorObject doTarget gasstation_truck;  
 cursorObject doWatch gasstation_truck;  
 cursorObject fire (secondaryWeapon cursorObject);
 */

_pathRight = [
	getPosATL pos_gasstation_route_rechts_1,
	getPosATL pos_gasstation_route_rechts_2,
	getPosATL pos_gasstation_route_rechts_3,
	getPosATL pos_gasstation_route_rechts_4,
	getPosATL pos_gasstation_route_rechts_5,
	getPosATL pos_gasstation_route_rechts_6,
	getPosATL pos_gasstation_route_rechts_7,
	getPosATL pos_gasstation_route_rechts_8,
	getPosATL pos_gasstation_route_rechts_9,
	getPosATL pos_gasstation_route_rechts_10,
	getPosATL pos_gasstation_route_rechts_11,
	getPosATL pos_gasstation_route_rechts_12,
	getPosATL pos_gasstation_route_rechts_13,
	getPosATL pos_gasstation_route_rechts_14,
	getPosATL pos_gasstation_route_rechts_15,
	getPosATL pos_gasstation_route_rechts_16,
	getPosATL pos_gasstation_route_rechts_17,
	getPosATL pos_gasstation_route_rechts_18,
	getPosATL pos_gasstation_route_rechts_19,
	getPosATL pos_gasstation_route_rechts_20,
	getPosATL pos_gasstation_route_rechts_21,
	getPosATL pos_gasstation_route_rechts_22,
	getPosATL pos_gasstation_route_rechts_23,
	getPosATL pos_gasstation_route_rechts_24,
	getPosATL pos_gasstation_route_rechts_25,
	getPosATL pos_gasstation_route_rechts_26
];

_pathCenter = [
	getPosATL pos_gasstation_route_mitte_1,
	getPosATL pos_gasstation_route_mitte_2,
	getPosATL pos_gasstation_route_mitte_3,
	getPosATL pos_gasstation_route_mitte_4,
	getPosATL pos_gasstation_route_mitte_5,
	getPosATL pos_gasstation_route_mitte_6,
	getPosATL pos_gasstation_route_mitte_7,
	getPosATL pos_gasstation_route_mitte_8,
	getPosATL pos_gasstation_route_mitte_9,
	getPosATL pos_gasstation_route_mitte_10,
	getPosATL pos_gasstation_route_mitte_11,
	getPosATL pos_gasstation_route_mitte_12,
	getPosATL pos_gasstation_route_mitte_13,
	getPosATL pos_gasstation_route_mitte_14,
	getPosATL pos_gasstation_route_mitte_15,
	getPosATL pos_gasstation_route_mitte_16,
	getPosATL pos_gasstation_route_mitte_17,
	getPosATL pos_gasstation_route_mitte_18,
	getPosATL pos_gasstation_route_mitte_19,
	getPosATL pos_gasstation_route_mitte_20,
	getPosATL pos_gasstation_route_mitte_21,
	getPosATL pos_gasstation_route_mitte_22,
	getPosATL pos_gasstation_route_mitte_23,
	getPosATL pos_gasstation_route_mitte_24,
	getPosATL pos_gasstation_route_mitte_25,
	getPosATL pos_gasstation_route_mitte_26
];

_pathLeft = [
	getPosATL pos_gasstation_route_links_1,
	getPosATL pos_gasstation_route_links_2,
	getPosATL pos_gasstation_route_links_3,
	getPosATL pos_gasstation_route_links_4,
	getPosATL pos_gasstation_route_links_5,
	getPosATL pos_gasstation_route_links_6,
	getPosATL pos_gasstation_route_links_7,
	getPosATL pos_gasstation_route_links_8,
	getPosATL pos_gasstation_route_links_9,
	getPosATL pos_gasstation_route_links_10,
	getPosATL pos_gasstation_route_links_11,
	getPosATL pos_gasstation_route_links_12,
	getPosATL pos_gasstation_route_links_13,
	getPosATL pos_gasstation_route_links_14,
	getPosATL pos_gasstation_route_links_15,
	getPosATL pos_gasstation_route_links_16,
	getPosATL pos_gasstation_route_links_17,
	getPosATL pos_gasstation_route_links_18,
	getPosATL pos_gasstation_route_links_19,
	getPosATL pos_gasstation_route_links_20,
	getPosATL pos_gasstation_route_links_21,
	getPosATL pos_gasstation_route_links_22,
	getPosATL pos_gasstation_route_links_23,
	getPosATL pos_gasstation_route_links_24,
	getPosATL pos_gasstation_route_links_25,
	getPosATL pos_gasstation_route_links_26
];
// diag_log format ["%1 ----- %2 ----- %3", _pathLeft, _pathCenter, _pathRight];

_positions =
[
	[getMarkerPos "mrk_gasstation_spawnLeft", _pathLeft, true],
	[getMarkerPos "mrk_gasstation_spawnCenter", _pathCenter, true],
	[getMarkerPos "mrk_gasstation_spawnRight", _pathRight, false]
];

_buildings = nearestTerrainObjects [(getMarkerPos "mrk_gasstation"), ["HOUSE", "BUILDING", "RUIN"], 200];

GASATTENDANT_MOVE = false;

{
  if (isMultiplayer) then {
	_x allowDamage false;
	_x enableSimulationGlobal false;
  } else {
	_x allowDamage false;
	_x enableSimulation false;
  };
} forEach _buildings;

_group = createGroup [independent,true];

_chemlight = "ACE_G_Chemlight_HiWhite" createVehicle (getMarkerPos "mrk_gasstation_chemlight"); 

_gasattendant = _group createUnit ["GRAD_CivilianZed_rds_schoolteacher_walker", getMarkerPos "mrk_gasstation_waerter", [], 0, "NONE"];
_gasattendant allowDamage false;
_gasattendant setVariable ["suomen_overwriteRZ", true]; // not allowed to target anyone
_gasattendant setVariable ["suomen_ignoreTargets", true];
[_gasattendant, ""] remoteExec ["switchMove", 0];
_gasattendant linkItem "murshun_cigs_cig1";
[_gasattendant] remoteExec ["murshun_cigs_fnc_start_cig", _gasattendant];
[_gasattendant] remoteExec ["murshun_cigs_fnc_smoke"];
_gasattendant setVariable ["RZ_vehicleClass","RyanZombieC_man_1"];

[{
	GASSTATION_ACTION
},
{
	params ["_gasattendant", "_chemlight", "_positions"];


	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 5] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 10] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 15] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 20] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 25] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 1] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 3] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 4] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 5] call CBA_fnc_waitAndExecute;

	[{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
	}, [_gasattendant], 6] call CBA_fnc_waitAndExecute;

	


	{
		private ["_path"];

		_spawnPos = (_x select 0);
		_path = (_x select 1);
		_isBombie = (_x select 2);

		diag_log format ["path is %1", _path];
		

		// create trucks
		_truck = createVehicle ["rhsusf_M1083A1P2_B_WD_fmtv_usarmy", _spawnPos, [], 0, "NONE"];
		_truck setDir 40;
		_truck setPilotLight true;
		_truck setVariable ["suomen_isBombie", _isBombie];
		_crewGroup = createGroup [west, true];
		_crewGroup setBehaviour "CARELESS";
		_crewGroup setCombatMode "BLUE";
		_crewGroup setSpeedMode "FULL";


		_types = [
			"rhsusf_usmc_marpat_wd_rifleman_light",
			"rhsusf_usmc_marpat_wd_rifleman_m4",
			"rhsusf_usmc_marpat_wd_riflemanat",
			"rhsusf_usmc_marpat_wd_driver"
		];

		// create cargo
		for "_i" from 0 to ([4,1] select _isBombie) do 
		{
			_unit = _crewGroup createUnit [selectRandom _types, _spawnPos, [], 0, "NONE"];
			_unit enableDynamicSimulation false;
			[_unit] joinSilent _crewGroup;
			_unit enableReload false;
			[_unit] execVM "loadout\fake_usmc.sqf";

			if (random 1 > 0.7) then {
				_unit setHitPointDamage ["hitLegs", 1];
			};

			// set skills
			_unit setVariable ["asr_ai_exclude", true];
			_unit setSkill ["aimingAccuracy", 0.05];
			_unit setSkill ["aimingShake", 0.05];
			_unit setSkill ["aimingSpeed", 0.15];
			// _unit setSkill ["endurance", 0.1];
			_unit setSkill ["spotDistance", 0.7];
			_unit setSkill ["spotTime", 0.3]; // 1 is very fast
			_unit setSkill ["courage", 0.7];
			_unit setSkill ["reloadSpeed", 0.5];
			_unit setSkill ["commanding", 0.4];
			_unit setSkill ["general", 0.5];
		};

		{
			if (!(leader _crewGroup == _x)) then {
				_x assignAsCargo _truck;
				_x moveInCargo _truck; 
			} else {
				_x assignAsDriver _truck;
				_x moveInDriver _truck;
				_x disableAI "AUTOTARGET";
				_x disableAI "TARGET";
			};
		} forEach units _crewGroup;

		[{
			(_this select 0) distance (_this select 1) < 50
		},
		{
			GASATTENDANT_MOVE = true;
			(_this select 0) removeAllEventHandlers "GetOut";
			doStop (driver (_this select 0));
			[_this select 0, (_this select 0) getVariable ["suomen_isBombie", true]] spawn suomen_spawner_fnc_createGasStationDisembark;
			
		}, [_truck, _path select (count _path - 1)]] call CBA_fnc_waitUntilAndExecute;

		_truck addEventHandler ["GetOut", {
			(_this select 0) removeAllEventHandlers "GetOut";
			[_this select 0, (_this select 0) getVariable ["suomen_isBombie", true]] spawn suomen_spawner_fnc_createGasStationDisembark;

		}];

		_truck setDriveOnPath _path;

		// sleep 1;
	} forEach _positions;

	deleteVehicle _chemlight;

	[{
		GASATTENDANT_MOVE
	},
	{
		[(_this select 0)] remoteExec ["murshun_cigs_fnc_smoke"];
		
			[{
				params ["_args", "_handle"];
				_args params ["_gasattendant"];

				if ((getPos _gasattendant) distance (getMarkerPos "mrk_gasstation") < 5) exitWith {
					[_handle] call CBA_fnc_removePerFrameHandler;
					_gasattendant allowDamage true;
					[_gasattendant] remoteExec ["murshun_cigs_fnc_smoke"];
					call suomen_spawner_fnc_createGasStationAction;
				};
			
				_gasattendant doMove (getMarkerPos "mrk_gasstation");
			}, 1, [(_this select 0)]] call CBA_fnc_addPerFrameHandler;
	}, [_gasattendant]] call CBA_fnc_waitUntilAndExecute;
	

}, [_gasattendant, _chemlight, _positions]] call CBA_fnc_waitUntilAndExecute;