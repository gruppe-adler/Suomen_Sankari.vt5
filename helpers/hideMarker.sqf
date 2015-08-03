group_sampo = [
	"sampo",
	"ossi",
	"tuomas",
	"ilpo"
];

group_kimmo = [
	"kimmo",
	"janne",
	"eino",
	"hemmo",
	"henrik",
	"toini"
];

group_tommi = [
	"tommi",
	"mari",
	"antti",
	"pekka"
];

group_ville = [
	"ville",
	"marco",
	"emppu",
	"esa",
	"santeri",
	"marek",
	"frederik",
	"fritjof"
];

group_kalle = [
	"kalle"
];


_identity = format ["%1",player];


if !(_identity in group_sampo) then {"mrk_sampo" setMarkerAlphaLocal 0;};
if !(_identity in group_kimmo) then {"mrk_kimmo" setMarkerAlphaLocal 0;};
if !(_identity in group_tommi) then {"mrk_tommi" setMarkerAlphaLocal 0;};
if !(_identity in group_ville) then {"mrk_ville" setMarkerAlphaLocal 0;};
if !(_identity in group_kalle) then {"mrk_kalle" setMarkerAlphaLocal 0;} else {[] execVM "helpers\radio.sqf";};

"mrk_sampo" setMarkerTextLocal _identity;
"mrk_kimmo" setMarkerTextLocal _identity;
"mrk_tommi" setMarkerTextLocal _identity;
"mrk_ville" setMarkerTextLocal _identity;
"mrk_kalle" setMarkerTextLocal _identity;
