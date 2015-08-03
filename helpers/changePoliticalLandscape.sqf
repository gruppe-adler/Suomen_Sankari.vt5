AI_KILLED = AI_KILLED + 2; publicVariable "AI_KILLED";

rus_emptytruck1 setPos (getMarkerPos "mrk_rus_emptytruck1");
rus_emptytruck2 setPos (getMarkerPos "mrk_rus_emptytruck2");
rus_emptytruck3 setPos (getMarkerPos "mrk_rus_emptytruck3");
rus_emptytruck4 setPos (getMarkerPos "mrk_rus_emptytruck4");

usmc_emptytruck1 setPos (getMarkerPos "mrk_usmc_emptytruck1");
usmc_emptytruck2 setPos (getMarkerPos "mrk_usmc_emptytruck2");
usmc_emptytruck3 setPos (getMarkerPos "mrk_usmc_emptytruck3");
usmc_emptytruck4 setPos (getMarkerPos "mrk_usmc_emptytruck4");

usmc_headquarter setDamage 1;
explo_truck setDamage 1; 

{ deleteVehicle _x } forEach units (leader blufor_lead);
sleep 5;
{ deleteVehicle _x } forEach units (leader rus_group_1);
sleep 5;
{ deleteVehicle _x } forEach units (leader rus_group_2);
sleep 5;

rus_btr setDamage 1;
sleep 3;
rus_tripod setDamage 1;
rus_patrol_gaz setDamage 1;
sleep 5;
repair_truck setDamage 1;
sleep 10;
{deleteVehicle _x;}forEach crew civ_truck;
{deleteVehicle _x;}forEach crew civ_car;
nul = [getpos civ_truck] execVM "spawner\createRandomCivilian.sqf";
nul = [getpos civ_car] execVM "spawner\createRandomCivilian.sqf";

civ_truck setVehicleLock "UNLOCKED";
civ_car setVehicleLock "UNLOCKED";

{
	if (side _x != independent) then {
	_x setBehaviour "COMBAT";
	};
} forEach allUnits;