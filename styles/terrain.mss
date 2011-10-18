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

.rivers
{
	line-color: #0050ff;
	line-join: bevel;
	line-cap: round;
	line-opacity: 0.8;
}
.rivers[scale-denominator>1000000]
{
	line-width: 0.7;
}
.rivers[scale-denominator>=200000][scale-denominator<=1000000]
{
	line-width: 1.3;
}
.rivers[scale-denominator>=50000][scale-denominator<200000]
{
	line-width: 3;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][SIZE='Small river']
{
	line-width: 3;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][SIZE='Small River']
{
	line-width: 3;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][RANK='Small']
{
	line-width: 3;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][SIZE='Small to large rivers']
{
	line-width: 3.5;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][RANK='Minor']
{
	line-width: 3.5;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][SIZE='Medium river']
{
	line-width: 4;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][RANK='Medium']
{
	line-width: 4;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][SIZE='Large river']
{
	line-width: 4.5;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][SIZE='Headwater stream']
{
	line-width: 4.5;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][RANK='Major']
{
	line-width: 4.5;
}
.rivers[scale-denominator>=50000][scale-denominator<200000][RANK='Primary']
{
	line-width: 4.5;
}
.rivers[scale-denominator<50000]
{
	line-width: 4.5;
}
.rivers[scale-denominator<50000][SIZE='Small river']
{
	line-width: 4.5;
}
.rivers[scale-denominator<50000][SIZE='Small River']
{
	line-width: 4.5;
}
.rivers[scale-denominator<50000][RANK='Small']
{
	line-width: 4.5;
}
.rivers[scale-denominator<50000][SIZE='Small to large rivers']
{
	line-width: 5.5;
}
.rivers[scale-denominator<50000][RANK='Minor']
{
	line-width: 5.5;
}
.rivers[scale-denominator<50000][SIZE='Medium river']
{
	line-width: 6.5;
}
.rivers[scale-denominator<50000][RANK='Medium']
{
	line-width: 6.5;
}
.rivers[scale-denominator<50000][SIZE='Large river']
{
	line-width: 7.5;
}
.rivers[scale-denominator<50000][SIZE='Headwater stream']
{
	line-width: 7.5;
}
.rivers[scale-denominator<50000][RANK='Major']
{
	line-width: 7.5;
}
.rivers[scale-denominator<50000][RANK='Primary']
{
	line-width: 8.5;
}
