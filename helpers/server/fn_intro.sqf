if (!DEBUG) then {
	0 fadeSound 0;
	playMusic "AmbientTrack02_F_Orange";
	[] spawn {
		
		waitUntil{!(isNil "BIS_fnc_init")};
		waitUntil {!isNull player};
		titleText ["<t size='3' color='#FFFFFF'>S U O M E N   S A N K A R I</t>", "BLACK FADED",8,true,true];
		sleep 7;
		// titleText ["", "BLACK FADED", 2]; // Black screen
		// sleep 5; // Waits 5 seonds
		titleText ["", "BLACK IN", 10]; // Black screen dissapears
		10 fadeSound 1;
	
		[ 
				["SOMEWHERE NEAR","font = 'PuristaSemiBold'"],
				["","<br/>"],
				["THE FINNISH-RUSSIAN","font = 'PuristaSemiBold'"],
				["","<br/>"],
				["BORDER...","font = 'PuristaSemiBold'"]
		]  execVM "\a3\missions_f_bootcamp\Campaign\Functions\GUI\fn_SITREP.sqf";
		// ["Somewhere","near the finnish-", "russian border"] call BIS_fnc_infoText; // Shows your message
	};
};