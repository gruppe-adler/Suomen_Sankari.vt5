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

sleep 10;
titleText ["M I S S I O N   A C C O M P L I S H E D","PLAIN"]; 
titleFadeOut 7;
sleep 10;

"end1" call BIS_fnc_endMission;
