if (!DEBUG) then {
	[] spawn {
		0 fadeSound 0;
		waitUntil{!(isNil "BIS_fnc_init")};
		waitUntil {!isNull player};
		titleText ["<t size='3' color='#FFFFFF'>S U O M E N   S A N K A R I</t>", "BLACK FADED",8,true,true];
		playMusic "AmbientTrack02_F_Orange";
		10 fadeSound 1;
		sleep 7;
		// titleText ["", "BLACK FADED", 2]; // Black screen
		// sleep 5; // Waits 5 seonds
		titleText ["", "BLACK IN", 10]; // Black screen dissapears
	
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