Map
{
    map-bgcolor: transparent;
}

.elevation
{
	raster-mode: normal;
}

.water
{
	polygon-fill: #0050ff;
}

.coastline
{
	line-color: #0030ff;
	line-width: 0.5;
}

.contours-100[scale-denominator>600000][scale-denominator<=2000000]
{
	line-color: #444444;
	line-width: 0.5;
	line-opacity: 0.7;
}
.contours-100[scale-denominator<=70000][scale-denominator>40000][height>0] height
{
	text-face-name: "DejaVu Sans Book";
	text-size: 10;
	text-fill: #000000;
	text-halo-radius: 1;
	text-placement: line;
	text-avoid-edges: true;
	text-max-char-angle-delta: 45;
}
.contours-50[scale-denominator>100000][scale-denominator<=600000]
{
	line-color: #444444;
	line-width: 0.5;
	line-opacity: 0.7;
}
.contours-50[scale-denominator<=40000][scale-denominator>20000][height>0] height
{
	text-face-name: "DejaVu Sans Book";
	text-size: 10;
	text-fill: #000000;
	text-halo-radius: 1;
	text-placement: line;
	text-avoid-edges: true;
	text-max-char-angle-delta: 45;
}
.contours-10[scale-denominator<=100000][scale-denominator>10000]
{
	line-color: #444444;
	line-width: 0.5;
	line-opacity: 0.7;
}
.contours-10[scale-denominator<=20000][scale-denominator>10000][height>0] height
{
	text-face-name: "DejaVu Sans Book";
	text-size: 10;
	text-fill: #000000;
	text-halo-radius: 1;
	text-placement: line;
	text-avoid-edges: true;
	text-max-char-angle-delta: 45;
}

.contours-5[scale-denominator<=20000][scale-denominator>10000]
{
	line-color: #888888;
	line-width: 0.3;
	line-opacity: 0.7;
}
.contours-5[scale-denominator<=10000]
{
	line-color: #444444;
	line-width: 0.5;
	line-opacity: 0.7;
}
.contours-5[scale-denominator<=10000][height>0] height
{
	text-face-name: "DejaVu Sans Book";
	text-size: 10;
	text-fill: #000000;
	text-halo-radius: 1;
	text-placement: line;
	text-avoid-edges: true;
	text-max-char-angle-delta: 45;
}

.rivers-border
{
	line-color: #0030ff;
	line-join: bevel;
	line-cap: butt;
	line-opacity: 0.8;
}
.rivers-border[scale-denominator<100000]
{
	line-width: 2.1;
}
.rivers-border[scale-denominator<100000][SIZE='Small river']
{
	line-width: 2.1;
}
.rivers-border[scale-denominator<100000][SIZE='Small River']
{
	line-width: 2.1;
}
.rivers-border[scale-denominator<100000][RANK='Small']
{
	line-width: 2.1;
}
.rivers-border[scale-denominator<100000][SIZE='Small to large rivers']
{
	line-width: 2.6;
}
.rivers-border[scale-denominator<100000][RANK='Minor']
{
	line-width: 2.6;
}
.rivers-border[scale-denominator<100000][SIZE='Medium river']
{
	line-width: 3.1;
}
.rivers-border[scale-denominator<100000][RANK='Medium']
{
	line-width: 3.1;
}
.rivers-border[scale-denominator<100000][SIZE='Large river']
{
	line-width: 3.6;
}
.rivers-border[scale-denominator<100000][SIZE='Headwater stream']
{
	line-width: 3.6;
}
.rivers-border[scale-denominator<100000][RANK='Major']
{
	line-width: 3.6;
}
.rivers-border[scale-denominator<100000][RANK='Primary']
{
	line-width: 3.6;
}

.rivers
{
	line-color: #0050ff;
	line-join: bevel;
	line-cap: butt;
	line-opacity: 0.8;
}
.rivers[scale-denominator>600000]
{
	line-width: 0.5;
}
.rivers[scale-denominator>=300000][scale-denominator<=600000]
{
	line-width: 0.7;
}
.rivers[scale-denominator>=100000][scale-denominator<300000]
{
	line-width: 1.5;
}
.rivers[scale-denominator<100000]
{
	line-width: 1.5;
}
.rivers[scale-denominator<100000][SIZE='Small river']
{
	line-width: 1.5;
}
.rivers[scale-denominator<100000][SIZE='Small River']
{
	line-width: 1.5;
}
.rivers[scale-denominator<100000][RANK='Small']
{
	line-width: 1.5;
}
.rivers[scale-denominator<100000][SIZE='Small to large rivers']
{
	line-width: 2;
}
.rivers[scale-denominator<100000][RANK='Minor']
{
	line-width: 2;
}
.rivers[scale-denominator<100000][SIZE='Medium river']
{
	line-width: 2.5;
}
.rivers[scale-denominator<100000][RANK='Medium']
{
	line-width: 2.5;
}
.rivers[scale-denominator<100000][SIZE='Large river']
{
	line-width: 3;
}
.rivers[scale-denominator<100000][SIZE='Headwater stream']
{
	line-width: 3;
}
.rivers[scale-denominator<100000][RANK='Major']
{
	line-width: 3;
}
.rivers[scale-denominator<100000][RANK='Primary']
{
	line-width: 3;
}
