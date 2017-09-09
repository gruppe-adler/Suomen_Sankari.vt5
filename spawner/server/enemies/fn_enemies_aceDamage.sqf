params ["_target", "_damageDealt"];

_damageDealt = _damageDealt; // * RZ_ACEDamageMultiplier;

_selection = selectRandom ace_medical_selections;

if(isPlayer _target) then 
{
	[-2,
	{
		params ["_target","_damageDealt","_selection"];
		if(player == _target) then 
		{
			[_target, _damageDealt, _selection, "bullet"] call ace_medical_fnc_addDamageToUnit;
		};
	},[_target,_damageDealt,_selection]] call CBA_fnc_globalExecute; // CBA is required by ACE3 anyway, so let's not complicate things.
	 
} else { // note that this damage won't be applied to AI group members of a player-led team on a server (because AIs are local to group leader) - low priority...
	[_target, _damageDealt, _selection, "bullet"] call ace_medical_fnc_addDamageToUnit;
};