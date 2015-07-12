if (!isServer) exitWith {};

_minDistance = _this select 0;
_maxDistance = _this select 1;

_terrain_zombies = [
z1,
z2,
z3,
z4,
z5,
z6,
z7,
z8,
z9,
z10,
z11,
z12,
z13,
z14,
z15,
z16,
z17,
z18,
z19,
z20,
z21
];

_road_zombies = [
z22,
z23,
z24,
z25,
z26,
z27,
z28,
z29,
z30,
z31,
z32,
z33,
z34,
z35,
z36,
z37,
z38,
z39,
z40,
z41,
z42,
z43,
z44,
z45,
z46,
z47,
z48,
z49,
z50,
z51,
z52,
z53,
z54
];


{
	_pos = [barrel, [_minDistance,_maxDistance], [0,180]] call SHK_pos;
	_x setPos _pos;
	sleep 1;
} forEach _terrain_zombies;


{
	_pos = [barrel, [_minDistance,_maxDistance], [0,180], 0, [2,100]] call SHK_pos;
	_x setPos _pos;
	sleep 1;
} forEach _road_zombies;
sleep 1;