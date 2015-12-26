// tfar shit
TF_give_microdagr_to_soldier = true;
publicVariable "TF_give_microdagr_to_soldier";

tf_no_auto_long_range_radio = true; //Long Range Radio an GrpFhr austeilen? - ja ^ nein
publicVariable "tf_no_auto_long_range_radio";

tf_same_sw_frequencies_for_side = true; //Selbe Freuquenzen für Fraktion? - ja ^ nein
publicVariable "tf_same_sw_frequencies_for_side";

// "Debug tools"//

"mrk_spawn_f" setMarkerAlphaLocal 0;
"mrk_spawn_r" setMarkerAlphaLocal 0;
"mrk_spawn_c" setMarkerAlphaLocal 0;
"mrk_not_here" setMarkerAlphaLocal 0;
"mrk_not_here_too" setMarkerAlphaLocal 0;
"mrk_blufor_patrol" setMarkerAlphaLocal 0;
"mrk_spawn_crowd" setMarkerAlphaLocal 0;
"mrk_spawn_crowd2" setMarkerAlphaLocal 0;
"mrk_spawn_crowd3" setMarkerAlphaLocal 0;

player setVariable ["isSpectator", "false", false];

_nul = [] execVM "helpers\hideMarker.sqf";

// FIREWORKS
callFireworks = compile preprocessFileLineNumbers "fireworks\callFireworks.sqf";
_nul = [] execVM "fireworks\fireworks.sqf";

// SPECTATOR
[] execVM "CSSA3\CSSA3_init.sqf";
CSSA3_onlySpectatePlayers = true;

if (isMultiplayer) then {
	titleCut ["", "BLACK FADED", 999];
	[] Spawn {
		waitUntil{!(isNil "BIS_fnc_init")};
		["<br /><br /><img size= '4' shadow='false' image='pic\gruppe-adler.paa'/><br/><br/><br/><t size='1' color='#FFFFFF'>S U O M E N   S A N K A R I</t><br/><br/><br/><t size='0.4' color='#FFFFFF'>G R U P P E   A D L E R   2 0 1 5</t>",0,0,5,2] spawn BIS_fnc_dynamicText;
		
		sleep 7;
		titleText ["Somewhere near the finnish-russian border.","PLAIN"]; 
		titleFadeOut 7;
		titleCut ["", "BLACK IN"];
		sleep 7;
	};
};
//
//["click", "onMapSingleClick", { player setPos _pos; }] call BIS_fnc_addStackedEventHandler; 
enableRadio false; //disable radio messages to be heard and shown in the left lower corner of the screen
0 fadeRadio 0; //mute in-game radio commands
enableSentences false; // disable AI chat


DEBUG = false;

GAS_EFFECTED = 0;

EXPLOSIVE_PLANTED = false;
ENEMIES_DETECTED = false;
FIGHT = false;

AI_KILLED = 0;
EXTRACTION_IMMINENT = false;
firstspawn = false;

kalle addAction  ["<t color=""#93E352"">Turn On Radio</t>",{RADIO_PLAYING = true; publicVariable "RADIO_PLAYING";}, _Args, 0, false, false, "","!(RADIO_PLAYING)  && driver ikarus == _this"];
kalle addAction  ["<t color=""#DD0000"">Turn Off Radio</t>",{RADIO_PLAYING = false; publicVariable "RADIO_PLAYING";}, _Args, 0, false, false, "","(RADIO_PLAYING) && driver ikarus  == _this"];

kalle addAction  ["<t color=""#93E352"">Turn On Interior Light</t>",{LIGHT_ON = true; publicVariable "LIGHT_ON";}, _Args, 0, false, false, "","!(LIGHT_ON)  && driver ikarus == _this"];
kalle addAction  ["<t color=""#DD0000"">Turn Off Interior Light</t>",{LIGHT_ON = false; publicVariable "LIGHT_ON";}, _Args, 0, false, false, "","(LIGHT_ON) && driver ikarus  == _this"];


setCustomFace = 
{ 
	_thisunit = _this select 0;
	_face = _this select 1;
	_thisunit setFace _face;
	_thisunit disableConversation true;
	enableSentences false;
	_thisunit setVariable ["BIS_noCoreConversations", true];
	_thisunit setObjectMaterial [0, "A3\Characters_F\Common\Data\basicbody_injury.rvmat"];
};

if (isServer) then {

	// [] execVM "VCOM_Driving\init.sqf";
	call compile preprocessFileLineNumbers "SHK_pos\shk_pos_init.sqf";
	call compile preprocessFileLineNumbers "police\blingbling.sqf";
	call compile preprocessFileLineNumbers "ShoterAnimation\init.sqf";
	

	[car_police,0.25,false] spawn attachBluelight;
	[car_ambulance,0.25,true] spawn attachBluelight;
	[car_yellowrepair,1] spawn attachYellowlight;


	GAS_EFFECTED = 0;
	publicVariable "GAS_EFFECTED";

	GASMASK_FOUND = false;
	publicVariable "GASMASK_FOUND";

	COMRADES_FOUND = false;
	publicVariable "COMRADES_FOUND";

	JUSSI_FREE = false;
	publicVariable "JUSSI_FREE";

	NUKE_DETONATE = false;
	publicVariable "NUKE_DETONATE";

	RADIO_PLAYING = false;
	publicVariable "RADIO_PLAYING";

	LIGHT_ON = false;
	publicVariable "LIGHT_ON";

	NUKE_DETONATE = false;
	publicVariable "NUKE_DETONATE";

	MISSION_COMPLETED = false;
	publicVariable "MISSION_COMPLETED";

	
	

	if (isMultiplayer) then {
		playerUnits = playableUnits;
	} else {
		playerUnits = switchableUnits;
	};

	if (!isMultiplayer) then {
	{_x disableAI "MOVE"} forEach allUnits;
	{_x disableAI "TARGET"} forEach allUnits;
	{_x disableAI "FSM"} forEach allUnits;
	{_x disableAI "ANIM"} forEach allUnits;
	};


	// friendlies -> enemies
	[] spawn {

	neutralGuys = [
		"neutral1",
		"neutral2",
		"neutral3"
		];
			while {true} do {

				if ((ENEMIES_DETECTED) && !(isMultiplayer)) exitWith {
					{
					if (!isPlayer _x) then {
					_newGroup = createGroup west;
						//hintSilent format ["joining %1", newGroup];
						[_x] joinSilent _newGroup;
					};
					} forEach allUnits;

					sleep 3;
					{_x setBehaviour "AWARE"; sleep (random 1);} forEach allUnits;
				};
				if ((ENEMIES_DETECTED) && (isMultiplayer)) exitWith {
					{

					if (!isPlayer _x && !(str _x in neutralGuys)) then {
					_newGroup = createGroup west;
						//hintSilent format ["joining %1", newGroup];
						[_x] joinSilent _newGroup;
					};
					} forEach allUnits;

					sleep 3;
					{_x setBehaviour "AWARE"; sleep (random 1);} forEach allUnits;
				};
		sleep 5;
		};
	};
	



	/*
	// DEBUG STUFF
	[] spawn {
		while {true} do {
		

		hintSilent format ["russian: %1", animationState russian];
		diag_log format ["russian: %1", animationState russian];
		sleep 1;
		
		};
	};
	*/


	sleep 2;
	{
		if (!isPlayer _x) then {
			_x addEventHandler["killed", {if (isPlayer (_this select 1)) then {AI_KILLED = AI_KILLED + 1; publicVariable "AI_KILLED";};}];
		}
	} forEach allUnits;
	diag_log "killed eventhandler added for every ai unit";


asr_ai3_main_setskills = 0;
	
	{
	_x setSkill ["aimingspeed", 0.4];
	_x setSkill ["spotdistance", 1];
	_x setSkill ["aimingaccuracy", 0.1];
	_x setSkill ["aimingshake", 0.1];
	_x setSkill ["spottime", 1];
	_x setSkill ["spotdistance", 1];
	_x setSkill ["commanding", 1];
	_x setSkill ["general", 1];
	} forEach allUnits;

	diag_log "skill set for every ai unit";

};