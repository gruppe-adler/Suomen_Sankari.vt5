/*
[russian_radio, russian_radio_dummy] call suomen_fx_fnc_createRadio;
*/

params ["_item", "_dummyItem"];

_item setVariable ["suomen_isRadio", true];
_item setVariable ["suomen_radioObject", _dummyItem];

_item say3d ["russian_radio",40];

_item addEventHandler ["Hit", {
	(_this select 0) removeAllEventHandlers "Hit";
	deleteVehicle ((_this select 0) getVariable ["suomen_radioObject", objNull]);
}];