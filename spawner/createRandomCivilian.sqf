_pos = _this select 0;

randomCivilian = [
"nomi_civ_priestmedium",
"nomi_civ_citizenmedium",
"nomi_civ_woodlandermedium",
"nomi_civ_profiteermedium",
"nomi_civ_workermedium",
"nomi_civ_functionarymedium",
"nomi_civ_villagermedium",
"nomi_civ_doctormedium",
"nomi_civ_priestslow",
"nomi_civ_citizenslow",
"nomi_civ_woodlanderslow",
"nomi_civ_profiteerslow",
"nomi_civ_workerslow",
"nomi_civ_functionaryslow",
"nomi_civ_villagerslow",
"nomi_civ_doctorslow",
"RyanZombieCrawler3",
"RyanZombieCrawler4",
"RyanZombieCrawler5",
"RyanZombieCrawler6",
"RyanZombieCrawler7",
"RyanZombieCrawler8",
"RyanZombieCrawler9",
"RyanZombieCrawler10",
"RyanZombieSpider3",
"RyanZombieSpider4",
"RyanZombieSpider5",
"RyanZombieSpider6",
"RyanZombieSpider7",
"RyanZombieSpider8",
"RyanZombieSpider9",
"RyanZombieSpider10"
];

_grp = creategroup independent;
_zombie = _grp createUnit [randomCivilian call BIS_fnc_selectRandom, _pos, [], 0, "NONE"];

_zombie doMove (getMarkerPos "mrk_finland");

_chosenFace = ["infected2","infected1","zombi","zomboy"] call BIS_fnc_selectRandom;
[[_zombie,_chosenFace], "setCustomFace"] call BIS_fnc_MP;