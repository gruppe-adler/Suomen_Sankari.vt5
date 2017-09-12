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

_positions =
[
	[getMarkerPos "mrk_gasstation_spawn",getMarkerPos "mrk_gasstation_staging", true],
	[getMarkerPos "mrk_gasstation_spawn3",getMarkerPos "mrk_gasstation_staging3", true],
	[getMarkerPos "mrk_gasstation_spawn2",getMarkerPos "mrk_gasstation_staging2", false]
];

_group = createGroup [independent,true];
_gasattendant = _group createUnit ["GRAD_CivilianZed_rds_schoolteacher_slow", getMarkerPos "mrk_gasstation_waerter", [], 0, "NONE"];
_gasattendant allowDamage false;
_gasattendant setVariable ["suomen_overwriteRZ", true]; // not allowed to target anyone
_gasattendant setVariable ["suomen_ignoreTargets", true];
[_gasattendant, ""] remoteExec ["switchMove", 0];
_gasattendant linkItem "murshun_cigs_cig1";
[_gasattendant] remoteExec ["murshun_cigs_fnc_start_cig", _gasattendant];
[_gasattendant] remoteExec ["murshun_cigs_fnc_smoke"];

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
	GASSTATION_ACTION
},
{
	params ["_gasattendant"];

	[_gasattendant] remoteExec ["murshun_cigs_fnc_smoke"];
	_gasattendant doMove (getMarkerPos "mrk_gasstation");


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

	[{
		((getPos (_this select 0)) distance (getMarkerPos "mrk_gasstation") < 5)
	},
	{
		params ["_gasattendant"];
		_gasattendant allowDamage true;
		[_gasattendant] remoteExec ["murshun_cigs_fnc_smoke"];
		call suomen_spawner_fnc_createGasStationAction;

	}, [_gasattendant]] call CBA_fnc_waitUntilAndExecute;


	{
		_spawnPos = (_x select 0);
		_stagingPos = (_x select 1);
		_isBombie = (_x select 2);
		

		// create trucks
		_truck = createVehicle ["rhsusf_M1083A1P2_B_wd_fmtv_usarmy", _spawnPos, [], 0, "NONE"];
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
		for "_i" from 0 to 10 do 
		{
			_unit = _crewGroup createUnit [selectRandom _types, _spawnPos, [], 0, "NONE"];
			_unit enableDynamicSimulation false;
			[_unit] joinSilent _crewGroup;
			

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
			};
		} forEach units _crewGroup;

		[{
			(_this select 0) distance (_this select 1) < 5
		},
		{
			doStop (driver (_this select 0));
			(group (driver (_this select 0))) leaveVehicle (_this select 0);
			
		}, [_truck, _stagingPos]] call CBA_fnc_waitUntilAndExecute;

		_truck addEventHandler ["GetOut", {
			[_this select 0, (_this select 0) getVariable ["suomen_isBombie", true]] call suomen_spawner_fnc_createGasStationDisembark;
		}];

		_truck doMove _stagingPos;

		sleep 2;
	} forEach _positions;

}, [_gasattendant]] call CBA_fnc_waitUntilAndExecute;