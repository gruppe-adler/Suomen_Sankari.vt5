suomen_creditsNext = false;

sleep 20;

_credits = [

 	[ "M I S S I O N", ["nomisum"] ],

 	[ "T E S T I N G", ["Fusselwurm"] ],

 	[ "C R E D I T S", ["Gruppe Adler","ACE3","Red Hammer Studios", "Ryan Dombrowsky (Ryanzombies)", "Reyhard (RDS)", "Bohemia Interactive"] ],

 	[ "T O   B E   C O N T I N U E D", [""] ]

 ];

_getText = {
	params ["_credit"];

	_headline = [_credit,0,""] call bis_fnc_paramin;
	_sublines = _credit select 1;
	_text = format ["<t font='PuristaBold'>%1</t>",toUpper (_headline)] + "<br />";

	{ _text = _text + _x + "<br />"; } foreach _sublines;

	_text = format ["<t size='0.8'>%1</t>",_text];

	_text
};

_moveUp = {
		params ["_text", "_layer", "_isLast"];

		private ["_moveToPosition", "_isOnHalf"];

		_isOnHalf = false;

		if (_isLast) then {
			_moveToPosition = -((safezoneH / 2) + 0.1);
		} else {
			_moveToPosition = -(safezoneH + 0.5);
		};

		disableSerialization;		

		_layer cutrsc ["RscDynamicText","plain"];

		_display = uinamespace getvariable ["BIS_dynamicText",displaynull];
		_ctrlText = _display displayctrl 9999;
		_ctrlText ctrlsetstructuredtext parsetext _text;

		_offsetX = 0.5;
		_offsetY = 0.5;	

		_posW = 0.4;
		_posH = ctrltextheight _ctrlText + _offsetY;

		_posX = (safezoneX + 0.5 * safezoneW)-_posW/2;
		_posY = safeZoneY+ safezoneH + 0.1;// 0.5 * safezoneH) -_posH/2;

		_pos = [_posX,_posY,_posW,_posH];

		_ctrlText ctrlsetposition _pos;
		_ctrlText ctrlsetfade 0;
		_ctrlText ctrlcommit 0;

		_modifier = 0;
		while {_modifier > _moveToPosition} do
		{
			_modifier = _modifier - 0.005;
			_posTmp = [_posX, _posY + _modifier,_posW,_posH];
			if (_posY + _modifier < (safeZoneY+ safezoneH/2) && !_isOnHalf) then {
				_isOnHalf = true;
				suomen_creditsNext = true;
			};
			_ctrlText ctrlsetposition _posTmp;
			_ctrlText ctrlcommit 0;
			uisleep 0.01;
		};
		_fade = 0;
		while {_fade < 1} do
		{
			_fade = _fade + 0.0025;
			_ctrlText ctrlsetfade _fade;
			_ctrlText ctrlcommit 0;
			uisleep 0.01;
		};
		if (_isLast) then { true } else { false	};
};


{
	_layername = "credits" + str (_forEachIndex + 1);
	_layer = _layername call bis_fnc_rscLayer;
	_text = [_x] call _getText;
	
	if (_forEachIndex isEqualTo (count _credits - 1)) then {
		_finished = [_text, _layer, true] spawn _moveUp;
		waitUntil { scriptDone _finished };
		
	} else {
		[_text, _layer, false] spawn _moveUp;
	};

	waitUntil {suomen_creditsNext};
	suomen_creditsNext = false;

} forEach _credits;

titleText ["", "BLACK OUT", 10];
10 fadeSound 0;

["end1",true,10,false,true] call BIS_fnc_endMission;