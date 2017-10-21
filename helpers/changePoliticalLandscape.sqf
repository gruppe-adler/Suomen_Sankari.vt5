AI_KILLED = AI_KILLED + 2; publicVariable "AI_KILLED";

{
	_x setVariable ["ace_cookoff_enable", false, true];
	_x setVariable ["ace_cookoff_enableAmmoCookoff", false, true];
	_x setDamage [1, false];
} forEach [
	rus_btr,
	usmc_emptytruck1,
	usmc_emptytruck2,
	rus_btr,
	rus_patrol_gaz,
	repair_truck
];

usmc_emptytruck1 setPos (getMarkerPos "mrk_usmc_emptytruck1");
usmc_emptytruck2 setPos (getMarkerPos "mrk_usmc_emptytruck2");


ambient_worker_1 setDamage 1;
ambient_worker_2 setDamage 1;
ambient_worker_3 setDamage 1;
blufor_buschecker setDamage 1;
tourist setDamage 1;

{ deleteVehicle _x } forEach units (leader rus_group_1);
{ _x linkItem "mask_m50"; _x setHitPointDamage ["hitLegs", 1];} forEach units (leader blufor_lead);
{ _x setDamage 1; } forEach units (leader blufor_patrol1);

sleep 5;

{deleteVehicle _x;}forEach crew civ_car;
[getpos civ_car] call suomen_spawner_fnc_createRandomCivilian;

civ_car setVehicleLock "UNLOCKED";

{
	if (side _x != independent) then {
	_x setBehaviour "COMBAT";
	};
} forEach allUnits;



[] call suomen_mission_fnc_createReinforcementsNE;