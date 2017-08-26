params ["_pos"];

_pos params ["_xPos", "_yPos", "_zPos"];

_pos set [0, _xPos + random 5 - random 10];
_pos set [1, _yPos + random 5 - random 10];
_pos set [2, _zPos + random 5 - random 2.5];

_pos