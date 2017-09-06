sleep 2;
titleText ["Y O U   M A D E   I T !","PLAIN"]; 
titleFadeOut 7;
sleep 5;


if (isServer) then {
	[[getMarkerPos "mrk_rocket_ce", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_li", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ri", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_la", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ra", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 10;
	[[getMarkerPos "mrk_rocket_ce2", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_li2", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ri2", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_la", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ra", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 10;
	[[getMarkerPos "mrk_rocket_ce", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_li", 'random','random'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ri", 'random','random'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_la", 'random','random'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ra", 'random','random'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 10;
	[[getMarkerPos "mrk_rocket_ce2", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_li2", 'random','random'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ri2", 'random','random'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_la2", 'random','random'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ra2", 'random','random'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 10;
	[[getMarkerPos "mrk_rocket_ce", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP;  
	sleep 2;
	[[getMarkerPos "mrk_rocket_li", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ri", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_la", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ra", 'normal','white'] ,"callFireworks",true,true] spawn BIS_fnc_MP;
	sleep 10;
	[[getMarkerPos "mrk_rocket_ce2", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_li2", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ri2", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	sleep 2;
	[[getMarkerPos "mrk_rocket_la", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
	[[getMarkerPos "mrk_rocket_ra", 'fizzer','red'] ,"callFireworks",true,true] spawn BIS_fnc_MP; 
} else {
	sleep 28;
	titleText ["C E L E B R A T I N G   O N E   Y E A R   G R U P P E   A D L E R","PLAIN"]; 
	titleFadeOut 7;
	sleep 46;
};

/*
sleep 10;
titleText ["M I S S I O N   A C C O M P L I S H E D","PLAIN"]; 
titleFadeOut 7;
sleep 10;
*/

_credits = [

 [ "M I S S I O N   B Y", ["nomisum"] ],

 [ "T E S T I N G", ["Fusselwurm","t2_name2","t2_name3"] ],

 [ "T H A N K S", ["Gruppe Adler","ACE3 Team","Red Hammer Studios", "Felix Linker (FUPS)", "BIS - you rock"] ],

 [ "D I S C L A I M E R", ["All events and persons in this mission were fictional."] ]

 ];

_layer = "credits1" call bis_fnc_rscLayer;

_delay = 7;

_duration = _delay / 1.5;

{

	_title = [_x,0,""] call bis_fnc_paramin;

	_names = _x select 1;

	_text = format ["<t font='PuristaBold'>%1</t>",toUpper (_title)] + "<br />";

	{

		 _text = _text + _x + "<br />";

	} foreach _names;

	_text = format ["<t size='0.8'>%1</t>",_text];

	
	


	disableserialization;

	

	_fadeTime = 0.5;

	_time = time + _duration - _fadeTime;


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
	while {time < _time} do
	{
		_modifier = _modifier - 0.005;
		_posTmp = [_posX, _posY + _modifier,_posW,_posH];
		_ctrlText ctrlsetposition _posTmp;
		_ctrlText ctrlcommit 0;
		sleep 0.02;
	};

	_time = time + _delay;

	while {time < _time} do
	{
		_modifier = _modifier - 0.005;
		_posTmp = [_posX, _posY + _modifier,_posW,_posH];
		_ctrlText ctrlsetposition _posTmp;
		_ctrlText ctrlcommit 0;
		sleep 0.02;
	};

	waituntil {time > _time};

} foreach _credits;

"end1" call BIS_fnc_endMission;
