_sprengladung = _this select 0;

_sprengladung addAction[
	"<t color=""#ff0000"">Sprengladung aktivieren (25s Timer)</t>",
	{EXPLOSIVE_PLANTED = true; publicVariable "EXPLOSIVE_PLANTED";}, 
	_Args,1,false,false,"","((_target distance _this) < 3) && !(EXPLOSIVE_PLANTED)"
];