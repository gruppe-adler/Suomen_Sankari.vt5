{
	if ((!(isPlayer leader _x)) && side _x == east) then  {
		[_x, west] call suomen_mission_fnc_changeSides;
	};

} forEach allGroups;