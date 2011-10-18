Map
{
    map-bgcolor: transparent;
}

.highways
{
	line-color: #ffffb3;
	line-join: round;
	line-cap: round;
}
.highways[scale-denominator>=1000000]
{
	line-width: 0.7;
}
.highways[scale-denominator>=200000][scale-denominator<1000000]
{
	line-width: 1.3;
}
.highways[scale-denominator>=60000][scale-denominator<200000][TYPE='primary']
{
	line-width: 4;
}
.highways[scale-denominator>=60000][scale-denominator<200000][TYPE='trunk']
{
	line-width: 4;
}
.highways[scale-denominator>=60000][scale-denominator<200000][TYPE='secondary']
{
	line-width: 3.5;
}
.highways[scale-denominator>=60000][scale-denominator<200000][TYPE='tertiary']
{
	line-width: 2.5;
}
.highways[scale-denominator>=60000][scale-denominator<200000]
{
	line-width: 1.5;
}
.highways[scale-denominator<60000][TYPE='primary']
{
	line-width: 7;
}
.highways[scale-denominator<60000][TYPE='trunk']
{
	line-width: 7;
}
.highways[scale-denominator<60000][TYPE='secondary']
{
	line-width: 6;
}
.highways[scale-denominator<60000][TYPE='tertiary']
{
	line-width: 5;
}
.highways[scale-denominator<60000]
{
	line-width: 4;
}

.highways-borders
{
	line-color: #6b6a00;
	line-join: round;
	line-cap: round;
}
.highways-borders[scale-denominator>=60000][scale-denominator<200000][TYPE='primary']
{
	line-width: 5;
}
.highways-borders[scale-denominator>=60000][scale-denominator<200000][TYPE='trunk']
{
	line-width: 5;
}
.highways-borders[scale-denominator>=60000][scale-denominator<200000][TYPE='secondary']
{
	line-width: 4.5;
}
.highways-borders[scale-denominator>=60000][scale-denominator<200000][TYPE='tertiary']
{
	line-width: 3.5;
}
.highways-borders[scale-denominator>=60000][scale-denominator<200000]
{
	line-width: 2.5;
}
.highways-borders[scale-denominator<60000][TYPE='primary']
{
	line-width: 8;
}
.highways-borders[scale-denominator<60000][TYPE='trunk']
{
	line-width: 8;
}
.highways-borders[scale-denominator<60000][TYPE='secondary']
{
	line-width: 7;
}
.highways-borders[scale-denominator<60000][TYPE='tertiary']
{
	line-width: 6;
}
.highways-borders[scale-denominator<60000]
{
	line-width: 5;
}

.borders
{
	line-color: #ff0000;
	line-join: bevel;
	line-dasharray: 10,5;
}
.borders[ADMIN_LEVE="1"]
{
	line-width: 3;
}
.borders[ADMIN_LEVE="2"]
{
	line-width: 3;
}
.borders[scale-denominator<300000][ADMIN_LEVE="3"]
{
	line-width: 2.5;
}
.borders[scale-denominator<300000][ADMIN_LEVE="4"]
{
	line-width: 2.5;
}
.borders[scale-denominator<300000][ADMIN_LEVE="5"]
{
	line-width: 1.5;
}
.borders[scale-denominator<300000][ADMIN_LEVE="6"]
{
	line-width: 1.5;
}

.places NAME
{
    text-face-name: "DejaVu Sans Book";
    text-fill: #000000;
    text-halo-fill: #ffff99;
    text-halo-radius: 1;
    text-size: 0;
}
.places[scale-denominator>=30000][scale-denominator<300000] NAME
{
    text-size: 12;
}
.places[scale-denominator>=300000][scale-denominator<600000][PLACE="city"] NAME
{
    text-size: 12;
}
.places[scale-denominator>=30000][scale-denominator<300000][PLACE="county"] NAME
{
    text-size: 14;
}
.places[scale-denominator>=30000][scale-denominator<600000][PLACE="country"] NAME
{
    text-size: 16;
}
.places[scale-denominator>=600000][PLACE="city"] NAME
{
    text-size: 10;
}
.places[scale-denominator>=600000][PLACE="country"] NAME
{
    text-size: 14;
}
