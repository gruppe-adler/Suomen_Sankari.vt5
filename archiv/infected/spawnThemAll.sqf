
_spawnMarker = _this select 0;
_zcount = _this select 1;



for [{_i=0},{_i < _zcount},{_i=_i+1}] do
	{ 

		_unit = [
		"rhsusf_army_ocp_rifleman_1stcav",
		"rhsusf_army_ocp_rifleman_82nd",
		"rhsusf_army_ocp_rifleman_101st",	
		"rhsusf_army_ocp_rifleman_10th",
		"rhsusf_army_ocp_rifleman",
		"rhsusf_army_ocp_rifleman_m4",
		"rhsusf_army_ocp_rifleman_m16",
		"rhsusf_army_ocp_rifleman_m590",
		"rhsusf_army_ocp_riflemanl",
		"rhsusf_army_ocp_riflemanat",
		"rhsusf_army_ocp_grenadier",
		"rhsusf_army_ocp_autorifleman",
		"rhsusf_army_ocp_autoriflemana",	
		"rhsusf_army_ocp_machinegunner",
		"rhsusf_army_ocp_machinegunnera",	
		"rhsusf_army_ocp_officer",
		"rhsusf_army_ocp_squadleader",
		"rhsusf_army_ocp_teamleader",
		"rhsusf_army_ocp_jfo",
		"rhsusf_army_ocp_fso",	
		"rhsusf_army_ocp_javelin",
		"rhsusf_army_ocp_aa",
		"rhsusf_army_ocp_uav",	
		"rhsusf_army_ocp_medic",	
		"rhsusf_army_ocp_engineer",
		"rhsusf_army_ocp_explosives",
		"rhsusf_army_ocp_marksman",
		"rhsusf_army_ocp_sniper",
		"rhsusf_army_ocp_crewman",	
		"rhsusf_army_ocp_combatcrewman",
		"rhsusf_army_ocp_driver",
		"rhsusf_army_ocp_helipilot",
		"rhsusf_army_ocp_helicrew"
		] call BIS_fnc_selectRandom;

		_veh = _unit createVehicle getMarkerPos _spawnMarker;

		sleep 1;
		[_veh] call INF_fnc_infecthimSelf;
	};
