{
	if (!(isPlayer leader _x)) then  {
		[_x, west] call suomen_mission_fnc_changeSides;
	};

} forEach allGroups;