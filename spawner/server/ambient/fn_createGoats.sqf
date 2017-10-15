_goatPos = getMarkerPos "mrk_goats";
_chickenPos = getMarkerPos "mrk_chicken";

_goatGroup = createGroup Civilian;
_chickenGroup = createGroup Civilian;

for "_i" from 0 to 7 do {
	_goatGroup createUnit ["Goat_random_F", _goatPos,[],0,"NONE"];
};

for "_i" from 0 to 15 do {
	_chickenGroup createUnit ["Hen_random_F", _chickenPos,[],0,"NONE"];
};

_chickenGroup createUnit ["Cock_random_F", _chickenPos,[],0,"NONE"];

[
	"GRAD_CivilianZed_rds_uniform_citizen4_walker", 
	"Hen_random_F",
	"mrk_goats",
	"mrk_chicken"
] call suomen_spawner_fnc_createGoatCarrier;