AI_KILLED = AI_KILLED + 2; publicVariable "AI_KILLED";


usmc_emptytruck1 setPosASL (getMarkerPos "mrk_usmc_emptytruck1");
usmc_emptytruck2 setPosASL (getMarkerPos "mrk_usmc_emptytruck2");
usmc_emptytruck3 setPosASL (getMarkerPos "mrk_usmc_emptytruck3");
usmc_emptytruck4 setPosASL (getMarkerPos "mrk_usmc_emptytruck4");

usmc_emptytruck1 setDamage 1;
usmc_emptytruck2 setDamage 1;
usmc_emptytruck3 setDamage 1;
usmc_emptytruck4 setDamage 1;


{ deleteVehicle _x } forEach units (leader blufor_lead);
sleep 5;
{ deleteVehicle _x } forEach units (leader rus_group_1);
sleep 5;

rus_btr setDamage 1;
sleep 3;
rus_patrol_gaz setDamage 1;
sleep 5;
repair_truck setDamage 1;
sleep 10;
{deleteVehicle _x;}forEach crew civ_car;
nul = [getpos civ_car] execVM "spawner\createRandomCivilian.sqf";

civ_car setVehicleLock "UNLOCKED";

{
	if (side _x != independent) then {
	_x setBehaviour "COMBAT";
	};
} forEach allUnits;