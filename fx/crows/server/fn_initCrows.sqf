GRAD_CROWS_DEBUG = false;

GRAD_CROWS_STARTLING_DISTANCE = 200;
GRAD_MAX_CROWS_COUNT = 11;
GRAD_MAX_TREES = 3; // max trees where crows come from

{
	_firedEH = _x addEventHandler ["FiredMan",{
		[getPos (_this select 0)] call suomen_fx_fnc_registerShot;
	}];
} forEach allUnits;