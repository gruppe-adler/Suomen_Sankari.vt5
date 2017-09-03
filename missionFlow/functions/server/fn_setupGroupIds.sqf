
{
	_x setIdentity (str _x);

} forEach playableUnits + switchableUnits;

_markerText = "";
{ 
	_markerText = _markerText + name _x + ", "
} forEach units group player;

_marker = createMarkerLocal ["mrk_startposition", position player];
_marker setMarkerTypeLocal "hd_dot";
_marker setMarkerShapeLocal "ICON";
_marker setMarkerColorLocal "ColorOpfor";
_marker setMarkerTextLocal _markerText;

/*
Santeri, Marek, Fritjof, Lenni -> Fahrräder -> Studenten

Henrik, Toini, Mikael, Rasmus -> Bikes -> Bikergang

Sampo, Tuomas, Ilpo, Ossi -> VW Golf -> Proleten

Kimmo, Janne, Eino, Hemmo -> GAZ blau -> Azubis

Ville, Marco, Esa, Emppu -> Jeep Wrangler -> Coolen

Tommi, Mari, Antti, Pekka -> Skoda -> Worker

Frederik -> Traktor -> Bauer
*/
