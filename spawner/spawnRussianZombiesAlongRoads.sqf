
_position = _this select 0;
_count = _this select 1;

for "_i" from 0 to _count do {

_findPosition = [];
while{ count _findPosition < 1} do {
	_findPosition = [getPos _position, [400,700],[90,270],0,[2,200]] call SHK_pos;
};
sleep 0.1;

_grp = creategroup independent;
_zombie = _grp createUnit ["RyanZombie_Russian", _findPosition, [], 0, "NONE"];
sleep 0.5;
_nul = [_zombie] execVM "loadout\russian.sqf";
};