Map
{
    map-bgcolor: transparent;
}

.places
{
	shield-face-name: "DejaVu Sans Book";
	shield-fill: #000000;
	shield-halo-radius: 1;
	shield-avoid-edges: true;
	shield-dy: -12;
}

.lplaces
{
	shield-face-name: "DejaVu Sans Book";
	shield-fill: #000000;
	shield-halo-radius: 1;
	shield-avoid-edges: true;
	shield-dy: -12;
}

.places-hi
{
	text-face-name: "DejaVu Sans Book";
	text-fill: #000000;
	text-halo-radius: 1;
	text-avoid-edges: true;
}

.places[scale-denominator>=40000]
{
	shield-file: url("place-small.png");
}
.lplaces[scale-denominator>=40000][rank=2]
{
	shield-file: url("place-medium.png");
}
.lplaces[scale-denominator>=40000][rank=1]
{
	shield-file: url("place-large.png");
}

.structures[scale-denominator<=40000]
{
	polygon-fill: #ffff00;
	line-color: #000000;
	line-width: 0.3;
}

.structures-outline[scale-denominator<=40000]
{
	line-color: #000000;
	line-width: 0.5;
}

.mounds[scale-denominator>20000][scale-denominator<=40000]
{
	point-file: url("mounds-small.png");
}

.stelae[scale-denominator>20000][scale-denominator<=40000]
{
	point-file: url("stelae-small.png");
}

.chultuns[scale-denominator>20000][scale-denominator<=40000]
{
	point-file: url("chultuns-small.png");
}

.mounds[scale-denominator<=20000]
{
	point-file: url("mounds.png");
}

.stelae[scale-denominator<=20000]
{
	point-file: url("stelae.png");
}

.chultuns[scale-denominator<=20000]
{
	point-file: url("chultuns.png");
}

.places-hi[scale-denominator<40000] BWNAME
{
	text-size: 14;
}

.places[scale-denominator>=40000][scale-denominator<600000] BWNAME
{
    shield-size: 12;
}
.places[scale-denominator>=600000] BWNAME
{
	shield-size: 10;
}

.lplaces[scale-denominator>=40000][scale-denominator<600000][rank<=2] BWNAME
{
    shield-size: 12;
}
.lplaces[scale-denominator>=600000][rank<=2] BWNAME
{
	shield-size: 10;
}
