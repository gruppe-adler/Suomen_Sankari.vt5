call suomen_mission_fnc_setupGroupIds;

call compile preprocessfile "node_modules\shk_pos\functions\shk_pos_init.sqf";

// tfar shit
TF_give_microdagr_to_soldier = false;
publicVariable "TF_give_microdagr_to_soldier";

tf_no_auto_long_range_radio = true; //Long Range Radio an GrpFhr austeilen? - ja ^ nein
publicVariable "tf_no_auto_long_range_radio";

tf_same_sw_frequencies_for_side = true; //Selbe Freuquenzen für Fraktion? - ja ^ nein
publicVariable "tf_same_sw_frequencies_for_side";

// "Debug tools"//

"mrk_spawn_f" setMarkerAlphaLocal 0;
"mrk_spawn_r" setMarkerAlphaLocal 0;
"mrk_spawn_tankstelle" setMarkerAlphaLocal 0;
"mrk_blufor_patrol" setMarkerAlphaLocal 0;
"mrk_spawn_crowd" setMarkerAlphaLocal 0;
"mrk_spawn_crowd2" setMarkerAlphaLocal 0;
"mrk_spawn_crowd3" setMarkerAlphaLocal 0;

player setVariable ["isSpectator", "false", false];



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
setViewDistance 2000;

DEBUG = true;

GAS_EFFECTED = 0;
NUKE_DETONATE = false;
EXPLOSIVE_PLANTED = false;
ENEMIES_DETECTED = false;
FIGHT = false;

AI_KILLED = 0;
EXTRACTION_IMMINENT = false;
firstspawn = false;

execVM "fx\init.sqf";

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

ryanzombiesglow = true;
// ryanzombiesstartinganim = 0;
Ryanzombiesfeed = 1;
ryanzombiescivilianattacks = true;
