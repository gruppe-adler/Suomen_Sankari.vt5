STARTLING_DISTANCE = 200;

{
	_firedEH = _x addEventHandler ["FiredMan",{
		[getPos (_this select 0)] call suomen_fx_fnc_registerShot;
	}];
} forEach allUnits;